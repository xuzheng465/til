# 路径问题

在学习 Golang 时，我使用 vscode 中的 coderunner 运行 Go 文件

比如路径是

```
io
|--redirects
   |--logs
   |--redirects.go
```

```go
package main

import (
	"bufio"
	"compress/gzip"
	"fmt"
	"io"
	"log"
	"os"
	"path/filepath"
	"strings"
)

// numRedirects returns the total number of lines and the number of lines
// with an HTTP redirect
func numRedirects(r io.Reader) (int, int, error) {
	s := bufio.NewScanner(r)
	nLines, nRedirects := 0, 0
	for s.Scan() {
		nLines++
		// Example:
		// 203.252.212.44 - - [01/Aug/1995:03:45:47 -0400] \
		// "GET /ksc.html HTTP/1.0" 200 7280
		fields := strings.Fields(s.Text())
		code := fields[len(fields)-2] // code is one before last
		if code[0] == '3' {           // HTTP redirect is 3XX
			nRedirects++
		}
	}

	if err := s.Err(); err != nil {
		return -1, -1, err
	}

	return nLines, nRedirects, nil
}

func main() {
	matches, err := filepath.Glob("logs/http-*.log*")
	if err != nil {
		log.Fatalf("error: %s", err)
	}

	nLines, nRedirects := 0, 0
	for _, fileName := range matches {
		file, err := os.Open(fileName)
		if err != nil {
			log.Fatalf("error: %s", err)
		}

		var r io.Reader = file
		if strings.HasSuffix(fileName, ".gz") {
			r, err = gzip.NewReader(r)
			if err != nil {
				log.Fatalf("%q - %v", fileName, err)
			}
		}

		nl, nr, err := numRedirects(r)
		if err != nil {
			log.Fatalf("%q - %v", fileName, err)
		}
		nLines += nl
		nRedirects += nr
		file.Close()
	}

	fmt.Printf("%d redirects in %d lines\n", nRedirects, nLines)
}

```

我如果在 io 文件夹下中直接运行 `go run "redirects/redirects.go"` 输出结果不正确 为 `0 redirects in 0 lines`

但在 `io/redirects` 文件夹下运行 `go run "redirects/redirects.go"` 输出结果正确为 `627 redirects in 8000 lines`

这个问题涉及到了 Golang 中文件路径处理的一个重要概念：

1. 相对路径 vs 绝对路径：
   `filepath.Glob("logs/http-*.log*")` 使用的是相对路径。在 Go 程序中，相对路径是相对于程序的当前工作目录（Current Working Directory, CWD），而不是相对于源代码文件的位置。

2. 程序的当前工作目录：
   当你直接运行程序时，CWD 通常是你执行命令的目录，而不是程序文件所在的目录。这就是为什么找不到 "logs" 目录的原因。

3. 解决方案：

   a. 使用绝对路径：

   ```go
   matches, err := filepath.Glob("/path/to/your/project/logs/http-*.log*")
   ```

   b. 更改工作目录：

   ```go
   import "os"

   // 在main函数开始时
   err := os.Chdir("/path/to/your/project")
   if err != nil {
       log.Fatal(err)
   }
   ```

   c. 使用相对于可执行文件的路径：

   ```go
   import (
       "os"
       "path/filepath"
   )

   execPath, err := os.Executable()
   if err != nil {
       log.Fatal(err)
   }
   dir := filepath.Dir(execPath)
   matches, err := filepath.Glob(filepath.Join(dir, "logs", "http-*.log*"))
   ```

4. 最佳实践：
   - 对于配置文件或日志文件，最好使用可配置的路径，允许用户在运行时指定位置。
   - 考虑使用环境变量来设置基础路径。
   - 在开发过程中，可以使用相对于项目根目录的路径，但在部署时要注意路径问题。

为了使代码更加健壮和可配置，你可以这样改进：

```go
import (
    "os"
    "path/filepath"
)

func getLogFiles() ([]string, error) {
    // 首先尝试从环境变量获取日志目录
    logDir := os.Getenv("LOG_DIR")
    if logDir == "" {
        // 如果环境变量未设置，使用相对于可执行文件的路径
        execPath, err := os.Executable()
        if err != nil {
            return nil, err
        }
        logDir = filepath.Join(filepath.Dir(execPath), "logs")
    }

    // 使用filepath.Join来构建路径，这样可以确保跨平台兼容性
    pattern := filepath.Join(logDir, "http-*.log*")
    return filepath.Glob(pattern)
}
```

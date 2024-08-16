# 用 Go 匹配文件

可以使用 `filepath.Glob` 函数来匹配文件。

```go
import "path/filepath"

matches, err := filepath.Glob("logs/http-*.log*")
```

文件名模式:

- `logs/http-*.log*`
- `*` 是通配符,匹配任意字符序列。
- 此模式匹配以 `http-` 开头,`.log` 结尾的文件,扩展名后可能有其他字符。

比如匹配当前目录下所有 `.txt` 文件:

```go
matches, err := filepath.Glob("*.txt")
if err != nil {
  log.Fatal(err)
}
fmt.Println(matches)

```

```go
func getLogPattern() string {
    // 优先级：命令行参数 > 环境变量 > 默认值
    logDir := flag.String("logdir", os.Getenv("LOG_DIR"), "Directory containing log files")
    flag.Parse()

    if *logDir == "" {
        return "logs/http-*.log*"
    }

    return filepath.Join(*logDir, "http-*.log*")
}
```

- 通过命令行参数设置日志目录：./your_program -logdir=/path/to/logs
- 通过环境变量设置日志目录：export LOG_DIR=/path/to/logs && ./your_program
- 如果两者都未设置，则使用默认的 "logs/http-.log" 模式。

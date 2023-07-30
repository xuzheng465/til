# How to delete timeline of subtitle

gpt generates

```go
package main

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"strings"
)

func main() {
	// 检查命令行参数长度
	if len(os.Args) < 2 {
		fmt.Println("Please provide an input file as argument")
		os.Exit(1)
	}
	// 获取输入文件名
	inputFile := os.Args[1]
	// 打开输入文件
	file, err := os.Open(inputFile)
	if err != nil {
		fmt.Println("Unable to open input file:", err)
		os.Exit(1)
	}
	defer file.Close()
	// 创建一个新的Scanner来读取标准输入
	scanner := bufio.NewScanner(file)
	// 创建一个新的正则表达式来匹配时间标记
	regex, _ := regexp.Compile(`^\d+.*$`)
	// 创建一个字符串切片来存储句子
	var sentences []string
	// 使用Scanner逐行读取输入
	for scanner.Scan() {
		line := scanner.Text()
		// 如果这一行匹配时间标记的格式，则跳过这一行
		if regex.MatchString(line) {
			continue
		}
		// 移除行首和行尾的空白字符
		line = strings.TrimSpace(line)
		// 将句子添加到切片中
		sentences = append(sentences, line)
	}
	// 将所有句子连接成一个单独的字符串，并用空格分隔
	text := strings.Join(sentences, " ")
	// 获取输入文件的基本名称
	baseName := filepath.Base(inputFile)
	// 移除扩展名
	baseName = strings.TrimSuffix(baseName, filepath.Ext(baseName))
	// 添加.txt扩展名
	outputFile := baseName + ".txt"
	// 创建输出文件
	outputfile, err := os.Create(outputFile)
	if err != nil {
		fmt.Println("Unable to create output file:", err)
		os.Exit(1)
	}
	defer outputfile.Close()

	// 将结果写入文件
	_, err = outputfile.WriteString(text)
	if err != nil {
		fmt.Println("Unable to write to output file:", err)
		os.Exit(1)
	}
}
```

Avoid write a big string to file, use bufio.NewWriter instead.

```go
package main

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"strings"
)

func main() {
	// 检查命令行参数长度
	if len(os.Args) < 2 {
		fmt.Println("Please provide an input file as argument")
		os.Exit(1)
	}

	// 获取输入文件名
	inputFile := os.Args[1]

	// 打开输入文件
	file, err := os.Open(inputFile)
	if err != nil {
		fmt.Println("Unable to open input file:", err)
		os.Exit(1)
	}
	defer file.Close()

	// 创建一个新的Scanner来读取标准输入
	scanner := bufio.NewScanner(file)

	// 创建一个新的正则表达式来匹配时间标记
	regex, _ := regexp.Compile(`^\d+.*$`)

	// 获取输入文件的基本名称
	baseName := filepath.Base(inputFile)
	// 移除扩展名
	baseName = strings.TrimSuffix(baseName, filepath.Ext(baseName))
	// 添加.txt扩展名
	outputFile := baseName + ".txt"

	// 创建输出文件
	outputfile, err := os.Create(outputFile)
	if err != nil {
		fmt.Println("Unable to create output file:", err)
		os.Exit(1)
	}
	defer outputfile.Close()

	// 创建一个新的 buffered writer
	writer := bufio.NewWriter(outputfile)
	defer writer.Flush()

	// 使用Scanner逐行读取输入
	for scanner.Scan() {
		line := scanner.Text()

		// 如果这一行匹配时间标记的格式，则跳过这一行
		if regex.MatchString(line) {
			continue
		}

		// 移除行首和行尾的空白字符
		line = strings.TrimSpace(line)

		// 将句子直接写入到输出文件中
		if _, err = writer.WriteString(line + " "); err != nil {
			fmt.Println("Unable to write to output file:", err)
			os.Exit(1)
		}
	}

	if err := scanner.Err(); err != nil {
		fmt.Println("Error during scan:", err)
		os.Exit(1)
	}

	// Flush any remaining data in the writer to the file
	if err := writer.Flush(); err != nil {
		fmt.Println("Unable to flush the writer:", err)
		os.Exit(1)
	}

	// 获取当前文件指针的位置
	currentPosition, err := outputfile.Seek(0, os.SEEK_CUR)
	if err != nil {
		fmt.Println("Unable to get the current position of file pointer:", err)
		os.Exit(1)
	}

	// 移动文件指针到文件末尾的前一个字符
	err = outputfile.Truncate(currentPosition - 1)
	if err != nil {
		fmt.Println("Unable to truncate the last character:", err)
		os.Exit(1)
	}
}
```

在这个版本中，我创建了一个新的 `bufio.Writer`，并使用 `writer.WriteString` 来替代之前的 `outputfile.WriteString`。这样，写入操作会被缓冲，直到调用 `writer.Flush()` 或者缓冲区满。这可以减少磁盘 I/O 操作的次数，从而提高效率。

注意，我在程序结束前调用了 `writer.Flush()`，以确保所有缓冲的数据都被写入文件。如果你忘记调用 `Flush()`，可能会导致数据丢失。

另外，由于 `bufio.Writer` 会缓冲数据，所以在调用 `outputfile.Seek()` 获取文件指针位置之前，需要先调用 `writer.Flush()` 确保所有数据都被写入文件。否则，获取到的文件指针位置可能不准确。

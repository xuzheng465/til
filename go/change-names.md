# Batch rename files in Golang

```go
package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	// 打开txt文件
	file, err := os.Open("lessons.txt")
	if err != nil {
		panic(err)
	}
	defer file.Close()

	// 创建一个scanner来读取文件中的每一行
	scanner := bufio.NewScanner(file)
	lineNumber := 0

	// 遍历txt文件的每一行
	for scanner.Scan() {
		lineNumber++
		// 构建新的文件名
		newFilename := fmt.Sprintf("lesson%d-%s.mp4", lineNumber, scanner.Text())

		// 构建旧的文件名
		oldFilename := fmt.Sprintf("lesson%d.mp4", lineNumber)

		// 重命名文件
		err := os.Rename(oldFilename, newFilename)
		if err != nil {
			fmt.Println(err)
			continue
		}
		newSRTname := fmt.Sprintf("lesson%d-%s.srt", lineNumber, scanner.Text())

		// 构建旧的文件名
		oldSRTname := fmt.Sprintf("lesson%d.srt", lineNumber)

		// 重命名文件
		err = os.Rename(oldSRTname, newSRTname)
		if err != nil {
			fmt.Println(err)
			continue
		}
	}

	// 检查是否在读取文件时发生错误
	if err := scanner.Err(); err != nil {
		fmt.Println(err)
	}
}

```

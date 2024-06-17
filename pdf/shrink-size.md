# 使用 ghostscript 在 Mac 上减少 PDF 文件的大小

### 安装 Homebrew（如果尚未安装）

打开终端，然后输入以下命令来安装 Homebrew：

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 安装 Ghostscript

使用 Homebrew 安装`ghostscript`：

```bash
brew install ghostscript
```

### 使用 Ghostscript 减少 PDF 体积

安装完成后，您可以使用以下命令来减小 PDF 文件的体积：

```bash
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf
```

这里的参数解释如下：

- `-sDEVICE=pdfwrite`：设置输出设备为 PDF。
- `-dCompatibilityLevel=1.4`：设置 PDF 版本兼容性。
- `-dPDFSETTINGS=/ebook`：设置 PDF 压缩级别。这里的`/ebook`是一个较低的质量设置，适合电子书阅读（较小的文件大小）。其他可用设置包括：
  - `/screen`：最低质量，文件最小。
  - `/printer`：较高质量。
  - `/prepress`：高质量，适合印前处理。
- `-dNOPAUSE` -dQUIET -dBATCH：这些选项用于减少处理时的中断和日志输出。
- `-sOutputFile=output.pdf`：指定输出文件的名称。
- `input.pdf`：输入的 PDF 文件名。

### 注意事项

- **质量与大小**：使用`/ebook`或`/screen`选项时，输出 PDF 的质量会下降。如果质量非常重要，建议使用`/printer`或`/prepress`。
- **备份**：在压缩之前，备份原始文件总是一个好习惯。

这种方法通常足以用于大多数需要减少 PDF 文件大小的情况。如果你需要更多控制，`ghostscript`提供了大量的参数和设置可以调整。

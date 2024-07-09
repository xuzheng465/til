未成功，会将很多图形删除

```python
import fitz
import argparse

def find_and_remove_text(input_file, output_file, search_text):
    doc = fitz.open(input_file)
    text_found = False

    for page_num in range(len(doc)):
        page = doc[page_num]

        # 搜索指定文本
        instances = page.search_for(search_text)

        if instances:
            text_found = True
            print(f"在第 {page_num + 1} 页找到文本 '{search_text}'")

            for instance in instances:
                # 获取包含这个文本的文本块
                blocks = page.get_text("blocks")
                target_block = None

                for block in blocks:
                    rect = fitz.Rect(block[:4])
                    if rect.intersects(instance):
                        target_block = block
                        break

                if target_block:
                    print(f"  找到的文本块内容：{target_block[4][:50]}...")  # 只打印前50个字符

                    # 删除这个文本块
                    page.add_redact_annot(fitz.Rect(target_block[:4]))
                    page.apply_redactions()

                    print("  文本块已被删除")
                else:
                    print("  未找到包含该文本的块")

    if not text_found:
        print(f"在整个文档中未找到文本 '{search_text}'")

    # 保存修改后的文档
    doc.save(output_file)
    doc.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="从PDF中查找并删除指定文本")
    parser.add_argument("input_file", help="输入PDF文件路径")
    parser.add_argument("output_file", help="输出PDF文件路径")
    parser.add_argument("search_text", help="要查找和删除的文本")

    args = parser.parse_args()

    find_and_remove_text(args.input_file, args.output_file, args.search_text)
```

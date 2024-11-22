# 用 curl 下载文件

```shell
#!/bin/bash

API_KEY="demo_key"
SYSTEMS=(10 34 1200)
YEARS=(2019 2020)

for system in "${SYSTEMS[@]}"; do
    for year in "${YEARS[@]}"; do
        echo "Downloading system ${system} data for year ${year}..."
        curl -o "system_${system}_${year}.csv" \
        "https://developer.nrel.gov/api/pvdaq/v3/data_file?api_key=${API_KEY}&system_id=${system}&year=${year}"

        # 添加短暂延迟，避免请求过于频繁
        sleep 1
    done
done
```

这段代码是一个 bash 脚本,用于批量下载数据文件:

1. 首先定义了几个变量:

   - API_KEY: API 访问密钥
   - SYSTEMS: 一个数组,包含多个系统 ID (10, 34, 1200)
   - YEARS: 要下载的年份数组 (2019, 2020)

2. 使用嵌套循环遍历系统 ID 和年份:

   - 外层循环遍历 SYSTEMS 数组
   - 内层循环遍历 YEARS 数组

3. 对每个系统和年份组合:
   - 打印下载提示信息
   - 使用 curl 命令下载数据:
     - -o 选项指定输出文件名为 "`system_${system}_${year}.csv`"
     - URL 包含 API key、system_id 和 year 参数
4. 每次下载后暂停 1 秒:
   - 使用 sleep 命令
   - 避免对服务器发送过多请求
   - 这是一个良好的爬虫实践

这个脚本可以自动化批量下载多个系统在不同年份的数据文件。

## 安全建议

上述代码中的 API_KEY 直接硬编码在脚本中可能存在安全隐患:

1. 如果脚本被提交到代码仓库,API key 会被泄露
2. 其他人可以看到并使用这个 key

建议的改进方案:

1. 使用环境变量存储 API key:

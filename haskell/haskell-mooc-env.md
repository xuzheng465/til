# Haskell mooc 环境搭建

https://github.com/moocfi/haskell-mooc

需要为上面项目中的练习题搭建环境，在我的 mac 上无法搭建成功，具体原因未知，就直接用 docker 来搭建。

在 `exercises` 目录下创建一个名为 Dockerfile 的文件，内容如下：

```dockerfile
# 基础镜像
FROM haskell:9.2.8

# 设置工作目录
WORKDIR /app

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libgmp-dev \
    curl \
    && if ! command -v stack > /dev/null; then \
         curl -sSL https://get.haskellstack.org/ | sh; \
       fi

# 暴露工作目录给主机
VOLUME /app

# 默认进入 /app 目录
CMD ["/bin/bash"]

```

**`&& if ! command -v stack > /dev/null;`**:

- `&&`：表示上一条命令成功后才继续执行。
- `if ! command -v stack`：
  - `command -v stack` 检查是否可以在系统路径中找到 `stack` 命令。
  - 如果找不到（即 `stack` 未安装），`command -v` 的返回值为非 0，`!` 逻辑取反后，`if` 条件成立。
- `> /dev/null`：
  - 将 `command -v stack` 的输出（如果有）重定向到 `/dev/null`，避免输出到终端。

**构建 Docker 镜像**

```shell
docker build -t haskell-mooc:latest .
```

**启动 Docker 容器**

```shell
docker run -it -v $(pwd):/app -w /app --name hs-mooc haskell-mooc:latest
```

- `-v $(pwd):/app`：将当前目录挂载到容器的 `/app` 目录。
- `-w /app`：设置容器中的工作目录为 `/app`。
- **`--name my-haskell-container`**：为容器取一个名字（如 `my-haskell-container`），方便后续操作。
- `-it`：以交互模式运行容器。

重新启动已保存的容器

```shell
docker start -ai my-haskell-container
```

- **`start`**：启动已停止的容器。
- **`-a`**：附加到容器的标准输入输出。
- **`-i`**：以交互模式运行。

在容器中运行以下命令，安装课程所需的依赖：

```shell
stack build
```

运行对应测试文件

```shell
stack runhaskell Set1Test.hs
```

# AsyncImage 用法

```swift
AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
    image
        .resizable()
        .scaledToFit()
} placeholder: {
    // Custom placeholder, e.g., Color.red or ProgressView()
}

AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
    if let image = phase.image {
        image
            .resizable()
            .scaledToFit()
    } else if phase.error != nil {
        Text("There was an error loading the image.")
    } else {
        ProgressView()
    }
}
.frame(width: 200, height: 200)
```

最开始困惑的地方是 `AsyncImage` 后面的闭包为什么又能是image又能是phase。

因为它们实际上是两种不同形式的 `AsyncImage` 初始化方法.

第一种是 `AsyncImage(url:content:)`，第一个闭包的参数类型是 Image，而不是 `AsyncImagePhase`。在这种情况下，闭包仅在图像加载成功时调用，因此可以直接处理 Image 类型的参数。此外，这种方法还提供了一个名为 placeholder 的独立闭包，用于自定义占位符视图。

第二种是 `AsyncImage(url:completion:)`。这个方法的第一个闭包参数类型是 `AsyncImagePhase`。在这种情况下，闭包会在图像加载的每个阶段被调用，允许你在不同的阶段显示不同的视图（例如，正在加载、加载成功或加载失败）
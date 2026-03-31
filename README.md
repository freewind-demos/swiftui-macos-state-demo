# SwiftUI macOS @State 状态管理

## 简介

演示 SwiftUI 中 @State 的用法，这是 SwiftUI 最基础的状态管理方式，用于在视图内部管理可变状态。

## 快速开始

```bash
cd swiftui-macos-state-demo
xcodegen generate
open SwiftUIStateDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### 什么是 @State

@State 是 SwiftUI 提供的一种属性包装器，用于管理视图本地的可变状态。当状态改变时，SwiftUI 会自动重新渲染视图。

```swift
struct ContentView: View {
    @State private var count = 0  // 声明状态
    // ...
}
```

### @State 的特点

- 用 `@State` 标记私有变量
- 只能用于值类型（Int、String、Bool 等）
- 状态变化会自动触发视图更新
- 状态是私有的，只能在该视图内访问

### 计数器示例

```swift
@State private var count = 0

var body: some View {
    VStack {
        Text("\(count)")  // 显示计数

        Button("加一") {
            count += 1  // 修改状态
        }
    }
}
```

### 双向绑定 $

使用 `$` 前缀创建绑定，将 UI 和状态连接：

```swift
@State private var text = ""

TextField("输入...", text: $text)
//                   ↑
//                   绑定符号
```

### 绑定的工作原理

- `text` 是实际的值
- `$text` 是 Binding（绑定），允许 UI 修改值
- 当用户在 TextField 中输入时，`text` 会自动更新

### Toggle 开关示例

```swift
@State private var isOn = false

Toggle("开关", isOn: $isOn)
```

## 完整示例

```swift
struct ContentView: View {
    @State private var count = 0
    @State private var text = ""
    @State private var isOn = false

    var body: some View {
        VStack(spacing: 30) {
            // 计数器
            Text("\(count)")
            Button("加一") {
                count += 1
            }

            // 文本输入
            TextField("输入...", text: $text)

            // 开关
            Toggle("开关", isOn: $isOn)
        }
        .padding()
    }
}
```

## 完整讲解（中文）

### @State 的核心概念

SwiftUI 使用声明式 UI，我们描述视图应该长什么样，数据变化时视图自动更新。

@State 让 SwiftUI 知道"这个值变化时，要重新渲染视图"。

### 为什么用 @State

假设没有 @State：
- 你需要手动追踪哪些值变化了
- 需要手动调用渲染更新

有了 @State：
- SwiftUI 自动追踪依赖
- 值变化时自动重新计算 body

### @State 只能用于私有本地状态

如果状态需要被多个视图共享，应该使用：
- `@ObservedObject` - 观察外部对象
- `@EnvironmentObject` - 从环境获取对象
- `@StateObject` - 创建可观察对象实例

### 下一步

- 学习 `@Binding` - 在父子组件间传递可修改的状态
- 学习 `@ObservedObject` - 管理复杂对象的状态

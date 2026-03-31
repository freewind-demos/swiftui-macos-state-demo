import SwiftUI

struct ContentView: View {
    // @State 用于管理本地状态
    @State private var count = 0
    @State private var text = ""
    @State private var isOn = false

    var body: some View {
        VStack(spacing: 30) {
            // 1. 计数器示例
            VStack(spacing: 10) {
                Text("计数器示例")
                    .font(.headline)

                Text("\(count)")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.blue)

                HStack(spacing: 20) {
                    Button("减一") {
                        count -= 1
                    }

                    Button("加一") {
                        count += 1
                    }
                }
            }

            Divider()

            // 2. 文本输入示例
            VStack(spacing: 10) {
                Text("文本输入示例")
                    .font(.headline)

                Text("你输入的是: \(text)")
                    .foregroundColor(.secondary)

                TextField("输入文字...", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 250)
            }

            Divider()

            // 3. 开关示例
            VStack(spacing: 10) {
                Text("开关示例")
                    .font(.headline)

                Toggle("开关状态: \(isOn ? "开" : "关")", isOn: $isOn)
                    .labelsHidden()

                Text(isOn ? "现在是开启状态" : "现在是关闭状态")
                    .foregroundColor(isOn ? .green : .red)
            }
        }
        .padding(30)
    }
}

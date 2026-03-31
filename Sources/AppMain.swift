import SwiftUI

@main
struct StateApp: App {
    var body: some Scene {
        Window("@State 状态管理演示", id: "main") {
            ContentView()
        }
        .defaultSize(width: 400, height: 300)
    }
}

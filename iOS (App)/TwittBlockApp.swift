import SwiftUI

@main
struct TwittBlockApp: App {
    @ObservedObject var contentBlockerState = ContentBlockerState(withIdentifier: "com.twittBlock.ios.TwittBlockContentBlocker")

    var body: some Scene {
        WindowGroup {
            HomeScreen(isEnabled: contentBlockerState.isEnabled)
        }
    }
}

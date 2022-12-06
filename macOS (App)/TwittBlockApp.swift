import SwiftUI

@main
struct TwittBlockApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @ObservedObject var contentBlockerState = ContentBlockerState(withIdentifier: "com.twittBlock.ios.TwittBlockContentBlocker")

    var body: some Scene {
        WindowGroup {
            HomeScreen(isEnabled: contentBlockerState.isEnabled)
                .frame(width: 375, height: 640)
                .background(NonResizableWindow())
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

struct NonResizableWindow: NSViewRepresentable {
    func makeNSView(context _: Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async {
            guard let window = view.window else { return }
            window.styleMask = [.closable, .titled, .fullSizeContentView]
            window.collectionBehavior = [.fullScreenNone]

            if let menu = window.menu {
                let appMenuItem = menu.item(withTitle: "Twitt-Block")!
                let fileMenuItem = menu.item(withTitle: "File")!

                menu.items = [appMenuItem, fileMenuItem]

                appMenuItem.submenu!.items = [
                    appMenuItem.submenu!.item(withTitle: "About Twitt-Block")!,
                    NSMenuItem.separator(),
                    appMenuItem.submenu!.item(withTitle: "Quit Twitt-Block")!
                ]

                fileMenuItem.submenu!.items = [
                    fileMenuItem.submenu!.item(withTitle: "Close")!
                ]
            }
        }
        return view
    }

    func updateNSView(_: NSView, context _: Context) {}
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_: Notification) {
        NSWindow.allowsAutomaticWindowTabbing = false
    }

    func applicationShouldTerminateAfterLastWindowClosed(_: NSApplication) -> Bool {
        true
    }
}

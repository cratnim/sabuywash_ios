import UIKit
import Flutter
import FlutterPluginRegistrant

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize the shared engine
        GeneratedPluginRegistrant.register(with: FlutterEngineManager.shared.flutterEngine)
        return true
    }
}

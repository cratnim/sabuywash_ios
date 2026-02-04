import UIKit
import Flutter
import FlutterPluginRegistrant
import FirebaseCore

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize the shared engine

        FirebaseApp.configure()
        GeneratedPluginRegistrant.register(with: FlutterEngineManager.shared.flutterEngine)
        return true
    }
}

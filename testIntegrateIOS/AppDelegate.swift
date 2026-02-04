import UIKit
import Flutter
import FlutterPluginRegistrant
import FirebaseCore
import GoogleMaps

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize the shared engine

        FirebaseApp.configure()
        GMSServices.provideAPIKey(Configuration.googleApiKey)
        GeneratedPluginRegistrant.register(with: FlutterEngineManager.shared.flutterEngine)
        return true
    }
}

import Flutter

class FlutterEngineManager {
    static let shared = FlutterEngineManager()
    let flutterEngine = FlutterEngine(name: "my flutter engine")
    let flavor: String
    
    private var ssoChannel: FlutterMethodChannel?

    private init() {
        self.flavor = Bundle.main.infoDictionary?["FLAVOR"] as? String ?? "prod"
        
        print("Current Flavor: \(flavor)")
        
        flutterEngine.run(
            withEntrypoint: nil,
            libraryURI: nil,
            initialRoute: nil,
            entrypointArgs: [flavor]
        )
        
        ssoChannel = FlutterMethodChannel(
            name: "com.smilewash.app/sso",
            binaryMessenger: flutterEngine.binaryMessenger
        )
        
        setupMethodChannel()
    }

    private func setupMethodChannel() {
        ssoChannel?.setMethodCallHandler { [weak self] (call, result) in
            if call.method == "getSuperAppToken" {
                self?.handleGetToken(result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    }

    private func handleGetToken(result: @escaping FlutterResult) {
        let tokenData: [String: Any] = [
            "access_token": "your_actual_access_token_here",
            "refresh_token": "your_actual_refresh_token_here",
            "access_token_expires_in": 3600
        ]
        
        result(tokenData)
    }

    func getEngine() -> FlutterEngine {
        if flutterEngine.viewController != nil {
            flutterEngine.viewController = nil
        }
        return flutterEngine
    }
}
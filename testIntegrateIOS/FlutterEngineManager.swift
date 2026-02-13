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
            if call.method == "getAuthentikToken" {
                self?.handleGetToken(result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    }

    private func handleGetToken(result: @escaping FlutterResult) {
        let currentToken = "latest_authentik_token"
        let response: [String: Any] = [
                "authentik_token": currentToken
        ]
        result(response)
    }

    func getEngine() -> FlutterEngine {
        if flutterEngine.viewController != nil {
            flutterEngine.viewController = nil
        }
        return flutterEngine
    }
}
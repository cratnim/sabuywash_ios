import Flutter

class FlutterEngineManager {
    static let shared = FlutterEngineManager()
    let flutterEngine = FlutterEngine(name: "my flutter engine")
    
    private init() {
        flutterEngine.run()
    }

    // --- เพิ่มฟังก์ชันนี้เข้าไปครับ ---
    func getEngine() -> FlutterEngine {
        // เช็คว่าถ้ามีคนใช้อยู่ ให้สั่งให้มันว่างงานก่อน
        if flutterEngine.viewController != nil {
            flutterEngine.viewController = nil
        }
        return flutterEngine
    }
}
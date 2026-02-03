import UIKit
import Flutter
import SwiftUI

class FlutterViewControllerWrapper: UIViewController {
    var flutterViewController: FlutterViewController? // เก็บไว้เป็นตัวแปรของ Class

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flutterEngine = FlutterEngineManager.shared.getEngine()
        // สร้างหน้า Flutter
        let fvc = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        self.flutterViewController = fvc
        
        addChild(fvc)
        view.addSubview(fvc.view)
        // fvc.view.frame = view.bounds
        fvc.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fvc.view.topAnchor.constraint(equalTo: view.topAnchor),
            fvc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fvc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fvc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        fvc.didMove(toParent: self)
    }

    // --- เพิ่มส่วนนี้เข้าไปครับ ---
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // สำคัญมาก: เมื่อหน้าจอกำลังจะปิด ให้ถอด Engine ออกทันที
        if let fvc = flutterViewController {
            fvc.willMove(toParent: nil)
            fvc.view.removeFromSuperview()
            fvc.removeFromParent()
        }
        
        // สั่ง Engine ให้รู้ว่าตอนนี้ไม่มีใครครอบครองแล้ว
        FlutterEngineManager.shared.flutterEngine.viewController = nil
    }
}

struct FlutterViewRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> FlutterViewControllerWrapper {
        return FlutterViewControllerWrapper()
    }
    
    func updateUIViewController(_ uiViewController: FlutterViewControllerWrapper, context: Context) {}
}

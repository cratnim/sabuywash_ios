import UIKit
import Flutter
import SwiftUI

class FlutterViewControllerWrapper: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the shared engine
        let flutterEngine = FlutterEngineManager.shared.flutterEngine
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        
        addChild(flutterViewController)
        view.addSubview(flutterViewController.view)
        flutterViewController.view.frame = view.bounds
        flutterViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        flutterViewController.didMove(toParent: self)
    }
}

struct FlutterViewRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> FlutterViewControllerWrapper {
        return FlutterViewControllerWrapper()
    }
    
    func updateUIViewController(_ uiViewController: FlutterViewControllerWrapper, context: Context) {}
}

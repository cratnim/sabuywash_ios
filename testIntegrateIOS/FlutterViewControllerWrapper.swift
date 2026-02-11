import UIKit
import Flutter
import SwiftUI

class FlutterViewControllerWrapper: UIViewController {
    var flutterViewController: FlutterViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flutterEngine = FlutterEngineManager.shared.getEngine()
        let fvc = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        self.flutterViewController = fvc
        
        addChild(fvc)
        view.addSubview(fvc.view)
        fvc.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fvc.view.topAnchor.constraint(equalTo: view.topAnchor),
            fvc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fvc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fvc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        fvc.didMove(toParent: self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let fvc = flutterViewController {
            fvc.willMove(toParent: nil)
            fvc.view.removeFromSuperview()
            fvc.removeFromParent()
        }
        
        FlutterEngineManager.shared.flutterEngine.viewController = nil
    }
}

struct FlutterViewRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> FlutterViewControllerWrapper {
        return FlutterViewControllerWrapper()
    }
    
    func updateUIViewController(_ uiViewController: FlutterViewControllerWrapper, context: Context) {}
}

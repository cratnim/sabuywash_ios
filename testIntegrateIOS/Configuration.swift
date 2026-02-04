//
//  Configuration.swift
//  Runner
//
//  Created by Visarut Tippun on 14/12/22.
//

import Foundation

enum Flavor: String {
    case local
    case dev
    case uat
    case prod
}

enum Configuration {
    static var flavor: Flavor {
        guard let value = Bundle.main.object(forInfoDictionaryKey: "FLAVOR") as? String,
              let flavor = Flavor(rawValue: value) else { return .prod }
        return flavor
    }
    
    static var googleApiKey: String {
        switch Self.flavor {
        case .local: return "AIzaSyCnsXBh354ydlrKB9K_58furXu3s6d7Ziw"
        case .dev: return "AIzaSyBKuTDy2_Nyc_wzkJ_a4Igp26ILME0CQrk"
        case .uat: return "AIzaSyBuu2g3dgRn2mkwcwLia7HQtFzIUuYMuIM"
        case .prod: return "AIzaSyAVvk1vVdqpJRuNcP1qQFEp8bOslSKCz7k"
        }
    }
}

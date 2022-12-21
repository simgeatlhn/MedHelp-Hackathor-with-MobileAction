//
//  MedHelpApp.swift
//  MedHelp
//
//  Created by simge on 16.12.2022.
//

import SwiftUI
import Firebase

@main
struct MedHelpApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
    }
}

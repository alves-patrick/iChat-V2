//
//  iChatApp.swift
//  iChat
//
//  Created by Patrick Alves on 11/11/23.
//

import SwiftUI
import Firebase

@main
struct iChatApp: App {
    
    init() {
        FirebaseApp.configure()
    
    
}
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

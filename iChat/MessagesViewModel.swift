//
//  MessagesViewModel.swift
//  iChat
//
//  Created by Patrick Alves on 12/11/23.
//

import Foundation
import FirebaseAuth

class MessagesViewModel: ObservableObject {
    
    func logout() {
        try? Auth.auth().signOut()
    }
}

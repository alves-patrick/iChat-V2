//
//  MessagesViewModel.swift
//  iChat
//
//  Created by Patrick Alves on 12/11/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class MessagesViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var contacts: [Contact] = []
    
    private let repo: MessageRepository
    init(repo: MessageRepository) {
    self.repo = repo
    }
    
    func getContacts() {
        repo.getContacts { contacts in
            self.contacts = contacts
        }
        
    }
    func logout() {
        repo.logout()
    }
}

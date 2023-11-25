//
//  ContactsViewModel.swift
//  iChat
//
//  Created by Patrick Alves on 12/11/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ContactsViewModel: ObservableObject {
    
    @Published var contacts: [Contact] = []
    @Published var isLoading = false
    
    var isLoaded = false
    
    private let repo: ContactRepository
    
    init(repo: ContactRepository) {
        self.repo = repo
    }
    
    func getContacts() {
        if isLoaded { return }
        isLoading = true
        isLoaded = true
        
        repo.getContacts { contacts in
            self.contacts.append(contentsOf: contacts)
            self.isLoading = false
        }

    }
    
    
}

//
//  ChatViewModel.swift
//  iChat
//
//  Created by Patrick Alves on 12/11/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ChatViewModel: ObservableObject {
    
    @Published var messages: [Message] = []
    @Published var text = ""
   
    
    var inserting = false

    var newCount = 0
    let limit = 20
    
    private let repo: ChatRepository
    init(repo: ChatRepository) {
        self.repo = repo
    }
    func onAppear(contact: Contact) {
        repo.fetchChat(limit: limit, contact: contact, lastMessage:
            self.messages.last) { message in
            
            if self.inserting {
                self.messages.insert(message, at: 0)
            } else {
                self.messages.append(message)
            }
            
            self.inserting = false
            self.newCount = self.messages.count
        }
    }
        func sendMessage(contact: Contact) {
            let text = self.text.trimmingCharacters(in: .whitespacesAndNewlines)
            self.text = ""
            self.inserting = true
            repo.sendMessage(text: text, contact: contact)
        }
    }


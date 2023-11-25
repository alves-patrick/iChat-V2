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

    var newCount = 0
    let limit = 20
    
    private let repo: ChatRepository
    init(repo: ChatRepository) {
        self.repo = repo
    }
    func onAppear(contact: Contact) {
        repo.fetchChat(limit: limit, contact: contact, lastMessage: self.messages.last) { messages, newCount in
            self.messages.append(contentsOf: messages)
            self.newCount = newCount
        }
    }
        func sendMessage(contact: Contact) {
            let text = self.text.trimmingCharacters(in: .whitespacesAndNewlines)
            self.text = ""
            repo.sendMessage(inserting: true, text: text, contact: contact)
        }
    }


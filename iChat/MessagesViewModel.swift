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
    
    func getContacts() {
        let fromId = Auth.auth().currentUser!.uid
        Firestore.firestore().collection("last-messages")
            .document(fromId)
            .collection("contacts")
            .addSnapshotListener { snapshot, error in
                if let changes = snapshot?.documentChanges {
                    for doc in changes {
                        if doc.type == .added {
                            let document = doc.document
                            
                            self.contacts.removeAll()
                            self.contacts.append(Contact(uuid: document.documentID,
                                                         name: document.data()["username"] as! String,
                                                         profileUrl: document.data()["photoUrl"] as! String,
                                                         lastMessage: document.data()["lastmessage"] as? String,
                                                         timestamp: document.data()["timestamp"] as? UInt))
                        }
                    }
                }
                
                
            }
        
    }
    
    func logout() {
        try? Auth.auth().signOut()
    }
}

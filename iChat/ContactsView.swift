//
//  ContactsView.swift
//  iChat
//
//  Created by Patrick Alves on 12/11/23.
//

import SwiftUI

struct ContactsView: View {
    
    @ObservedObject var viewModel = ContactsViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.contacts, id: \.self) { contact in
               ContactRow(contact: contact)
                
                // Text("Nome do contato: \(contact.name)")
                
            }
            
        }.onAppear {
            viewModel.getContacts()
        }
    }
}

struct ContactRow: View {
    var contact: Contact
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: contact.profileUrl)) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width:50, height: 50)
            Text(contact.name)
        }
    }
}
    #Preview {
        ContactsView()
    }


//
//  MessagesView.swift
//  iChat
//
//  Created by Patrick Alves on 12/11/23.
//

import SwiftUI

struct MessagesView: View {
    @StateObject var viewModel = MessagesViewModel(repo: MessageRepository())
    
    var body: some View {
        
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                }
                List(viewModel.contacts, id: \.self) { contact in
                    NavigationLink {
                        ChatView(contact: contact)
                    } label: {
                        ContactMessageRow(contact: contact)
                    }
                }
            }
            .onAppear {
                viewModel.handEnabled(enabled: true)
                viewModel.getContacts()
            }
            .onDisappear {
                viewModel.handEnabled(enabled: false)
            }
            .navigationTitle("Mensagens")
            .toolbar {
                ToolbarItem(id: "contacts",
                            placement: ToolbarItemPlacement.navigationBarTrailing,
                            showsByDefault: true) {
                    NavigationLink("Contatos", destination: ContactsView())
                }
                ToolbarItem(id: "logout",
                            placement: ToolbarItemPlacement.navigationBarTrailing,
                            showsByDefault: true) {
                    Button("Logout") {
                        viewModel.logout()
                    }
                }
            }
        }
    }
}

struct ContactMessageRow: View {
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
            
            VStack (alignment: .leading) {
                Text(contact.name)
                if let msg = contact.lastMessage {
                    Text(msg)
                        .lineLimit(1)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    MessagesView()
}


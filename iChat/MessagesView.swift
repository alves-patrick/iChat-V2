//
//  MessagesView.swift
//  iChat
//
//  Created by Patrick Alves on 12/11/23.
//

import SwiftUI

struct MessagesView: View {
    @StateObject var viewModel = MessagesViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Ola Mundo")
            }
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

#Preview {
    MessagesView()
}


//
//  ContentView.swift
//  iChat
//
//  Created by Patrick Alves on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel =  ContentViewModel()
    
    
    var body: some View {
        ZStack {
            if viewModel.isLogged {
                MessagesView()
            } else {
                SignInView()
            }
        }.onAppear() {
            viewModel.onAppear()
        }
    }
}
#Preview {
    ContentView()
}

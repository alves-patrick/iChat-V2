//
//  SigInRepository.swift
//  iChat
//
//  Created by Patrick Alves on 22/11/23.
//

import Foundation
import FirebaseAuth

class SigInRepository {
    
    
    func signIn () {
        
        Auth.auth().signIn(withEmail: email, password: password) {
            
            result, err in
            guard let user = result?.user, err == nil else {
                self.formInvalid = true
                self.alertText = err!.localizedDescription
                print(err)
                self.isLoading = false
                return
            }
            self.isLoading = false
            print("usuario logado \(user.uid)")
            
        }
        
        
        
    }
    
    
}

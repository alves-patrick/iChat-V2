//
//  SignUpViewModel.swift
//  iChat
//
//  Created by Patrick Alves on 11/11/23.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class SignUpViewModel: ObservableObject {
   @Published var name = ""
    @Published var email = ""
    @Published  var password = ""
    
    @Published var image = UIImage()
    
    @Published var formInvalid = false
    var alertText = ""
    
    @Published var isLoading = false
    
    func signUp() {
        
        
        print("nome: \(name), email: \(email), senha: \(password) ")
        
        if (image.size.width <= 0) {
            formInvalid = true
            alertText = "Selecione uma foto"
            return
        }
        isLoading = true
        
        Auth.auth().createUser(withEmail: email, password: password) { [self]
            
            result, err in
            guard let user = result?.user, err == nil else {
                self.formInvalid = true
                self.alertText = err!.localizedDescription
                print(err)
                self.isLoading = false
                return
            }
            self.isLoading = false
            print("usuario criado \(user.uid)")
            
            self.uploadPhoto()
            
        }
    }
    private func uploadPhoto() {
        let filename = UUID().uuidString
        
        guard let data = image.jpegData(compressionQuality: 0.2) else { return }
        
        let newMetadata = StorageMetadata()
        newMetadata.contentType = "image/jpg"
        
        let ref = Storage.storage().reference(withPath: "/image/\(filename).jpg")
        
        ref.putData(data, metadata: newMetadata) { metadata, err in
        
            ref.downloadURL { url, error in
                
                self.isLoading = false
                guard let url = url else { return }
                print("foto criada \(url)")
                self.createUser(photoUrl: url)
            }
            
        }
    }
    private func createUser(photoUrl: URL) {
        Firestore.firestore().collection(<#T##collectionPath: String##String#>)
        
        
    }
}

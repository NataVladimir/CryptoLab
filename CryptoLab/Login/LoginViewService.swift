//
//  LoginViewService.swift
//  CryptoLab
//
//  Created by NATA VLADIMIR ALVES CAMPOS on 04/08/25.
//

import Foundation
import FirebaseAuth

protocol SignInServiceProtocol {
    func registerUserFirebase(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
}

final class SignInService {
    func registerUserFirebase(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error ao fazer login")
                completion(.failure(error))
                return
            }
            if let user = result?.user {
                completion(.success(user))
            }
        }
    }
}


final class SignInServiceMock: SignInServiceProtocol {
    var isError: Bool = false
    
    func registerUserFirebase(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        if isError {
            // sucesso
        }
    }
}

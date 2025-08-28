//
//  Signup.viewModel.swift
//  ToDo
//
//  Created by Aadhil Abdulla on 28/08/25.
//

import Foundation

struct SignupResponse : Codable {
    let success : Bool
    let message : String
}

class SignupViewModel : ObservableObject {
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var isLoading : Bool = false
    @Published var responseMessage : String = ""
    
    @MainActor
    func signUp() async {
        guard let url = URL(string: "http://localhost:4000/auth/signup") else {
            responseMessage = "Invalid URL"
            print("Invalid URL")
            return
        }
        
        let user = User(email: email, password: password)
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            isLoading = true
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoded = try JSONDecoder().decode(SignupResponse.self, from: data)
            
            responseMessage = decoded.message
            print(responseMessage)
            
        } catch {
            responseMessage = "Error : \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
}

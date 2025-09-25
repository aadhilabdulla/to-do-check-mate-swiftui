//
//  ContentView.swift
//  ToDo
//
//  Created by Aadhil Abdulla on 28/08/25.
//

import SwiftUI

struct SignupPage: View {
    
    @StateObject var signupViewModel = SignupViewModel()
    @State private var navigateToLogin : Bool = false
    var body: some View {
        
        NavigationStack{
            VStack {
                Text("ToDo CheckMate")
                    .frame(maxWidth : .infinity, alignment: .leading)
                    .font(.system(size: 26))
                    .fontWeight(.heavy)
                    .padding(.vertical)
                Text("Create a new account")
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                HStack{
                    Image(systemName: "envelope")
                        .frame(width: 20)
                        .padding(.leading)
                    TextField("Email", text: $signupViewModel.email)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                        .padding()
                        
                }
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.black)
                )
                
               
                HStack{
                    Image(systemName: "key")
                        .frame(width: 20)
                        .padding(.leading)
                    SecureField("Password", text: $signupViewModel.password)
                        .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.black)
                )
                .padding(.top)
                
                if(signupViewModel.responseMessage != ""){
                    Text(signupViewModel.responseMessage)
                        .foregroundStyle(Color.red)
                        .padding(.top)
                        .onAppear{
                            let generator = UINotificationFeedbackGenerator()
                            generator.notificationOccurred(.error)
                        }
                }
                
                if (signupViewModel.isLoading) {
                    ProgressView()
                        .padding()
                } else {
                    Button("Create account"){
                        Task {
                            await signupViewModel.signUp()
                        }
                    }
                    .foregroundStyle(Color.black)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.black)
                    )
                    .padding()
                }
                
                Button("Login In"){
                    Task {
                        await signupViewModel.login()
                        if(signupViewModel.isLoginSuccess) {
                            navigateToLogin = true
                            resetForm()
                        }
                    }
                    
                    
                    
                }
                .foregroundColor(Color.black)
                Spacer()
            }
            .onChange(of : signupViewModel.isSignedup){
                if signupViewModel.isSignedup {
                    navigateToLogin = true
                }
            }
            .navigationDestination(isPresented: $navigateToLogin ){
                HomePage()
                    .onAppear(){
                        resetForm()
                    }
            }
            .padding()
        }
        
        
    }
    
    private func resetForm(){
        signupViewModel.email = ""
        signupViewModel.password = ""
        signupViewModel.responseMessage = ""
        signupViewModel.isSignedup = false
    }
}

#Preview {
    SignupPage()
}

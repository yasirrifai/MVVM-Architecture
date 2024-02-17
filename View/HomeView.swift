//
//  HomeView.swift
//  MVVM
//
//  Created by Yasir Rifai on 2024-02-10.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeVM : HomeViewModal = HomeViewModal()
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.blue)
                
                VStack{
                    Text("Welcome Back!").bold().frame(maxWidth: .infinity, alignment: .leading).padding(10)
                    Text("Sign in to continue..")
                    MyInputField(inputField: $homeVM.username, fieldName: "Username")
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 50)
                        .padding()
                        .foregroundColor(.gray.opacity(0.4))
                        .overlay{
                            SecureField("Enter a password", text: $homeVM.password)
                                .padding(.leading, 40)
                                .textInputAutocapitalization(.never)
                        }
                    
                    
                    
                    Button(action: {
                        homeVM.validateUser()
                        
                    }, label: {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(height: 50)
                            .padding(10)
                            .overlay{
                                Text("Sign Up")
                                    .foregroundColor(.white)
                            }
                    })
                    
                }
                .padding()
                Spacer()
                if homeVM.showError {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 100)
                        .padding(10)
                        .foregroundColor(.red)
                        .overlay {
                            Text(homeVM.errorMessage)
                                .foregroundStyle(.white)
                                .bold()
                        }
                }
                Spacer()
                NavigationLink("", isActive: $homeVM.succes) {
                    Text("Hello \(homeVM.username)")
                }
                
            }
            
            
            
            
        }
    }
}

struct MyInputField : View {
    
    @Binding var inputField : String
    var fieldName : String = ""
    var body: some View{
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 50)
            .padding()
            .foregroundColor(.gray.opacity(0.4))
            .overlay{
                TextField(fieldName, text: $inputField)
                    .padding(.leading, 40)
                    .textInputAutocapitalization(.never)
            }
    }
}
#Preview {
    HomeView()
}

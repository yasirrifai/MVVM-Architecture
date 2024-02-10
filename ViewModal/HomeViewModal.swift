//
//  HomeViewModal.swift
//  MVVM
//
//  Created by Yasir Rifai on 2024-02-10.
//

import Foundation
import SwiftUI

class HomeViewModal: ObservableObject {
    
    @Published var username : String = ""
    @Published var password : String = ""
    @Published var showError : Bool = false
    @Published var succes : Bool = false
    @Published var errorMessage : String = ""
    
    func validateUser(){
        if username.isEmpty || password.isEmpty{
            showError = true
            errorMessage = "Please enter username and password to continue"
        }
        else if username == "abc" && password == "123" {
            showError = false
            succes = true
            
        }
        else {
            showError = true
            errorMessage = "Incorrect username and password, please try again"
        }
    }
}

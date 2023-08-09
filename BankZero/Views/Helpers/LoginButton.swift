//
//  LoginButton.swift
//  BankZero
//
//  Created by Mike Wallick on 8/2/23.
//

import SwiftUI
import Auth0

struct LoginButton: View {
    var body: some View {
        Button {
            Auth0
                .webAuth()
                .scope("openid profile email name profile address offline_access")
                .start { result in
                    switch result {
                    case .success(let credentials):
                        print("Obtained credentials: \(credentials)")
                    case .failure(let error):
                        print("Failed with: \(error)")
                    }
                }
        } label: {
            Text("Log In")
                .font(.headline)
                .frame(width: 130, height: 50)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton()
    }
}

//
//  LogoutButton.swift
//  BankZero
//
//  Created by Mike Wallick on 8/2/23.
//

import SwiftUI
import Auth0

struct LogoutButton: View {
    var body: some View {
        Button {
            Auth0
                .webAuth()
                .clearSession { result in
                    switch result {
                    case .success:
                        print("Logged out")
                    case .failure(let error):
                        print("Failed with: \(error)")
                    }
                }
        } label: {
            Text("Log Out")
                .font(.headline)
                .frame(width: 130, height: 50)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }    }
}

struct LogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButton()
    }
}

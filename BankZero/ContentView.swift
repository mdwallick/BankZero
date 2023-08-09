//
//  ContentView.swift
//  BankZero
//
//  Created by Mike Wallick on 8/2/23.
//

import SwiftUI
import Auth0

struct ContentView: View {
    @State var user: User?
    
    let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
    
    var body: some View {
        let canRenew = credentialsManager.canRenew()
        if (canRenew) {
            if let user = self.user {
                UserProfile(user: user)
                Button("Logout", action: self.logout)
            }
        } else {
            VStack {
                HeroView()
                var isRenewable = String(canRenew)
                Text("Can renew? \(isRenewable)")
                Button("Log In", action: self.login)
            }
        }
    }
}

extension ContentView {
    func login() {
            Auth0
                .webAuth()
//                .parameters([
//                    "prompt": "login", "screen_hint": "signup"
//                ])
                .audience("https://demo.atko.rocks/api")
                .scope("openid profile email name profile address offline_access")
                .start { result in
                    switch result {
                    case .success(let credentials):
                        let didStore = credentialsManager.store(credentials: credentials)
                        print("Stored credentials: \(didStore)")
                        self.user = User(from: credentials.idToken)
                    case .failure(let error):
                        print("Failed with: \(error)")
                    }
                }
        }

        func logout() {
            Auth0
                .webAuth()
                .clearSession { result in
                    switch result {
                    case .success:
                        self.user = nil
                    case .failure(let error):
                        print("Failed with: \(error)")
                    }
                }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

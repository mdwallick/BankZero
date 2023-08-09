//
//  BankZeroApp.swift
//  BankZero
//
//  Created by Mike Wallick on 8/2/23.
//

import SwiftUI

@main
struct BankZeroApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            #if os(iOS)
                .padding(.bottom, 16)
                .ignoresSafeArea(.keyboard, edges: .bottom)
                .background(Color("Background").ignoresSafeArea())
                .buttonStyle(PrimaryButtonStyle())
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                    UITableView.appearance().bounces = false
                }
            #else
                .padding(.bottom, 32)
                .frame(maxWidth: 400, maxHeight: 300)
            #endif
            
        }
    }
}

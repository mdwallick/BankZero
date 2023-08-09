//
//  HomePage.swift
//  BankZero
//
//  Created by Mike Wallick on 8/2/23.
//

import SwiftUI

struct HomePage: View {
    var user: User
    
    var body: some View {
        VStack {
            UserProfile(user: user)
        }
    }
}

//struct HomePage_Previews: PreviewProvider {
//    static var previews: some View {
//        HomePage()
//    }
//}

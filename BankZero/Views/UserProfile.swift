//
//  UserProfile.swift
//  BankZero
//
//  Created by Mike Wallick on 8/3/23.
//

import SwiftUI

struct UserProfile: View {
    let user: User

        var body: some View {
            List {
                Section(header: ProfileHeader(picture: user.picture)) {
                    ProfileCell(key: "ID", value: user.id)
                    ProfileCell(key: "Name", value: user.name)
                    ProfileCell(key: "Email", value: user.email)
                    ProfileCell(key: "Email verified?", value: user.emailVerified)
                    ProfileCell(key: "Updated at", value: user.updatedAt)
                }
            }
        }
}

//struct UserProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfile()
//    }
//}

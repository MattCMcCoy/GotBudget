//
//  Profile.swift
//  GotBudget
//
//  Created by Matt McCoy on 4/9/25.
//

import SwiftUI
import SwiftUI
import Foundation
import SwiftData

@Model
final class Profile {
    var Accounts: [Account] = []
    
    init(accounts: [Account] = []) {
        self.Accounts = accounts
    }
}

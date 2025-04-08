//
//  Account.swift
//  GotBudget
//
//  Created by Matt McCoy on 4/7/25.
//

import SwiftUI

struct Account {
    var id: UUID
    var bank: String
    var name: String
    var balance: Double
    var transactions: [Transaction]
}

//
//  ContentView.swift
//  GotBudget
//
//  Created by Matt McCoy on 4/7/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var accounts: [Account]

    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                    Dashboard()
                } label: {
                    Label("Dashboard", systemImage: "house")
                }
                NavigationLink {
                    Accounts()
                } label: {
                    Label("Accounts", systemImage: "figure.walk")
                }
                NavigationLink {
                    Budget()
                } label: {
                    Label("Budget", systemImage: "leaf")
                }
                #if os(macOS)
                Text("My Accounts")
                    .font(.caption)
                    .fontWeight(.black)
                    .foregroundColor(Color.gray)
                ForEach(accounts) {
                    account in
                    NavigationLink {
                        Text(
                            "Item at \(account.bank)"
                        )
                    } label: {
                        Text(account.bank)
                    }
                }
                .onDelete(perform: deleteItems)
                #endif
            }
            #if os(macOS)
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            #endif
            .toolbar {
                #if os(iOS)
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                #endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Account", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an account")
        }
    }

    private func addItem() {
        withAnimation {
            let newAccount = Account(
                bank: "BofA", name: "Checking", balance: 1234.56)
            modelContext.insert(newAccount)
            try? modelContext.save()
        }
    }

    private func deleteItems(at offsets: IndexSet) {
        withAnimation {
            for offset in offsets {
                modelContext.delete(accounts[offset])
            }
            try? modelContext.save()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Account.self, inMemory: true)
}

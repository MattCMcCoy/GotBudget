//
//  ContentView.swift
//  GotBudget
//
//  Created by Matt McCoy on 4/7/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                   
                } label: {
                    Text("Dashboard")
                        .font(.subheadline)
                        .fontWeight(.heavy)
                }
                NavigationLink {
                    Accounts()
                } label: {
                    Text("Accounts")
                        .font(.subheadline)
                        .fontWeight(.heavy)
                }
                    NavigationLink {
                        Text("Transactions")
                    } label: {
                        Text("Transactions")
                            .font(.subheadline)
                            .fontWeight(.heavy)
                    }
                NavigationLink {
                    Text("Categories")
                } label: {
                    Text("Categories")
                        .font(.subheadline)
                        .font(.subheadline)
                        .fontWeight(.heavy)
                }
                Text("Accounts")
                    .font(.caption)
                    .fontWeight(.black)
                    .foregroundColor(Color.gray)
                Text("Credit Cards")
                    .font(.caption)
                    .fontWeight(.black)
                    .foregroundColor(Color.gray)
                    
                
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

//
//  ContentView.swift
//  Bookworm
//
//  Created by Görkem Güray on 9.07.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    
    
    @State private var showingAddScreen = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        
                        
                    }
                    
                }
            }
                .navigationTitle("Bookworm")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    } //toolbarItem
                } //toolbar
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
            
                .navigationDestination(for: Book.self) { book in
                    DetailView(book: book)
                }
        } //NavigationStack
    } //body
}

#Preview {
    ContentView()
}

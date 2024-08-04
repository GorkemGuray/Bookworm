//
//  AddBookView.swift
//  Bookworm
//
//  Created by Görkem Güray on 14.07.2024.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var isAllAreaValid: Bool {
        if title.isBlank || author.isBlank || rating<1 || review.isBlank {
            return false
        }
            
        return true
            
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        } //ForEach
                    } //Picker
                } //Section-1
                
                Section("Write a review"){
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                } //Section-2
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: Date.now)
                        modelContext.insert(newBook)
                        dismiss()
                    } //Button
                    .disabled(isAllAreaValid == false)
                } //Section-3
            } //Form
            .navigationTitle("Add Book")
        } //NavigationStack
    }
}


extension String {
    var isBlank: Bool {
        allSatisfy({$0.isWhitespace})
    }
}


#Preview {
    AddBookView()
}

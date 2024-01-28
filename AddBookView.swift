//
//  AddBookView.swift
//  ProBookworm
//
//  Created by Sothesom on 07/11/1402.
//

import SwiftUI

struct AddBookView: View {
    
    // ما باید یک متغییر محیطی از زخیره زمینه شی مدیریت شده مان داشته باشیم
    @Environment(\.managedObjectContext) var moc
    //برای وقتیه که کاربر وقتی خواست محتوای جدید وارد کنه قبلی ها پاگ بشه
    @Environment(\.dismiss) var dismiss
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("نام کتاب", text: $title)
                    TextField("نام نویسنده", text: $author)
                                    
                    Picker("ژانر", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section{
                    TextEditor(text: $review)
                    ReatingView(rating: $rating)
                    
                } header: {
                    Text("Write a reviwe")
                }
                Section{
                    Button("Save"){
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        
                        try? moc.save()
                        dismiss()
                    }
                }
                .navigationTitle("Add Book")
            }
        }
    }
}

#Preview {
    AddBookView()
}

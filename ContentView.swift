//
//  ContentView.swift
//  ProBookworm
//
//  Created by Sothesom on 07/11/1402.
//

import SwiftUI

struct ContentView: View {
    @Environment (\.managedObjectContext) var moc
    @FetchRequest (sortDescriptors: [ // مرتب سازی بر اساسه:
        SortDescriptor(\.title), // و در مرحله بعد اگر دیتا ها زیاد باشه
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    @State private var showAddBookView = false
    var body: some View {
        NavigationView{
            List{
                ForEach(books) { book in
                    NavigationLink{
                        DatailVeiw(book: book)
                    } label: {
                        HStack{
                            EmojiReatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                Text(book.title ?? "Unknow title")
                                    .font(.headline)
                                Text(book.author ?? "Unknow author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform:deleteBook)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading){
                    EditButton()
                }
                ToolbarItem (placement: .navigationBarTrailing){
                    Button{
                        showAddBookView.toggle()
                    } label: {
                        Label("add book", systemImage: "plus")
                    }
                }
            }
                .sheet(isPresented: $showAddBookView){
                    AddBookView()
                }
        }
    }
    
    func deleteBook (at offsets: IndexSet){
        for offset in offsets{
            let book = books[offset]
            moc.delete(book)
        }
        try? moc.save()
    }
}

#Preview {
    ContentView()
}

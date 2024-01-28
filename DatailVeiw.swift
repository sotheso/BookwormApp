//
//  DatailVeiw.swift
//  ProBookworm
//
//  Created by Sothesom on 07/11/1402.
//

import SwiftUI

struct DatailVeiw: View {

    let book : Book
    @Environment (\.managedObjectContext) var moc
    @Environment (\.dismiss) var dismiss
    
    @State private var showDeleteAllarm = false
    
    
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genre ?? "Fantesy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre? .uppercased() ?? "Fantesy")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            Text(book.author ?? "Unknow ")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "Unknow")
                .padding()
            
            ReatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknow")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Book", isPresented: $showDeleteAllarm){
            Button("delete", role: .destructive , action: DeleteBook)
            Button("cancel", role: .cancel){ }
        } message: {
            Text("Are you sure?")
        }
        .toolbar{
            Button{
                showDeleteAllarm = true
            } label: {
               Label("Delete Book", systemImage: "trash")
            }
        }
    }
    
    
    func DeleteBook(){
        moc.delete(book)
        try? moc.save()
    }
}
//
//#Preview {
//    DatailVeiw()
//}

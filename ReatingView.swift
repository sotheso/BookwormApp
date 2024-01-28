//
//  ReatingView.swift
//  ProBookworm
//
//  Created by Sothesom on 07/11/1402.
//

import SwiftUI

struct ReatingView: View {
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @Binding var rating: Int
    
    var lable = ""
    var maximumRating = 5
    
    var offImage : Image?
    var onImage = Image (systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    
    var body: some View {
        HStack{
            if lable.isEmpty == false {
                Text(lable)
            }
            ForEach(1..<maximumRating + 1, id: \.self) {number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
        
    }
    
    func image(for number: Int) -> Image {
        if number > rating{
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

#Preview {
    ReatingView(rating: .constant(4))
}

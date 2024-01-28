//
//  EmojiReatingView.swift
//  ProBookworm
//
//  Created by Sothesom on 07/11/1402.
//

import SwiftUI

struct EmojiReatingView: View {
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>

    
    let rating : Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("☹️")
        case 2:
            return Text("🫤")
        case 3:
            return Text("🙂")
        case 4:
            return Text("☺️")
        default:
            return Text("😍")
        }
    }
}

#Preview {
    EmojiReatingView(rating: 5)
}

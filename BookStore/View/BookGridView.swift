//
//  BookGridView.swift
//  BookStore
//
//  Created by shahadmufleh on 08/01/2022.
//

import SwiftUI

struct BookGridView: View {
    let book: MyBooks
    var body: some View {
       
         
            HStack {
                
                Image(book.mainImage)
                .resizable()
                .frame(width: 120, height: 180)
                .cornerRadius(15)
  
            
        }

                        
    }
        
    }
            

struct BookGridView_Previews: PreviewProvider {
    static var previews: some View {
        BookGridView(book: MyBooks.example)
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .extraSmall)
    }
}

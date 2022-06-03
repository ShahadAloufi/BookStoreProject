//
//  BookDetailView.swift
//  BookStore
//
//  Created by shahadmufleh on 08/01/2022.
//

import SwiftUI

struct BookDetailView: View {
    @EnvironmentObject var order: Order
    let book: MyBooks
    var body: some View {
        
        
      
            VStack {
                ScrollView {
                    VStack {
                    ScrollView(.horizontal, showsIndicators: true) {
                    HStack {
                    Image(book.mainImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 199)
                    Image(book.thumbnailImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 199)
                    Image(book.authorImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 390, height: 360)
                }
        }
                    
                     Text("Name: \(book.name)")
                     .fontWeight(.bold)
                     Text("Author: \(book.author)")
                     .fontWeight(.bold)
                     .padding(.top,1)
                     Text("Price: $\(book.price)")
                     .fontWeight(.bold)
                     .padding(.top,1)
                     Text("Summary:")
                     .fontWeight(.bold)
                     .padding(.top,1)
                     Text(book.description)
                     .multilineTextAlignment(.center)
                     .padding(.top,1)
                     Button("Order This Book") {
                         order.add(item: book)
                    }
                    .foregroundColor(.black)
                    .frame(width: 170, height: 40)
                    .background(Color.white)
                    .cornerRadius(39)
                    .padding()
                    }
                        .padding()
                }
                .navigationTitle(book.name)
            .navigationBarTitleDisplayMode(.inline)
            }
        }
    }



struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: MyBooks.example)
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .small)
            .environmentObject(Order())
    }
}

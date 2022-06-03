//
//  ContentView.swift
//  BookStore
//
//  Created by shahadmufleh on 07/01/2022.

import SwiftUI


struct ContentView: View {
    let genre = Bundle.main.decode([Genres].self, from: "Books.json")
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 2), count: 3)
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false){
                    LazyVGrid(columns: columns,
                              spacing: 19,
                              pinnedViews: [.sectionHeaders],
                              content: {
                        ForEach(genre){ i in
                            Section(header: HStack {
                                Text(i.genre)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .padding()
                                    .frame(width: 410, height: 30, alignment: .leading)
                                    .background(Color.black)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.white)
                            }
                                    
                                    
                            ){
                                ForEach(i.books) { book in
                                    NavigationLink(destination: BookDetailView(book: book)){
                                        
                                        BookGridView(book: book)
                                        
                                    }
                                    
                                    
                                }
                                
                            }
                            
                            
                        }
                        .navigationTitle("Library")
                        
                    })
                    
                    
                }
            }
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .small)
    }
}

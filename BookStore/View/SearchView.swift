//
//  SearchView.swift
//  BookStore
//
//  Created by shahadmufleh on 11/01/2022.
//

import SwiftUI

struct SearchView: View {
    let genres = Bundle.main.decode([Genres].self, from: "Books.json")
    @State var SearchText = ""
    @State private var isEditing = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search book here", text: $SearchText)
                        .padding(15)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(18)
                        .overlay(
                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 15)
                                if isEditing{
                                    Button(action: {
                                        self.SearchText = ""
                                    }, label: {
                                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 12)
                                    })
                                }
                            }
                        ).onTapGesture {
                            self.isEditing = true
                    }
                
                
                if isEditing{
                    Button(action: {
                        self.isEditing = false
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        
                    }){
                        Text("Cancel")
                        
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))

                
            }
                
            }
                .padding()
                
                List{
                    ForEach(genres){ i in
                        ForEach(i.books.filter({"\($0.name)".contains(SearchText) || SearchText.isEmpty})){ book in
                            NavigationLink(destination: BookDetailView(book: book)){
                            Text(book.name)
                                .font(.body)
                            }
                                
                            }
                            
                            
                        }
                        
                        
                    }
                .navigationTitle("Books")
            }
            
            
                
            }
        
        
        
        
        
        }
      
        
        
      
    }


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .extraSmall)
    }
}

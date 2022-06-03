//
//  JSONData.swift
//  BookStore
//
//  Created by shahadmufleh on 08/01/2022.
//

import Foundation
import SwiftUI


struct Genres: Decodable, Identifiable, Equatable {
    var id: UUID
    var genre: String
    var genreIndex: Int
    var books: [MyBooks]

    

}

struct MyBooks: Decodable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var author: String
    var price: Int
    var description: String
    
    static let example = MyBooks(id: UUID(), name: "Wuthering Heights", author: "Emily Brontë", price: 15, description: "Wuthering Heights is commonly thought of as romantic, but try rereading it without being astonished by the extremes of physical and psychological violence' Jeanette Winterson Emily Bronte's novel of impossible desires, violence and transgression is a masterpiece of intense, unsettling power. It begins in a snowstorm, when Lockwood, the new tenant of Thrushcross Grange on the bleak Yorkshire moors, is forced to seek shelter at Wuthering Heights. There he discovers the history of the tempestuous events that took place years before: the intense passion between the foundling Heathcliff and Catherine Earnshaw, her betrayal of him and the bitter vengeance he now wreaks on the innocent heirs of the past.")
    
    
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-back"
    }
    
    var authorImage: String {
        "\(mainImage)-author-photo"
    }
    
    
}


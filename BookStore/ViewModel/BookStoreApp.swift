//
//  BooksApp.swift
//  BookStore
//
//  Created by shahadmufleh on 07/01/2022.
//

import SwiftUI

@main
struct BookStoreApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraSmall)
                .environmentObject(order)
        }
    }
}

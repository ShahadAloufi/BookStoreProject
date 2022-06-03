//
//  Order.swift
//  BookStore
//
//  Created by shahadmufleh on 12/01/2022.
//

import Foundation
//create a class of order that inherit from ObservableObject
//add a published variable of type [MyBooks] struct
// we have one prop for this class and two behaviors (funcs)
// 1- total
//2-
class Order: ObservableObject {
    
    //one prop
    @Published var items = [MyBooks]()

    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }

    
    //two behaviors (funcs)
    func add(item: MyBooks) {
        items.append(item)
    }

    func remove(item: MyBooks) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    
    
    
}


/*
 class Order {
 
 one prop
 var total: Int
 
 
 two funcs
 
 func add(book: [MyBooks]){
 
 
 
 }
 
 
 func remove(){
 
 
 
 
 }
 
 
 
 }
 
 
 */

//
//  Book.swift
//  LibraryAppiOS
//
//  Created by karyna on 7/26/19.
//  Copyright © 2019 karyna.com. All rights reserved.
//

import UIKit

class Books: Codable {
    let books: [Book]

    init(books: [Book]) {
        self.books = books
    }
}

 class Book: Codable {
    var id: Int?
    var bookTitle: String?
    var bookYear: Int?

    //    let genre: [Genre]
    //    let ratings: [Rating]
    //    let cast: [Cast]

    init(id: Int?, bookTitle: String?, bookYear: Int?) {
        self.id = id
        self.bookTitle = bookTitle
        self.bookYear = bookYear

    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case bookTitle = "title"
        case bookYear = "year"
        //        case genre = "genre"
        //        case rating = "ratings"
        //        case cast = "cast"
    }
}

//struct Genre: Decodable {
//    let name: String
//    let description: String
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case description = "description"
//    }
//}

//struct Rating: Decodable {
//    let comment: String
//    let rating: Int
//    let date: NSDate
//
//    enum CodingKeys: String, CodingKey {
//        case comment = "comment"
//        case rating = "rating"
//        case date = "date"
//    }
//
//}
//
//struct Cast: Decodable {
//    actorName: String
//    role: String
//    numberOfAwards: String
//
//    enum CodingKeys: String, CodingKey {
//        case actorName = "name"
//        case role = "inAs"
//        case numberOfAwards = "noOfAwards"
//    }
//
//}

//
//  ViewController.swift
//  LibraryAppiOS
//
//  Created by karyna on 7/24/19.
//  Copyright © 2019 karyna.com. All rights reserved.
//

import UIKit

struct Book: Codable {
    let id: Int?
    let bookTitle: String?
    let bookYear: Int?

//    let genre: [Genre]
//    let ratings: [Rating]
//    let cast: [Cast]

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

class ViewController: UIViewController, UITableViewDataSource {

    var books = [Book]()
    let decoder = JSONDecoder()
    
    @IBOutlet weak var tableView: UITableView!


    static let cellReuseIdentifier = "identifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()

        let login = "user"
        let password = "password"

        let url = NSURL(string: "http://localhost:8080/books")
        let request = NSMutableURLRequest(url: url! as URL)

        let config = URLSessionConfiguration.default
        let userPasswordString = "\(login):\(password)"
        let userPasswordData = userPasswordString.data(using: String.Encoding.utf8)
        let base64EncodedCredential = userPasswordData!.base64EncodedString()
        let authString = "Basic \(base64EncodedCredential)"
        config.httpAdditionalHeaders = ["Authorization" : authString]
        let session = URLSession(configuration: config)


        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let data = data else { return }

            let bookWrapper = try! self.decoder.decode([Book].self, from: data)
            //let book = bookWrapper[]

            for info in self.books {
                    print(info.bookTitle)
                    print(info.bookYear)
                    print(info.id)


            }

            print("\(bookWrapper)")

            // print("The response is : ",String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }

    func loadBooks() {
        guard let book1 = Book(id: books. , bookTitle: <#T##String?#>, bookYear: <#T##Int?#>)
    }


    private func configureTableView() {
        self.tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.tableView.frame = self.view.bounds
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let books = self.books else {
//            return 0
//        }
//
       return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellReuseIdentifier)

        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: ViewController.cellReuseIdentifier)
        }

        let feedItem = self.books[indexPath.row]

        let bookYearString = "\(String(describing: feedItem.bookYear))"

        cell?.textLabel?.text = bookYearString

        if let title = feedItem.bookTitle {
            cell?.detailTextLabel?.text = "By \(String(describing: title))"
        }
        else {
            cell?.detailTextLabel?.text = nil
        }

        return cell!
    }
}


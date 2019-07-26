//
//  ViewController.swift
//  LibraryAppiOS
//
//  Created by karyna on 7/24/19.
//  Copyright © 2019 karyna.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var books = [Book]()
    let decoder = JSONDecoder()
    
    @IBOutlet weak var tableView: UITableView!


    static let cellReuseIxdentifier = "identifier"

    override func viewDidLoad() {
        super.viewDidLoad()

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

            var downloadedBooks = try! self.decoder.decode([Book].self, from: data)
            //self.books = downloadedBooks.books
//            self.books = downloadedBooks.append(books)
            print(downloadedBooks.id)
            print(downloadedBooks.bookTitle)
            print(downloadedBooks.bookYear)

            //let book = bookWrapper[]

//            for info in self.books {
//                    print(info.bookTitle)
//                    print(info.bookYear)
//                    print(info.id)
//
//
//            }
            print(downloadedBooks)

           // print("\(self.books)")

            // print("The response is : ",String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }

//    func loadBooks() {
//        let bookId =
//        guard let book1 = Book(id:self.books , bookTitle: <#T##String?#>, bookYear: <#T##Int?#>)
//    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as? BookCell else { return UITableViewCell() }

        var stringId = "\(String(describing: books[indexPath.row].id))"
        var stringYear = "\(books[indexPath.row].bookYear)"

        cell.idLabel.text = stringId
        cell.titleLabel.text = books[indexPath.row].bookTitle
        cell.yearLabel.text = stringYear

        return cell
    }
}


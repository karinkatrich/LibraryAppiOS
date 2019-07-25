//
//  ViewController.swift
//  LibraryAppiOS
//
//  Created by karyna on 7/24/19.
//  Copyright © 2019 karyna.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
            print("The response is : ",String(data: data, encoding: .utf8)!)
        }
        task.resume()

//        let url = NSURL(string: "http://localhost:8080/books")
//        let task = URLSession.shared.dataTask(with: url! as URL) {
//            (data, response, error) in
//            if let dataReturned = data {
//                print(NSString(data: dataReturned, encoding: String.Encoding.utf8.rawValue)!)
//            }
//        }
//
//        task.resume()

//       let username = "username"
//        let password = "password"
//        let loginString = "\(username):\(password)"
//
//        guard let loginData = loginString.data(using: String.Encoding.utf8) else {
//            return
//        }
//        let base64LoginString = loginData.base64EncodedString()
//
//        let url = URL(string: "http://localhost:8080/books")!
//        var request = URLRequest(url: url)
//
//        request.httpMethod = "GET"
//        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
//
//
//
//        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//            guard let data = data else { return }
//            print("The response is : ",String(data: data, encoding: .utf8)!)
//            //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as Any)
//        }
//        task.resume()
//
}

}

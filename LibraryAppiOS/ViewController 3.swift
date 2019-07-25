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

//        let url = NSURL(string: "http://localhost:8080/books")
//        let task = URLSession.shared.dataTask(with: url! as URL) {
//            (data, response, error) in
//            if let dataReturned = data {
//                print(NSString(data: dataReturned, encoding: String.Encoding.utf8.rawValue)!)
//            }
//        }
//
//        task.resume()

        // credentials encoded in base64
        let username = "user"
        let password = "password"
        let loginData = String(format: "%@:%@", username, password).data(using: String.Encoding.utf8)!
        let base64LoginData = loginData.base64EncodedString()

        // create the request
        let url = URL(string: "http://myurl.com")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Basic \(base64LoginData)", forHTTPHeaderField: "Authorization")

        //making the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("\(error)")
                return
            }

            if let httpStatus = response as? HTTPURLResponse {
                // check status code returned by the http server
                print("status code = \(httpStatus.statusCode)")
                // process result
            }
        }
        task.resume()

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

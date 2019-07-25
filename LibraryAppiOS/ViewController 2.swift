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

        let username = "username"
        let password = "password"
        let loginString = "\(username):\(password)"

        guard let loginData = loginString.data(using: String.Encoding.utf8) else {
            return
        }
        let base64LoginString = loginData.base64EncodedString()

        var request: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.httpMethod = "GET"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")

//        guard let url = URL(string: "http://localhost:8080/book") else {return}
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let dataResponse = data,
//                error == nil else {
//                    print(error?.localizedDescription ?? "Response Error")
//                    return }
//            do{
//                //here dataResponse received from a network request
//                let jsonResponse = try JSONSerialization.jsonObject(with:
//                    dataResponse, options: [])
//                print(jsonResponse) //Response result
//            } catch let parsingError {
//                print("Error", parsingError)
//            }
//        }
//        task.resume()

       // sendGetRequest()
//
//        let userCredential = URLCredential(user: "user",
//                                           password: "password",
//                                           persistence: .permanent)
//
//        let protectionSpace = URLProtectionSpace(host: "localhost", port: 8080, protocol: "http", realm: "library", authenticationMethod: NSURLAuthenticationMethodHTTPBasic)
//        URLCredentialStorage.shared.setDefaultCredential(userCredential, for: protectionSpace)
//
//                let url = URL(string: "http://localhost:8080/book")!
//
//                let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//                    guard let data = data else { return }
//                    print("The response is : ",String(data: data, encoding: .utf8)!)
//                    //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as Any)
//                }
//                task.resume()

    }

//
//    func sendGetRequest() {
//
//        let request = NSMutableURLRequest(url: NSURL(string: "http://localhost:8080/book")! as URL)
//        request.addValue("Bearer \(access_token)", forHTTPHeaderField: "Authorization")
//        let session = URLSession.shared
//        request.httpMethod = "GET"
//
//        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
//            if let data = data {
//                if let stringData = String(data: data, encoding: String.Encoding.utf8) {
//                    print(stringData)
//                }
//            }
//        }
//            task.resume()
//    }

}


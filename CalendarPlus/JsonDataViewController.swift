//
//  JsonDataViewController.swift
//  CalendarPlus
//
//  Created by Dennis Andersson on 2019-11-23.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit

class JsonDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loopThroughJsonData()
      }
    
    
    func loopThroughJsonData() {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?id=2702979&appid=b735e62ad63a9bfca66220a9529e85a7") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do {
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                                       dataResponse, options: [])
                print(jsonResponse) //Response result
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
    }
}

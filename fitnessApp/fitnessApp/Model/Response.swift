//
//  Response.swift
//  fitnessApp
//
//  Created by Abduraxmon on 06/04/23.
//

import Foundation

protocol ModelDelegate {
    func dataFetch(_ data: Model)
}

class ApiResponse {
    
    var delegate: ModelDelegate?
    
    func getData(_ bodyPart: String) {
        //Create url object
        
        let url = URL(string: "\(K.url)/\(bodyPart.replacingOccurrences(of: " ",with: "%20"))/?rapidapi-key=\(K.apiKey)")
        guard url != nil else {
            return
        }
        //Create urlSession object
        let sesion = URLSession.shared
        
        //Get data task from urlsession obj
        let dataTask = sesion.dataTask(with: url!) { (data, response, error) in
            //Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                //Parsing the data to video object
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Model.self, from: data!)
                // call the delegate method
                if !response.isEmpty {
                    self.delegate?.dataFetch(response)
                }
            } catch {
                
            }
            
        }
        //Kick off the task
        dataTask.resume()
    }
}

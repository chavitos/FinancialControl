//
//  NetworkManager.swift
//  FinancialControl
//
//  Created by Tiago Chaves on 11/12/19.
//  Copyright © 2019 Tempest. All rights reserved.
//

import Foundation

let application = "application/x-www-form-urlenconded"
let headerField = "Content-Type"

class NetworkManager {
    static func request(type: HttpMethod, withUrl url:String, param: [String:Any?]?=nil, completion:@escaping((Data?,HTTPURLResponse?,Error?) -> Void)) {
        
        guard let url = URL(string: url) else { return }
        
        var request = URLRequest.init(url: url)
        request.httpMethod = type.rawValue
        request.setValue(application, forHTTPHeaderField: headerField)
        
        if let json = param {
            //let data = try! JSONEncoder().encode(param)
            let data = try! JSONSerialization.data(withJSONObject: json, options: [])
            request.httpBody = data
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil,nil,error)
            } else if let data = data, let response = response as? HTTPURLResponse {
                completion(data,response,nil)
            }
        }.resume()
    }
}

enum HttpMethod: String {
    case GET
    case POST
}

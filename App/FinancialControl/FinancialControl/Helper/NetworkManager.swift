//
//  NetworkManager.swift
//  FinancialControl
//
//  Created by Tiago Chaves on 11/12/19.
//  Copyright © 2019 Tempest. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static func request(withUrl url:String, completion:@escaping((Data?,HTTPURLResponse?,Error?) -> Void)) {
        
        guard let url = URL(string: url) else { return }
        
        let task = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil,nil,error)
            }else if let data = data,
                let response = response as? HTTPURLResponse {
                
                completion(data, response,nil)
            }
        }
        
        task.resume()
    }
}


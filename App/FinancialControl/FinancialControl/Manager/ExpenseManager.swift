//
//  ExpenseManager.swift
//  FinancialControl
//
//  Created by Renan Coelho on 16/12/2019.
//  Copyright © 2019 Tempest. All rights reserved.
//

import Foundation


class ExpenseManager {
    
    let url = "http://localhost:3002/v1/expenses/"
    
    func getAll(completion: @escaping (([Expense]) -> Void)) {
        NetworkManager.request(type: HttpMethod.GET, withUrl: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion([])
            } else if response?.statusCode == 200 {
                if let data = data {
                    do {
                        let result = try? JSONDecoder().decode([Expense].self, from: data)
                        completion(result ?? [])
                    } catch {
                        completion([])
                    }
                }
            }
        }
    }
}

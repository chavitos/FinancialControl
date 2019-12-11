//
//  Expense.swift
//  FinancialControl
//
//  Created by Tiago Chaves on 11/12/19.
//  Copyright © 2019 Tempest. All rights reserved.
//

import Foundation

struct Expense: Codable {
    var name: String
    var date: Date
    var type: String
    var value: Double
}

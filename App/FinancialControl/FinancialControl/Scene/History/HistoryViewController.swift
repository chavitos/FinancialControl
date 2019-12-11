//
//  HistoryViewController.swift
//  FinancialControl
//
//  Created by Tiago Chaves on 11/12/19.
//  Copyright © 2019 Tempest. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    var expenses: [Expense] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        
        let expense1 = Expense(name: "McDonalds", date: Date(), type: "Alimentação", value: 200.0)
        let expense2 = Expense(name: "Seguro da casa", date: Date(), type: "Casa", value: 200.0)
        let expense3 = Expense(name: "Barbearia", date: Date(), type: "Cuidado", value: 200.0)
        
        expenses.append(expense1)
        expenses.append(expense2)
        expenses.append(expense3)
    }
}

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let expense = expenses[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as? ExpenseTableViewCell {
            cell.configCell(expense: expense)
            return cell
        }
        
        return UITableViewCell()
    }
}

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
        
        ExpenseManager().getAll(completion:{ expenses in
            self.expenses = expenses
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
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

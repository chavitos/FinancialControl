//
//  ExpenseTableViewCell.swift
//  FinancialControl
//
//  Created by Tiago Chaves on 11/12/19.
//  Copyright © 2019 Tempest. All rights reserved.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLable: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configCell(expense: Expense) {
        nameLable.text = expense.name
        typeLabel.text = expense.type
//        valueLabel.text = expense.value
//        dateLabel.text = expense.date
        
        valueLabel.text = "- R$ 100,00"
        dateLabel.text = "11/12/2019"
    }

}

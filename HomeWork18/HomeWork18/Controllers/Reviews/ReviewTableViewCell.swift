//
//  ReviewTableViewCell.swift
//  HomeWork18
//
//  Created by Дарья Дубровская on 17.02.22.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textReviewLabel: UILabel!
    @IBOutlet weak var markReviewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

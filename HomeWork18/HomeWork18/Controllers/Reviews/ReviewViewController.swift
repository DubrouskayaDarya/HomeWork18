//
//  ReviewViewController.swift
//  HomeWork18
//
//  Created by Дарья Дубровская on 17.02.22.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var reviewTableView: UITableView!

    var index: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        // reviewTableView.rowHeight = 100
    }
}

extension ReviewViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataManager.shared.meals[index].feedbacks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell
        let feedback = DataManager.shared.meals[index].feedbacks[indexPath.row]
        cell.dateLabel.text = feedback.dateString
        cell.textReviewLabel.text = feedback.text
        cell.markReviewLabel.text = feedback.ratingBar
        return cell
    }
}

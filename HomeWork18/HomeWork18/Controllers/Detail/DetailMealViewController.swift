//
//  DetailMealViewController.swift
//  HomeWork18
//
//  Created by Дарья Дубровская on 16.02.22.
//

import UIKit

class DetailMealViewController: UIViewController {

    var index: Int!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameVabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    @IBOutlet weak var nameButtonReviews: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let meal = DataManager.shared.meals[index]
        title = "\(meal.name)"
        imageView?.image = meal.image
        nameVabel?.text = meal.name
        feedbackLabel?.text = "\(meal.ratingBar)"
        priceLabel?.text = "\(meal.price) BYN"
        nameButtonReviews.setTitle("Просмотреть отзывы (\(DataManager.shared.meals[index].feedbacks.count))", for: .normal)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let vcFeedback as FeedbackViewController:
            vcFeedback.index = index
        case let vcReviews as ReviewViewController:
            vcReviews.index = index
        default: break
        }
    }
}

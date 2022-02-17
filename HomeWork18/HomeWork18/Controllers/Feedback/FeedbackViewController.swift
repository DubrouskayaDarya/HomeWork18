//
//  FeedbackViewController.swift
//  HomeWork18
//
//  Created by Дарья Дубровская on 16.02.22.
//

import UIKit

class FeedbackViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var saveReviewButton: UIButton!

    var index: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        saveReviewButton.isEnabled = false
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView.text.count < 20 {
            errorLabel.isHidden = false
            saveReviewButton.isEnabled = false
            return true
        } else {
            errorLabel.isHidden = true
            saveReviewButton.isEnabled = true
            return true
        }
    }

    @IBAction func saveReviewButtonTapped(_ sender: Any) {
        let feedback = Meal.Feedback(text: textView.text, mark: Double(segmentedControl.selectedSegmentIndex + 1))
        DataManager.shared.meals[index].feedbacks.append(feedback)
        (presentingViewController as? UINavigationController)?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}

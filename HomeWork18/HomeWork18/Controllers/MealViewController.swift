//
//  ViewController.swift
//  HomeWork18
//
//  Created by Дарья Дубровская on 16.02.22.
//

import UIKit

class MealViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailMealViewController,
            let index = (sender as? IndexPath)?.row {
            vc.index = index
        }
    }
}

extension MealViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataManager.shared.meals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell") else { return UITableViewCell() }
        let meal = DataManager.shared.meals[indexPath.row]
        cell.textLabel?.text = "\(meal.name)"
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = "\(meal.price) BYN \n\(meal.ratingBar)"
        cell.imageView?.image = meal.image
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailView", sender: indexPath)
    }
}

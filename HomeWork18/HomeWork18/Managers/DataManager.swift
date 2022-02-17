//
//  DataManager.swift
//  HomeWork18
//
//  Created by Дарья Дубровская on 16.02.22.
//

import Foundation
import UIKit

class DataManager {
    static let shared = DataManager()
    var meals: [Meal]

    private init() {
        meals = [Meal(name: "Картошка", price: 3.0, image: UIImage(named: "картошка")),
                 Meal(name: "Сок", price: 2.0, image: UIImage(named: "сок")),
                 Meal(name: "Бургер", price: 6.0, image: UIImage(named: "бургер"))]
    }
}

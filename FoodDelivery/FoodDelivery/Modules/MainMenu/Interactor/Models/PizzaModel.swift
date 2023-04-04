//
//  PizzaModel.swift
//  FoodDelivery
//
//  Created by Ольга Цуприк on 4.04.23.
//

import Foundation

struct ProductModel: Codable, Hashable {
    var img: String
    var name: String
    var description: String
    var price: Int
}

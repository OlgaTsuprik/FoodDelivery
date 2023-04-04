//
//  BannerModel.swift
//  FoodDelivery
//
//  Created by Ольга Цуприк on 3.04.23.
//

import UIKit

struct Banner {
    var image: UIImage
}

class BannerModel {
// MARK: - Properties

    var banners: [Banner] = []

// MARK: - Construction

    init() {
        setup()
    }

// MARK: - Methods
    func setup() {
        let banner1 = Banner(image: UIImage(named: "banner") ?? UIImage())
        let banner2 = Banner(image: UIImage(named: "banner") ?? UIImage())
        let banner3 = Banner(image: UIImage(named: "banner") ?? UIImage())
        let banner4 = Banner(image: UIImage(named: "banner") ?? UIImage())
        self.banners = [banner1, banner2, banner3, banner4]
    }
}

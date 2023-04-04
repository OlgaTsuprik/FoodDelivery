//
//  BannerCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Ольга Цуприк on 3.04.23.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
// MARK: - Properties

    @IBOutlet weak var bannerImage: UIImageView!

// MARK: - Methods

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(banner: Banner) {
        self.bannerImage.image = banner.image
        self.bannerImage.layer.cornerRadius = 10
    }
}

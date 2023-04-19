//
//  MenuTableViewCell.swift
//  FoodDelivery
//
//  Created by Ольга Цуприк on 3.04.23.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
// MARK: - Properties

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productIngridientsLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var productImage: UIImageView!

// MARK: - Methods

    override func awakeFromNib() {
        super.awakeFromNib()

        configureButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func configureButton() {
        buyButton.titleLabel?.textColor = UIColor(named: "lineColor")
        buyButton.layer.borderWidth = Constants.borderWidth
        buyButton.layer.cornerRadius = Constants.cornerRadius
        buyButton.layer.borderColor = UIColor(named: "lineColor")?.cgColor
    }

    func confugure(model: ProductModel) {
        self.nameLabel.text = model.name
        self.productIngridientsLabel.text = model.description
        self.buyButton.titleLabel?.text = "\(model.price) $"
        self.productImage.downloadedFrom(link: model.img)
    }

// MARK: - Constants

    private enum Constants {
        static let cornerRadius: CGFloat = 6
        static let borderWidth: CGFloat = 1
    }
}

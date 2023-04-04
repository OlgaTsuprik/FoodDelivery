//
//  GroupsCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Ольга Цуприк on 3.04.23.
//

import UIKit

class GroupsCollectionViewCell: UICollectionViewCell {
// MARK: - Properties

    @IBOutlet weak var groupView: UIView!
    @IBOutlet weak var groupLabel: UILabel!

// MARK: - Methods

    override func awakeFromNib() {
        super.awakeFromNib()

        configureGroupView()
    }

    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                groupView.backgroundColor = UIColor(named: "lineColor_withAlpha")
                groupLabel.textColor = UIColor(named: "lineColor")
            } else {
                groupView.backgroundColor = UIColor(named: "backgroundColor")
                groupLabel.textColor = UIColor(named: "lineColor_withAlpha")
            }
        }
    }

    private func configureGroupView() {
        groupView.layer.borderWidth = 1
        groupView.layer.cornerRadius = 20
        groupView.layer.borderColor = UIColor(named: "lineColor_withAlpha")?.cgColor
    }

    func configureCell(text: String) {
        groupLabel.text = text
    }
}

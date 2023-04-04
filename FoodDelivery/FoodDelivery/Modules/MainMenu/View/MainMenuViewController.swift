//
//  MainMenuViewController.swift
//  FoodDelivery
//
//  Created by Ольга Цуприк on 3.04.23.
//

import UIKit

protocol MainMenuViewInput {
    func displayProductModel(model: [[ProductModel]])
}

class MainMenuViewController: UIViewController, MainMenuViewInput {
// MARK: - Properties

    var banners = BannerModel()
    var output: MainMenuViewOutput!
    var model: [[ProductModel]] = []


    @IBOutlet weak var bannersCollectionView: UICollectionView!
    @IBOutlet weak var groupsCollectionView: UICollectionView!
    @IBOutlet weak var menuTableView: UITableView!

    @IBOutlet weak var tableVIewConstraint: NSLayoutConstraint!

// MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "backgroundColor")

        self.bannersCollectionView.delegate = self
        self.bannersCollectionView.dataSource = self
        self.bannersCollectionView.register(
            UINib(nibName: "BannerCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "BannerCollectionViewCell"
        )

        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        self.menuTableView.separatorStyle = .none
        self.menuTableView.register(
            UINib(nibName: "MenuTableViewCell",
                                          bundle: nil),
            forCellReuseIdentifier: "MenuTableViewCell"
        )

        self.groupsCollectionView.dataSource = self
        self.groupsCollectionView.delegate = self
        self.groupsCollectionView.register(
            UINib(nibName: "GroupsCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "GroupsCollectionViewCell"
        )
        //self.groupsCollectionView.isUserInteractionEnabled = true

        setupTableViewDelegate()
        output.loadInitialData()
    }

    func setupTableViewDelegate() {
        if menuTableView.isTracking || menuTableView.isDragging || menuTableView.isDecelerating {
            tableVIewConstraint.constant = 104
        }
    }

    func displayProductModel(model: [[ProductModel]]) {
        self.model = model
    }
}

extension MainMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var itemsCount: Int = 0
        if collectionView == bannersCollectionView {
            itemsCount = banners.banners.count
        } else if collectionView == groupsCollectionView {
            itemsCount = model.count
        }

        return itemsCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()

        if collectionView == bannersCollectionView {
            let bannersCell = bannersCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
            bannersCell.configureCell(banner: banners.banners[indexPath.item])
            cell = bannersCell
        } else {
            let groupsCell = groupsCollectionView.dequeueReusableCell(withReuseIdentifier: "GroupsCollectionViewCell", for: indexPath) as! GroupsCollectionViewCell
            let groupItems = ["Pizza", "Desserts"]
            groupsCell.configureCell(text: groupItems[indexPath.row])
            if indexPath.row == 0 {
                groupsCell.isSelected = true
            }
            else {
                groupsCell.isSelected = false
            }
            cell = groupsCell
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == bannersCollectionView {
            return CGSize(width: 300, height: 112)
        } else {
            return CGSize(width: 96, height: 80)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == groupsCollectionView {
            let index = IndexPath(row: 0, section: indexPath.row)
            menuTableView.scrollToRow(at: index, at: .top, animated: true)
            }
        }
}

extension MainMenuViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        model.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        let section = model[indexPath.section]
        let model = section[indexPath.row]
        cell.confugure(model: model)

        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if menuTableView.contentOffset.y <= 140 {
            tableVIewConstraint.constant = 220 - menuTableView.contentOffset.y
        }
    }
}



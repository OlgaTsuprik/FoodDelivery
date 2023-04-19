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

    @IBOutlet weak var tableViewConstraint: NSLayoutConstraint!

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

        setupTableViewDelegate()
        output.loadInitialData()
    }

    func setupTableViewDelegate() {
        if menuTableView.isTracking || menuTableView.isDragging || menuTableView.isDecelerating {
            tableViewConstraint.constant = CGFloat(Constants.tableViewConstraint)
        }
    }

    func displayProductModel(model: [[ProductModel]]) {
        self.model = model
    }

// MARK: - Constants

    private enum Constants {
        static let tableViewConstraint = CGFloat(104)
        static let bannerSize = CGSize(width: 300, height: 112)
        static let groupsCellSize = CGSize(width: 96, height: 80)
        static let tablecontentOffset = CGFloat(140)
        static let contentSize = CGFloat(220)
    }
}

extension MainMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var itemsCount: Int = .zero
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
            if indexPath.row == .zero {
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
            return Constants.bannerSize
        } else {
            return Constants.groupsCellSize
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == groupsCollectionView {
            let index = IndexPath(row: .zero, section: indexPath.row)
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
        if menuTableView.contentOffset.y <= Constants.tablecontentOffset {
            tableViewConstraint.constant = Constants.contentSize - menuTableView.contentOffset.y
        }
    }
}



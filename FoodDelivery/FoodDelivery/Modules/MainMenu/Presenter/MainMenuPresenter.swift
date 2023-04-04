//
//  MainMenuPresenter.swift
//  FoodDelivery
//
//  Created by Ольга Цуприк on 4.04.23.
//

import Foundation

protocol MainMenuViewOutput {
    func loadInitialData()
}

class MainMenuPresenter: MainMenuViewOutput, MainMenuInteractorOutput {
// MARK: - Properties

    var view: MainMenuViewInput!
    var interactor: MainMenuInteractorInput!

// MARK: - Methods

    func setProductModel(model: [[ProductModel]]) {
        let model = model
        view.displayProductModel(model: model)
    }

    func loadInitialData() {
        interactor.loadInitialData()
    }
}

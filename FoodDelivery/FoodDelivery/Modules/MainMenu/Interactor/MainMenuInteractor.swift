//
//  MainMenuInteractor.swift
//  FoodDelivery
//
//  Created by Ольга Цуприк on 4.04.23.
//

import Foundation

protocol MainMenuInteractorInput {
    func loadInitialData()
}

protocol MainMenuInteractorOutput {
    func setProductModel(model: [[ProductModel]])
}

class MainMenuInteractor: MainMenuInteractorInput {
// MARK: - Construction

    init() {
        self.networkManager = NetworkManager()
    }

// MARK: - Properties
    private let networkManager: NetworkManagerProtocol
    var output: MainMenuInteractorOutput!

// MARK: - Methods

    func loadInitialData() {
        let pizzaModel: [ProductModel] = networkManager.load("Pizza.json")
        let dessertsModel: [ProductModel] = networkManager.load("Desserts.json")
        let businessModel = [pizzaModel, dessertsModel]
        output.setProductModel(model: businessModel)
    }
}

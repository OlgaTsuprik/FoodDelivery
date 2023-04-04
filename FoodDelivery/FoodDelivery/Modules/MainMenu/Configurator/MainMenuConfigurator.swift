//
//  MainMenuConfigurator.swift
//  FoodDelivery
//
//  Created by Ольга Цуприк on 3.04.23.
//

import UIKit

class MainMenuConfigurator {
    init() {}

    func createMainMenuModule() -> MainMenuViewController {
        let viewController = MainMenuViewController(nibName: "MainMenuViewController", bundle: nil)

        let presenter = MainMenuPresenter()
        viewController.output = presenter
        
        let interactor = MainMenuInteractor()
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}

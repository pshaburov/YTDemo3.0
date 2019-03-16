//
//  TableViewRouter.swift
//  YTDemo3.0
//
//  Created by Peter Shaburov on 3/7/19.
//  Copyright © 2019 Peter Shaburov. All rights reserved.
//

import Foundation
import UIKit

class TableViewRouter: PresenterToRouterProtocol{
    static func createModule() -> TableViewController {
        let view = mainStoryboard.instantiateViewController(withIdentifier: "MyViewController") as! TableViewController
        
        let presenter: TableViewtoPresenterProtocol & InteractorToPresenterProtocol = TableViewPresenter()
        let interactor: PresenterToInteractorProtocol = TableViewInteractor()
        let router: PresenterToRouterProtocol = TableViewRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}

//
//  TableViewProtocol.swift
//  YTDemo3.0
//
//  Created by Peter Shaburov on 3/7/19.
//  Copyright © 2019 Peter Shaburov. All rights reserved.
//

import Foundation

protocol TableViewtoPresenterProtocol: class {
    var view: PresenterToTableViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    var state: TableViewState { get }
    
    func loadChannels()
    func getPlaylistIDsIfNeeded()
    func getVideoIds()
    func getVideoStruct()
}

protocol PresenterToTableViewProtocol: class {
    func sendBackChannels(list: [String])
    func didChangeState()
}

protocol PresenterToRouterProtocol: class  {
    static func createModule() -> TableViewController
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    
    func fetchChannelList()
    func fetchVideoIds()
    func fetchPlaylistIds()
    func fetchVideoStruct()
}

protocol InteractorToPresenterProtocol: class {
    func recieveChannelList(list:[String])
    func recieveListOfPlaylistIds(list: [ListOfPlaylistID])
}


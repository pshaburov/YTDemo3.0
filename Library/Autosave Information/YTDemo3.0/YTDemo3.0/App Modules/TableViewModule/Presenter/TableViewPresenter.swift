//
//  TableViewPresenter.swift
//  YTDemo3.0
//
//  Created by Peter Shaburov on 3/7/19.
//  Copyright © 2019 Peter Shaburov. All rights reserved.
//

import Foundation
import UIKit

class TableViewPresenter: TableViewtoPresenterProtocol {
    func loadChannels() {
        interactor?.fetchChannelList()
    }
    func getPlaylistIDsIfNeeded() {
        interactor?.fetchPlaylistIds()
    }
    func getVideoIds(){
        interactor?.fetchVideoIds()
    }
    func getVideoStruct() {
        interactor?.fetchVideoStruct()
    }
    
    
    var view: PresenterToTableViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    var state: TableViewState = .recievedChannelList {
        didSet {
            view?.didChangeState()
        }
    }
    
    
}

extension TableViewPresenter: InteractorToPresenterProtocol{
    func recieveChannelList(list: [String]) {
        channelList = list
        state = .recievedChannelList
    }
    
    func recieveListOfPlaylistIds(list: [ListOfPlaylistID]) {
        var decider = 0
        
        for i in 0...list.count - 1 {
            let item = list[i].items
            for j in 0...(item?.count)! - 1 {
                if let x = item![j].contentDetails?.relatedPlaylists?.uploads {
                    playlistIdList.append(x)
                    decider = 0
                }
                if let z = item![j].snippet?.resourceID?.videoID {
                    videoIdList.append(z)
                    decider = 1
                }
                if let y = item![j].statistics?.viewCount {
                    let id = item![j].id
                    let title = item![j].snippet!.title
                    let creator = item![j].snippet?.channelTitle
                    let thumbnailUrl = item![j].snippet?.thumbnails?.thumbnailsDefault!.url
                    VideoStructArray.append(Video(id: id, views: Int(y), title: title, creator: creator, thumbnailUrl: thumbnailUrl))
                    decider = 2
                }
            }
        }
        if decider == 0 {
            state = .recievedPlaylistId
        } else if decider == 1 {
            state = .recievedVideoIds
        } else {
            state = .recievedVideoStructArray
        }
    }
}






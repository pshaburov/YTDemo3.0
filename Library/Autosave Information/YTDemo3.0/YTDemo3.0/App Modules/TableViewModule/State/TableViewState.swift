//
//  TableViewState.swift
//  YTDemo3.0
//
//  Created by Peter Shaburov on 3/7/19.
//  Copyright © 2019 Peter Shaburov. All rights reserved.
//

import Foundation

enum TableViewErrorReason {
    case badInternet
    case serverProblem
}

enum TableViewState {
    case recievedChannelList
    case recievedPlaylistId
    case recievedVideoIds
    case recievedVideoStructArray
    case error(reason: TableViewErrorReason)
}

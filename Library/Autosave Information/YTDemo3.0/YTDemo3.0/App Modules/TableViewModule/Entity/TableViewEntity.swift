//
//  TableViewEntity.swift
//  YTDemo3.0
//
//  Created by Peter Shaburov on 3/7/19.
//  Copyright © 2019 Peter Shaburov. All rights reserved.
//

import Foundation

let apiKey = "x"
var playlistLinks: [String] = []
var videoIdLinks: [String] = []
var videoDetailsLinks: [String] = []

var channelList:[String] = []
var playlistIdList:[String] = []
var videoIdList: [String] = []

public func getPlaylistLink(list: [String]) -> [String]{
    for i in 0...list.count - 1 {
        playlistLinks.append("https://www.googleapis.com/youtube/v3/channels?part=contentDetails,snippet&forUsername=\(list[i])&key=\(apiKey)")
    }
    return playlistLinks
    
}

public func getVideoIdLink() -> [String]{
    for i in 0...playlistIdList.count - 1 {
        videoIdLinks.append("https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(playlistIdList[i])&key=\(apiKey)")
    }
    return videoIdLinks
}

public func getVideoDetailsLink() -> [String]{
    for i in 0...videoIdList.count - 1 {
        videoDetailsLinks.append("https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&key=\(apiKey)&id=\(videoIdList[i])")
    }
    return videoDetailsLinks
}
var VideoStructArray = [Video(id: nil, views: nil, title: nil, creator: nil, thumbnailUrl:nil)]
struct Video {
    let id: String?
    let views: Int?
    let title: String?
    let creator: String?
    let thumbnailUrl: String?
}

//
//  TableViewController.swift
//  YTDemo3.0
//
//  Created by Peter Shaburov on 3/7/19.
//  Copyright © 2019 Peter Shaburov. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController{
    
    var presentor: TableViewtoPresenterProtocol?

    @IBOutlet weak var tableView: UITableView!
    
    var SortedVideoStructArray = [Video(id: nil, views: nil, title: nil, creator: nil, thumbnailUrl:nil)]

     let noUrl = URL(string: "https://lukescircle.com/wp-content/uploads/job-manager-uploads/company_logo/2018/08/no-thumbnail-medium.png")
    
    var VideoArray: Array<Video> = Array()
    var playlistArray: [String] = []
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        presentor?.loadChannels()
    }
  
    
    func didChangeState() {
        switch presentor?.state {
        case .recievedChannelList?:
            presentor?.getPlaylistIDsIfNeeded()
        case .recievedPlaylistId?:
            playlistLinks = getVideoIdLink()
            presentor?.getVideoIds()
        case .recievedVideoIds?:
           presentor?.getVideoStruct()
        case .recievedVideoStructArray?:
            VideoStructArray.remove(at: 0)
            SortedVideoStructArray =  VideoStructArray.sorted { ($1.views!) < ($0.views!) }
            print(SortedVideoStructArray)
            tableView.reloadData()
        case .error(let reason)?:
            print("error")
        case .none:
            print("My Code F*cked up sorry")
        }
    }
    
}

extension TableViewController: PresenterToTableViewProtocol {
    
    func sendBackChannels(list: [String]) {
        channelList = list
    }
    

}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if SortedVideoStructArray.count > 100 {
            return 100
        }
            return SortedVideoStructArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "idCellVideo", for: indexPath)
        if SortedVideoStructArray.count > 1 {
            cell.textLabel?.text = SortedVideoStructArray[indexPath.row].title
            cell.detailTextLabel?.text = SortedVideoStructArray[indexPath.row].creator
            let data =  try! Data(contentsOf: URL(string: SortedVideoStructArray[indexPath.row].thumbnailUrl!) ?? noUrl!)
            cell.imageView?.image = UIImage(data: data)
        }
        
        return cell
    }
    
    
}

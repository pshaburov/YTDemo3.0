//
//  TableViewInteractor.swift
//  YTDemo3.0
//
//  Created by Peter Shaburov on 3/7/19.
//  Copyright © 2019 Peter Shaburov. All rights reserved.
//

import FirebaseDatabase
import Alamofire

class TableViewInteractor: PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
    func fetchVideoStruct() {
        let videoIdDetailLinks = getVideoDetailsLink()
        downloadFromYoutubeApi(list: videoIdDetailLinks)
        print("INTERACTOR SUCESS")
    }

    func fetchVideoIds() {
        downloadFromYoutubeApi(list: playlistLinks)
    
    }
    
    func fetchPlaylistIds() {
        let playlistID = getPlaylistLink(list: channelList)
        downloadFromYoutubeApi(list: playlistID)
    }
    
    func fetchChannelList() {
        self.observeFirebase { [unowned self] (runData) in
            if let runData = runData {
                self.presenter?.recieveChannelList(list: runData)
            }
        }
    }
    
    func observeFirebase(completion: @escaping ([String]?) -> ()) {
        let ref = Database.database().reference().child("Youtube")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let runData = snapshot.value as? [String] else {
                    print("Error! - Incomplete Data")
                    completion(nil)
                    return
            }
            completion(runData)
        })
    }

    
    
    func downloadFromYoutubeApi(list: [String]) {
        var JSONPlaylistInformation: [ListOfPlaylistID] = []
        var listOfTubers: ListOfPlaylistID? = nil
        for i in 0...list.count - 1 {
            Alamofire.request(list[i]).responseJSON { response in
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")                         // response serialization result
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    if let json = try? ListOfPlaylistID(data: data) {
                        listOfTubers = json
                    }
                }
                JSONPlaylistInformation.append(listOfTubers!)
                if JSONPlaylistInformation.count == list.count {
                    print("DOWNLOAD SUCESS")
                    self.presenter?.recieveListOfPlaylistIds(list: JSONPlaylistInformation)
                }
            }
        }
    }
}

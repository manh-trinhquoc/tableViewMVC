//
//  CommonClass.swift
//  tableViewMVC
//
//  Created by trinhquocmanh-mac 10.12 on 12/5/18.
//  Copyright © 2018 trinhquocmanh-mac 10.12. All rights reserved.
//

import UIKit

protocol DRHTableViewDataModelDelegate: class {
    func didReceiveDataUpdate(data: [DRHTableViewDataModelItem])
    func didFailDataUpdateWithError(error: Error)
}

class DRHTableViewDataModel {
    
    weak var delegate: DRHTableViewDataModelDelegate?
    
    func requestData(){
        //code to request data from API or local JSON file will go here
        //this two vars were returned from wherever:
        var response: [AnyObject]?
        var error: Error?
        
        if let error = error {
            //handle error
            delegate?.didFailDataUpdateWithError(error: error)
        } else if let response = response {
            //parse response to [DRHTableViewModelItem]
            setDataWithResponse(response: response)
        }
    }
    
    private func setDataWithResponse (response: [AnyObject]) {
        var data = [DRHTableViewDataModelItem]()
        for item in response {
            //create DRHTableViewDataModelItem out of AnyObject
            if let drhTableViewDataModelItem = DRHTableViewDataModelItem(data: item as? [String: String]) {
                data.append(drhTableViewDataModelItem)
            }
        }
        delegate?.didReceiveDataUpdate(data: data)
    }
}

class DRHTableViewDataModelItem {
    var avatarImageURL: String?
    var authorName: String?
    var date: String?
    var title: String?
    var previewText: String?
    
    init?(data:[String: String]?) {
        if let data = data, let avatar = data["avatarImageURL"], let name = data["authorName"], let date = data["date"], let title = data["title"], let previewText = data["prevewText"]{
            self.avatarImageURL = avatar
            self.authorName = name
            self.date = date
            self.title = title
            self.previewText = previewText
        } else {
            return nil
        }
    }
}

//
//  DRHTableViewController.swift
//  tableViewMVC
//
//  Created by trinhquocmanh-mac 10.12 on 12/5/18.
//  Copyright © 2018 trinhquocmanh-mac 10.12. All rights reserved.
//

import UIKit

class DRHTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var dataArray = [DRHTableViewDataModelItem](){
        didSet {
            tableView?.reloadData()
        }
    }
    
    private let dataSource = DRHTableViewDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView?.register(DRHTableViewCell.nib, forCellReuseIdentifier: DRHTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        dataSource.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        dataSource.requestData()
    }
   
}

extension DRHTableViewController: UITableViewDelegate {
    
}

extension DRHTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DRHTableViewCell.identifier, for: indexPath) as? DRHTableViewCell {
            cell.configureWithItem(item: dataArray[indexPath.item])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
}

extension DRHTableViewController: DRHTableViewDataModelDelegate {
    func didFailDataUpdateWithError(error: Error) {
        //handle error case appropriately (display alert, log an error, etc)
    }
    
    func didReceiveDataUpdate(data: [DRHTableViewDataModelItem]) {
        dataArray = data
    }
}

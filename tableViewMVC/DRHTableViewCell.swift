//
//  DRHTableViewCell.swift
//  tableViewMVC
//
//  Created by trinhquocmanh-mac 10.12 on 12/5/18.
//  Copyright © 2018 trinhquocmanh-mac 10.12. All rights reserved.
//

import UIKit

class DRHTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.red
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWithItem(item: DRHTableViewDataModelItem) {
        //setImageWithURL(url:item.avatarImageURL)
        authorNameLabel?.text = item.authorName
        postDateLabel?.text = item.date
        titleLabel?.text = item.title
        previewLabel?.text = item.previewText
    }
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}



//
//  PostHeaderCell.swift
//  Makestagram
//
//  Created by Shannon Ding on 6/28/17.
//  Copyright © 2017 Shannon Ding. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func optionsButtonTapped(_ sender: UIButton) {
        print("options button tapped")
    }

    
}

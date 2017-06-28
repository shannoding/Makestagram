//
//  PostActionCell.swift
//  Makestagram
//
//  Created by Shannon Ding on 6/28/17.
//  Copyright © 2017 Shannon Ding. All rights reserved.
//

import UIKit

class PostActionCell: UITableViewCell {
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        print("like button tapped")
    }
    
}

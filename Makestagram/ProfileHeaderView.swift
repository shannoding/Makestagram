//
//  ProfileHeaderView.swift
//  Makestagram
//
//  Created by Shannon Ding on 7/10/17.
//  Copyright © 2017 Shannon Ding. All rights reserved.
//

import UIKit

class ProfileHeaderView: UICollectionReusableView {
    @IBOutlet weak var postCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        settingsButton.layer.cornerRadius = 6
        settingsButton.layer.borderColor = UIColor.lightGray.cgColor
        settingsButton.layer.borderWidth = 1
    }
    
    @IBAction func settingsButtonTapped(_ sender: UIButton) {
        print("settings button tapoed")
    }
}

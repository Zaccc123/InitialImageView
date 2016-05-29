//
//  ExampleTableViewCell.swift
//  InitialImageViewExample
//
//  Created by Zac on 29/5/16.
//  Copyright © 2016 Zac. All rights reserved.
//

import UIKit

class ExampleTableViewCell: UITableViewCell {

    @IBOutlet weak var initialImageView: InitialImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(user: User) {
        initialImageView.setImageWithName(user.name, randomColor: true)
        usernameLabel.text = "@\(user.username)"
        fullnameLabel.text = user.name
    }
}

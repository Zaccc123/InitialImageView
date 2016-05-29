//
//  ViewController.swift
//  InitialImageViewExample
//
//  Created by Zac on 21/5/16.
//  Copyright © 2016 Zac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var initialImageView: InitialImageView!
    @IBOutlet weak var initialWithFontImageView: InitialImageView!
    @IBOutlet weak var nameImageView: InitialImageView!
    @IBOutlet weak var firstNameLastNameImageView: InitialImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        initialImageView.setImageWithInitial("ZK", backgroundColor: UIColor.blueColor())
        
        if let font = UIFont(name: "Courier", size: 200) {
            initialWithFontImageView.font = font
        }
        initialWithFontImageView.setImageWithInitial("YW", backgroundColor: UIColor.greenColor())
        
        nameImageView.setImageWithName("Johnny Tan", backgroundColor: UIColor.darkGrayColor())

        firstNameLastNameImageView.setImageWithFirstName("Steve", lastName: "Bob", backgroundColor: UIColor.brownColor())

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


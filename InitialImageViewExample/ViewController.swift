//
//  ViewController.swift
//  InitialImageViewExample
//
//  Created by Zac on 21/5/16.
//  Copyright © 2016 Zac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: InitialImageView!
    @IBOutlet weak var secondImageView: InitialImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.setImageWithInitial("ZK", backgroundColor: UIColor.brownColor(), circle: true)
        
        let font = UIFont(name: "Courier", size: 200)
        secondImageView.font = font!
        secondImageView.setImageWithInitial("YW", backgroundColor: UIColor.brownColor(), circle: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


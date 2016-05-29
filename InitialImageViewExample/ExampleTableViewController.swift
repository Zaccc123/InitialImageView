//
//  ExampleTableViewController.swift
//  InitialImageViewExample
//
//  Created by Zac on 29/5/16.
//  Copyright © 2016 Zac. All rights reserved.
//

import UIKit

class ExampleTableViewController: UITableViewController {

    let userArray = [User(name:"Zac Kwan", username: "Zaccc"),
                            User(name:"James Tan", username: "James"),
                            User(name:"Steve King", username: "King252"),
                            User(name:"John", username: "Jonnnnnny"),
                            User(name:"Logan Wolve", username: "Wolve"),
                            User(name:"Spade Chia", username: "Kspate"),
                            User(name:"Christian Jerry", username: "Jerryison"),
                            User(name:"Joshson Berry", username: "John_292"),
                            User(name:"Mark Angel", username: "Angel"),
                            User(name:"Alex", username: "Alexer"),
                            User(name:"Ivan Huang", username: "Ivan")
                            ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ExampleTableViewCell", forIndexPath: indexPath) as! ExampleTableViewCell
        cell.configure(userArray[indexPath.row])

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView .deselectRowAtIndexPath(indexPath, animated: true)
    }

}

struct User {

    let name: String
    let username: String

    init(name: String, username: String) {
        self.name = name
        self.username = username
    }
}
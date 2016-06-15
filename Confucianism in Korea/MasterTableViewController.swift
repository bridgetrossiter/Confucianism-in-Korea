//
//  MasterTableViewController.swift
//  Confucianism in Korea
//
//  Created by Bridget Rossiter on 30/05/2016.
//  Copyright © 2016 Bridget Rossiter. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    let titles = ["Home", "Confucianism", "Movie Quizzes", "Information"]
    //home menu titles

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count;
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegueWithIdentifier(titles[indexPath.row], sender: self)
    }
}

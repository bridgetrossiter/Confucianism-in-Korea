//
//  MovieQuizzesTableViewController.swift
//  Confucianism in Korea
//
//  Created by Bridget Rossiter on 30/05/2016.
//  Copyright © 2016 Bridget Rossiter. All rights reserved.
//

import UIKit

class MovieQuizzesTableViewController: UITableViewController {
    let movies = ["Ode to My Father", "Welcome to Dongmakgol"]
    var chosenCell = 0;
    
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
        return movies.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = movies[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        chosenCell = indexPath.row
        //(segue isn't connected directly in storyboard, have to trigger segue manually.
        self.performSegueWithIdentifier("toMovie", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toMovie") { //checking for right segue
            let destinationVC = segue.destinationViewController as! MovieViewController
            destinationVC.mediaName = movies[chosenCell]            

        }
    }
 

}

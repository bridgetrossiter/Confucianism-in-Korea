//
//  QuestionTableViewController.swift
//  Confucianism in Korea
//
//  Created by Bridget Rossiter on 1/06/2016.
//  Copyright © 2016 Bridget Rossiter. All rights reserved.
//

import UIKit

class QuestionTableViewController: UITableViewController {
    weak var movieViewController: MovieViewController?
    var type: String!
    var questionNumber: Int!
    var media: Media!
    var selectedAnswers = [Int: Bool]()
    
    @IBOutlet var questionTextview: UITextView!
    
    
    @IBAction func done(sender: AnyObject) {
        let tmpController :UIViewController! = self.presentingViewController;
        if (isCorrectAnswerSelected()) {
            let alert = UIAlertController(title: "Question", message: "You have the correct answer!", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
                switch action.style{
                case .Default:
                    self.dismissViewControllerAnimated(false, completion: {()->Void in
                        print("done");
                        self.movieViewController?.nextQuestion()
                        tmpController.dismissViewControllerAnimated(false, completion: nil);
                    });

                    
                case .Cancel:
                    print("cancel")
                    
                case .Destructive:
                    print("destructive")
                }
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
                    } else {
            let alert = UIAlertController(title: "Question", message: "Incorrect Answer or Not Enough Selected", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func cancel(sender: AnyObject) {
        let tmpController :UIViewController! = self.presentingViewController;
        
        self.dismissViewControllerAnimated(false, completion: {()->Void in
            print("done");
            tmpController.dismissViewControllerAnimated(false, completion: nil);
        });
    }

    override func viewDidLoad() {
        media = Media(mediaName: type!)
        for var i = 0; i < media.answers?[questionNumber].count; i += 1 {
            selectedAnswers[i] = false
        }
        
        questionTextview.text = "\n\n" + media.questions![questionNumber]

        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func isCorrectAnswerSelected() -> Bool {
        var numberCorrect = 0;
        for (value, isSelected) in selectedAnswers {
            let currentAnswer = media.answers![questionNumber][value]

            if (isSelected) {
                var isInArray = false;
                for answer in (media.correctAns?[questionNumber])! {
                    if (currentAnswer == answer) {
                        isInArray = true;
                        numberCorrect += 1
                    }
                }
                if (!isInArray) {
                    return false;
                }
            } else {
                if (media.correctAns![questionNumber].contains(currentAnswer)) {
                    //has not been selected...but in correct answers
                    return false;
                }
            }
        }
        
        if (numberCorrect != media.correctAns?[questionNumber].count) {
            return false
        }
        return true
        
    }
    
    
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedAnswers[indexPath.row] = true;
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        selectedAnswers[indexPath.row] = false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return media.answers![questionNumber].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("questionCell", forIndexPath: indexPath)
            let currentRow = media.answers
            cell.textLabel?.text = currentRow![questionNumber][indexPath.row]

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

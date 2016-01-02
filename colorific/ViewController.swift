//
//  ViewController.swift
//  colorific
//
//  Created by Aparna Krishnan on 12/29/15.
//  Copyright © 2015 Aparna. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let colors :[UIColor] = [UIColor.blackColor(), UIColor.purpleColor(),UIColor.blueColor(), UIColor.greenColor(), UIColor(colorLiteralRed: 255/255, green: 102/255, blue: 102/255, alpha: 1.0) , UIColor.yellowColor(), UIColor.orangeColor(),UIColor.redColor()]
 

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.colors.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = colors[indexPath.row] 
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        performSegueWithIdentifier("toScreen", sender: indexPath)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "toScreen"{
       let screen = segue.destinationViewController as! Screen
        screen.view.backgroundColor = self.colors[sender.row]
        }
       
        
    }

}


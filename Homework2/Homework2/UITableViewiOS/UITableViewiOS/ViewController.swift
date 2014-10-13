//
//  ViewController.swift
//  UITableViewDemo
//
//  Created by Gaurav on 10/2/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items = ["Apple", "Banana", "Mango"]
    @IBOutlet weak var section1: UITableView!
    @IBOutlet weak var section2: UITableView!
    @IBOutlet weak var section3: UITableView!
    @IBOutlet weak var section4: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSections()
    }

    func setupSections()
    {
        self.section1.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.section1.dataSource = self
        self.section1.delegate = self
        self.section1.editing = true
        self.section2.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.section2.dataSource = self
        self.section2.delegate = self
        self.section3.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.section3.dataSource = self
        self.section3.delegate = self
        self.section4.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.section4.dataSource = self
        self.section4.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell:UITableViewCell!
        
        if (tableView == self.section1) {
            cell = self.section1
                .dequeueReusableCellWithIdentifier("cell") as UITableViewCell
            cell.textLabel?.text = items[indexPath.row]
            cell.showsReorderControl = true
        }

        if (tableView == self.section2) {
            cell = self.section2
                .dequeueReusableCellWithIdentifier("cell") as UITableViewCell
            cell.textLabel?.text = items[indexPath.row]
            self.section2.rowHeight = 320.0
        }
        
        if (tableView == self.section3) {
            cell = self.section3
                .dequeueReusableCellWithIdentifier("cell") as UITableViewCell
            cell.textLabel?.text = items[indexPath.row]
        }

        // In Section 4, cells should not be selectable/highlighted when tapped.
        if (tableView == self.section4) {
            cell = self.section4
                .dequeueReusableCellWithIdentifier("cell") as UITableViewCell
            cell.textLabel?.text = items[indexPath.row]
            cell.userInteractionEnabled = false
        }
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var tableViewHeader: String!
        switch tableView {
            case self.section1: tableViewHeader = "Section 1"
            case self.section2: tableViewHeader = "Section 2"
            case self.section3: tableViewHeader = "Section 3"
            case self.section4: tableViewHeader = "Section 4"
            default: tableViewHeader = ""
        }
        return tableViewHeader
    }
    
    func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool
    {
        return true
    }
    func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!)
    {
        if (tableView == self.section1) {
            let source = items[sourceIndexPath.row]
            let destination = items[destinationIndexPath.row]
            items[sourceIndexPath.row] = destination
            items[destinationIndexPath.row] = source
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .None
    }

    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        if (tableView == self.section3) {
            NSLog("You selected cell #\(indexPath.row) : \(items[indexPath.row])")
        }
    }

    func tableView(tableView: UITableView!, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if (tableView == self.section3) {
            NSLog("You deselected cell #\(indexPath.row) : \(items[indexPath.row])")
        }
    }
}


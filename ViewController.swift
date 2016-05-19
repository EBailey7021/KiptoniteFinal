//
//  ViewController.swift
//  Kiptonite
//
//  Created by Ian W. Howe on 5/12/16.
//  Copyright © 2016 Ian W. Howe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate, UITabBarDelegate {

    var tricks = [[Trick()]]
    var filteredTricks = [Trick()]
    var activeTab = 0
    var activeFilter = 0
    
    @IBOutlet weak var trickLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var trickDescription: UITextView!
    @IBOutlet weak var categoryTabBar: UITabBar!
    @IBOutlet weak var eventTabBar: UITabBar!
    @IBOutlet weak var trickTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetAllTricks()
        filteredTricks = tricks[activeTab]
        eventTabBar.selectedItem = eventTabBar.items![0]
        categoryTabBar.selectedItem = categoryTabBar.items![activeTab]
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //may need to reset depending on state of tab bar controller(s)
        return filteredTricks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCellItem", forIndexPath: indexPath)
        let label = cell.textLabel
        if filteredTricks.count != 0 {
            label?.text = filteredTricks[indexPath.row].name
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Setup code for trickView
        let selectedTrick = filteredTricks[indexPath.row]
        trickLabel.text = selectedTrick.name
        webView.loadRequest(NSURLRequest(URL: selectedTrick.url))
        trickDescription.text = selectedTrick.description
    }

    func updateFilteredTricks() {
        filteredTricks.removeAll()
        for trick in tricks[activeTab] {
            if trick.event == activeFilter {
                filteredTricks.append(trick)
            }
        }
    }

    func resetAllTricks() {
        tricks.removeAll()
        for count in 0...2 {
            tricks.append([Trick()])
            tricks[count].removeFirst()
        }
        tricks[0].append(Trick(Name: "Test Cell", Difficulty: "A", Description: "Just a test cell", Event: 1, Gender: 0, Status: 0, URL: NSURL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!))
        tricks[0].append(Trick(Name: "Test Cell 2", Difficulty: "B", Description: "Just a test cell", Event: 2, Gender: 1, Status: 0, URL: NSURL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!))
        tricks[0].append(Trick(Name: "Test Cell 3", Difficulty: "D", Description: "Just a test cell", Event: 3, Gender: 2, Status: 0, URL: NSURL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!))
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if tabBar.tag == 0 {
        }
        
        switch tabBar.tag {
        case 0:
            activeTab = item.tag
            updateFilteredTricks()
            trickTableView.reloadData()
        case 1:
            activeFilter = item.tag
            updateFilteredTricks()
            trickTableView.reloadData()
        default: break
        }
    }
    
    
    
    
}


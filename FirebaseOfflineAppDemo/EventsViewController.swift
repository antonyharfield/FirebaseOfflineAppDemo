//
//  EventsViewController.swift
//  FirebaseStorageCache
//
//  Created by Ant on 20/02/2017.
//  Copyright © 2017 Apptitude. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var events: [Event]? {
        didSet {
            loadingView.isHidden = events != nil
            tableView.isHidden = events == nil
        }
    }
    
    @IBOutlet var loadingView: UIView!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = nil
        Database.events { (events) in
            print("Found \(events.count) events.")
            self.events = events
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageViewController = segue.destination as? EventPageViewController, let events = events, let indexPath = tableView.indexPathForSelectedRow {
            pageViewController.event = events[indexPath.row]
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let events = events {
            return events.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventcell", for: indexPath) as! EventTableViewCell
        cell.set(event: events![indexPath.row])
        return cell
    }

}

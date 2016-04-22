//
//  RankingsViewController.swift
//  FossFrost
//
//  Created by Sergii Nezdolii on 22/04/16.
//  Copyright © 2016 FrostDigital. All rights reserved.
//

import UIKit
import Foundation

class RankingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var rankingsTableView: UITableView!
    let dataSource: RankingDataSource = RankingDataSource.init()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(RankingsViewController.handleRefresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource.refreshPlayers()
        self.rankingsTableView.estimatedRowHeight = 40.0
        self.rankingsTableView.rowHeight = UITableViewAutomaticDimension
        self.rankingsTableView.addSubview(self.refreshControl)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.players.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let rankingCell: RankingTableViewCell = tableView.dequeueReusableCellWithIdentifier(String(RankingTableViewCell)) as! RankingTableViewCell
        rankingCell.playerName.text = self.dataSource.players[indexPath.row].playerName
        rankingCell.playerPoints.text = "\(self.dataSource.players[indexPath.row].playerPoints)"
        
        return rankingCell
    }
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        // Do some reloading of data and update the table view's data source
        // Fetch more objects from a web service, for example...
        
        // Simply adding an object to the data source for this example
        refreshControl.beginRefreshing()
        sleep(1)
        refreshControl.endRefreshing()
        dataSource.refreshPlayers()
        self.rankingsTableView.reloadData()
    }
}

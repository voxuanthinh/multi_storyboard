//
//  PlayersViewController.swift
//  multi_storyboard
//
//  Created by thinhvoxuan on 2/21/16.
//  Copyright © 2016 Thinh VoXuan. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
    
    var players:[Player] = playersData

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
            as! PlayerCell
        let player = players[indexPath.row] as Player
        cell.player = player
        return cell
    }
    
    
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
        if let playerDetailsViewController = segue.sourceViewController as? PlayerDetailsViewController {
            if let player = playerDetailsViewController.player {
                players.append(player)
                let indexPath = NSIndexPath(forRow: players.count-1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
}

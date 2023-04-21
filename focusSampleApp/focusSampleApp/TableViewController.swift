//
//  TableViewController.swift
//  focusSampleApp
//
//  Created by Gustas on 2023-03-14.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    let collections: [Collection] = [Collection(title: "ffirst"), Collection(title: "Amazing"), Collection(title: "Fresh n tassty"), Collection(title: "Forreal"), Collection(title: "WooHoo"), Collection(title: "Lorem"), Collection(title: "Europe")]
    var splitDelegate: SplitControllerDelegate?
    var currentlySelectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.selectionFollowsFocus = false
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = collections[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if currentlySelectedIndexPath == indexPath {
            splitDelegate?.selectCollection(sameCollection: true)
        } else {
            splitDelegate?.selectCollection(sameCollection: false)
            currentlySelectedIndexPath = indexPath
        }
    }
}

class Collection {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}


public protocol SplitControllerDelegate: AnyObject {
    func selectCollection(sameCollection: Bool)
    func selectItem(color: UIColor)
}

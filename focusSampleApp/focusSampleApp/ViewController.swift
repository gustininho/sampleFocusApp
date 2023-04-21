//
//  ViewController.swift
//  focusSampleApp
//
//  Created by Gustas on 2023-03-14.
//

import UIKit

class ViewController: UISplitViewController, SplitControllerDelegate {
    var collectionViewController: CollectionViewController?
    var tableViewController = TableViewController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewController.splitDelegate = self
        setViewController(tableViewController, for: .primary)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        
        collectionViewController = CollectionViewController(collectionViewLayout: layout)
        collectionViewController?.splitDelegate = self
        
        setViewController(collectionViewController, for: .secondary)
    }

    func selectCollection(sameCollection: Bool) {
        collectionViewController?.reloadItems(sameCollection: sameCollection)
    }
    
    func selectItem(color: UIColor) {
        let viewController = UIViewController()
        viewController.view.backgroundColor = color
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}


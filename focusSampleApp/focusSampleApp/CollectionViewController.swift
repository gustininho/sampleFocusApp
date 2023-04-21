//
//  CollectionViewController.swift
//  focusSampleApp
//
//  Created by Gustas on 2023-03-14.
//

import Foundation
import UIKit

class Item {
    let color = UIColor(red: CGFloat(Float.random(in: 0...1)), green: CGFloat(Float.random(in: 0...1)), blue: CGFloat(Float.random(in: 0...1)), alpha: 0.3)
}

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    public var items: [Item] = [Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item()]
    var splitDelegate: SplitControllerDelegate?
    var resetPriorities = false
    var firstVisibleIndexPath: IndexPath?
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsFocus = true
        collectionView.focusEffect = UIFocusHaloEffect()
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width / 3 - 1.34 , height: view.bounds.width / 3 - 1.34)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        cell.contentView.backgroundColor = items[indexPath.row].color
        cell.focusEffect = UIFocusHaloEffect()
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        splitDelegate?.selectItem(color: items[indexPath.row].color)
    }
    
    func reloadItems(sameCollection: Bool) {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 2
//        layout.minimumInteritemSpacing = 2
//
//        let collectionView = UICollectionView(frame: self.collectionView.frame, collectionViewLayout: layout)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.allowsFocus = true
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//
//        self.collectionView = collectionView
//
        
        resetPriorities = true
        
        items = [Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item(), Item()]
        collectionView.reloadData()
        
            //collectionView.reloadSections(IndexSet(integer: 0))
    }
    
//    override func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
//        print()
//        return collectionView.indexPathsForVisibleItems.sorted(by: { $0.row < $1.row }).first
//    }
    
//    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if resetPriorities {
//            cell.focusGroupPriority = .ignored
//        } else {
//            cell.focusGroupPriority = .previouslyFocused
//        }
//    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if resetPriorities {
            if indexPath == collectionView.indexPathsForVisibleItems.sorted(by: { $0.row < $1.row }).first {
                cell.focusGroupPriority = .currentlyFocused
            }
        }
    }
}



class SampleCollectionViewCell: UICollectionViewCell {
    override func prepareForReuse() {
    }
}

extension UIFocusGroupPriority {
    
    @available(iOS 15.0, *)
    public static let biggerThanNone: UIFocusGroupPriority = UIFocusGroupPriority(1999)
}

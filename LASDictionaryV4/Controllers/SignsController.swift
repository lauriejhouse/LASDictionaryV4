//
//  SignsController.swift
//  LASDictionaryV4
//
//  Created by Jackie on 6/12/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit


//Commenting out the Collection View COntroller to try and make the UIView, or old table view work.
//class SignsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

//Original.
//class SignsController: UITableViewController {

class SignsController: UIViewController {
    
    
    var signs: Dictionary? {
        didSet {
            navigationItem.title = signs?.name
            self.view.backgroundColor = UIColor.white

        }
    }

    
    //this may not go here. It may go in the 'appDelegate' but I can't put it there because colleciton view doesn't apply to this layout.
//    let videoCollectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
//    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //NOT SURE IF THIS GOES HERE. or if i need to construct a whole new somethihgn to put this in.
//        let videoLauncher = VideoLauncher()
//        videoLauncher.showVideoPlayer()
    }
    
    
    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath)
//
//        return cell
//    }
//
//    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 200)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    
    
    
    
}




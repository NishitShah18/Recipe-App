//
//  HomeScreen.swift
//  A2_nishit_shah
//
//  Created by Nishit Shah on 2024-02-18.
//

import UIKit

class HomeScreen: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionCell
        
        cell.MyFoodImage.image=UIImage(named: homeImages[indexPath.row])
        cell.MyFoodImage.layer.cornerRadius = 50.0
        return cell
    }
    
    var temp = 0
    @IBOutlet weak var myPage: UIPageControl!
    
    var homeImages:[String] = ["image0","image1","image2","image3","image4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPage.currentPage=1
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        myPage.currentPage=indexPath.row
        if temp == 0{
            myPage.currentPage=0
            temp = temp + 1
        }
    }
}

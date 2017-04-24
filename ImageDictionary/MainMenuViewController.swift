//
//  ViewController.swift
//  ImageDictionary
//
//  Created by Cesar Rdz on 1/5/17.
//  Copyright © 2017 Cesar Rdz. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {    

    @IBOutlet weak var mainCollectionView: UICollectionView!
    var images = [UIImage(named: "body"), UIImage(named: "entertainment"), UIImage(named: "environment"), UIImage(named: "food"), UIImage(named: "health"), UIImage(named: "house"), UIImage(named: "people"), UIImage(named: "services"), UIImage(named: "shopping"), UIImage(named: "sports"),UIImage(named: "study"), UIImage(named: "transport"), UIImage(named: "work")]
     var names = ["Body","Entertainment","Environment","Food","Health","House","People","Services","Shopping","Sports","Study", "Transport","Work"]
    let preferences = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        //mainCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        mainCollectionView.register(ImageViewCell.self, forCellWithReuseIdentifier: "imageCell")
        mainCollectionView.backgroundColor = UIColor.white
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        view.addSubview(mainCollectionView)
        
    }
    
}

extension MainMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 5 {
            preferences.set(indexPath.row, forKey: "selectedCategorie")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "categoriesView") as! CategoriesViewController
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageViewCell
        cell.awakeFromNib()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let imageCell = cell as! ImageViewCell
        //imageCell.imageView.image = UIImage.init()
        imageCell.imageView.image = images[indexPath.row]
        imageCell.imageLabel.text = names[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width*0.3, height: view.frame.height*0.2)
    }
}


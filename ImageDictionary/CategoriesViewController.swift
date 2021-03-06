//
//  CategoriesViewController.swift
//  ImageDictionary
//
//  Created by Cesar Rdz on 1/6/17.
//  Copyright © 2017 Cesar Rdz. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    var images = [UIImage(named: "attic"), UIImage(named: "backyard"), UIImage(named: "balcony"), UIImage(named: "bathroom"), UIImage(named: "bedroom"), UIImage(named: "cellar"), UIImage(named: "dining_room"), UIImage(named: "garage"), UIImage(named: "garden"),UIImage(named: "home_office"), UIImage(named: "house decoration"), UIImage(named: "house installations"), UIImage(named: "kids_room"), UIImage(named: "kitchen"),UIImage(named: "laundry_room"), UIImage(named: "living_room"), UIImage(named: "sitting_room")]
    var names = ["Attic", "Backyard", "Balcony", "Bathroom", "Bedroom", "Cellar", "Dining room", "Garage", "Garden", "Home office", "House decoration", "House installations", "Kids room", "Kitchen", "Laundry room", "Living room", "Sitting room"]
    let preferences = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        //mainCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        categoriesCollectionView.register(ImageViewCell.self, forCellWithReuseIdentifier: "imageCell")
        categoriesCollectionView.backgroundColor = UIColor.white
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        view.addSubview(categoriesCollectionView)
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //preferences.set(indexPath.row, forKey: "selectedCategorie")
        if indexPath.row == 13 {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "subCategoriesView") as! Level3ViewController
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

//
//  Level3ViewController.swift
//  ImageDictionary
//
//  Created by Cesar Rdz on 1/31/17.
//  Copyright © 2017 Cesar Rdz. All rights reserved.
//

import UIKit

class Level3ViewController: UIViewController {
    
    @IBOutlet weak var subCategoriesCollectionView: UICollectionView!
    var images = [UIImage(named: "baking_tray"), UIImage(named: "blender"), UIImage(named: "bread_knife"), UIImage(named: "can_opener"), UIImage(named: "cleaver"), UIImage(named: "coffee_machine"), UIImage(named: "colander"), UIImage(named: "cooking_pot"), UIImage(named: "extractor"),UIImage(named: "food_mixer"), UIImage(named: "food_processor"), UIImage(named: "fridge_shelf"), UIImage(named: "fridge"), UIImage(named: "frying_pan"), UIImage(named: "garlic press"), UIImage(named: "greater"), UIImage(named: "kettle"), UIImage(named: "knife"), UIImage(named: "ladle"), UIImage(named: "lid"), UIImage(named: "masher"), UIImage(named: "microwave"), UIImage(named: "muffin_tray"), UIImage(named: "orange_squeezer"), UIImage(named: "oven"), UIImage(named: "piping_bag"), UIImage(named: "rolling_pin"), UIImage(named: "shelves"), UIImage(named: "sieve"), UIImage(named: "sink"), UIImage(named: "spatula"), UIImage(named: "spice_rack"), UIImage(named: "stoove"), UIImage(named: "tap"), UIImage(named: "toaster"), UIImage(named: "whisk"), UIImage(named: "worktop")]
    var names = ["baking_tray", "blender", "bread_knife", "can_opener", "cleaver", "coffee_machine", "colander", "cooking_pot", "extractor", "food_mixer", "food_processor", "fridge_shelf", "fridge", "frying_pan", "garlic press", "greater", "kettle", "knife", "ladle", "lid", "masher", "microwave", "muffin_tray", "orange_squeezer", "oven", "piping_bag", "rolling_pin", "shelves", "sieve", "sink", "spatula", "spice_rack", "stoove", "tap", "toaster", "whisk", "worktop"]
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
        subCategoriesCollectionView.register(ImageViewCell.self, forCellWithReuseIdentifier: "imageCell")
        subCategoriesCollectionView.backgroundColor = UIColor.white
        subCategoriesCollectionView.delegate = self
        subCategoriesCollectionView.dataSource = self
        view.addSubview(subCategoriesCollectionView)
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension Level3ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        preferences.set(indexPath.row, forKey: "selectedItem")
         let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let newViewController = storyBoard.instantiateViewController(withIdentifier: "level4View") as! Level4ViewController
         self.present(newViewController, animated: true, completion: nil)
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

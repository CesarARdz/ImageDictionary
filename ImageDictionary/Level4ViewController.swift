//
//  Level4ViewController.swift
//  ImageDictionary
//
//  Created by Cesar Rdz on 4/16/17.
//  Copyright © 2017 Cesar Rdz. All rights reserved.
//

import UIKit

class Level4ViewController: UIViewController {
    var translateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delayWithSeconds(1.0) {
            let translateBtn: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            translateBtn.center = CGPoint(x: self.view.frame.size.width*0.15, y: self.view.frame.size.height/2-150)
            translateBtn.backgroundColor = UIColor.green
            translateBtn.setTitle("Translate", for: .normal)
            translateBtn.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
            translateBtn.tag = 1
            self.view.addSubview(translateBtn)
            
            self.translateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width*0.8, height: 100))
            self.translateLabel.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2-150)
            self.translateLabel.text = "Hornear el pastel 50 minutos en la lata redonda."
            self.translateLabel.textColor = UIColor .black
            self.translateLabel.textAlignment = NSTextAlignment .center
            self.translateLabel.isHidden = true
            self.view.addSubview(self.translateLabel)
            
            let image: UIImage = UIImage(named: "oven")!
            let imageView = UIImageView(image: image)
            self.view.addSubview(imageView)
            imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 150)
            imageView.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
            self.view.addSubview(imageView)
            
            let sentenceLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width*0.8, height: 100))
            sentenceLabel.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2+100)
            sentenceLabel.text = "Bake the cake 50 minutes in the round tin."
            sentenceLabel.textColor = UIColor .black
            sentenceLabel.textAlignment = NSTextAlignment .center
            self.view.addSubview(sentenceLabel)
            
            let audioBtn: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            audioBtn.center = CGPoint(x: self.view.frame.size.width*0.15, y: self.view.frame.size.height/2+150)
            audioBtn.backgroundColor = UIColor.green
            audioBtn.setTitle("Audio", for: .normal)
            audioBtn.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
            audioBtn.tag = 2
            self.view.addSubview(audioBtn)
        }
        /*let translateBtn: UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        translateBtn.backgroundColor = UIColor.green
        translateBtn.setTitle("Translate", for: .normal)
        translateBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        translateBtn.tag = 1
        self.view.addSubview(translateBtn)
        
        translateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        translateLabel.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2-150)
        translateLabel.text = "Hornear el pastel 50 minutos en la lata redonda."
        translateLabel.textColor = UIColor .black
        translateLabel.isHidden = true
        self.view.addSubview(translateLabel)
        
        let image: UIImage = UIImage(named: "oven")!
        let imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        self.view.addSubview(imageView)
        
        let sentenceLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        sentenceLabel.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2+150)
        sentenceLabel.text = "Bake the cake 50 minutes in the round tin."
        sentenceLabel.textColor = UIColor .black
        self.view.addSubview(sentenceLabel)
        
        let audioBtn: UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        audioBtn.backgroundColor = UIColor.green
        audioBtn.setTitle("Audio", for: .normal)
        audioBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        audioBtn.tag = 2
        self.view.addSubview(audioBtn)*/
    }

    override func viewDidAppear(_ animated: Bool) {
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            translateLabel.isHidden = false
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}

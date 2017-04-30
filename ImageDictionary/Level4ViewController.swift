//
//  Level4ViewController.swift
//  ImageDictionary
//
//  Created by Cesar Rdz on 4/16/17.
//  Copyright © 2017 Cesar Rdz. All rights reserved.
//

import UIKit
import AVFoundation

class Level4ViewController: UIViewController {
    var translateLabel: UILabel!
    var sentenceLabel: UILabel!
    var utterance: AVSpeechUtterance!
    var translateShowed: Bool!
    var letterCount = 0;
    var resultsLettersArray: NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        translateShowed = false
        
        delayWithSeconds(1.0) {
            let translateBtn: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            translateBtn.center = CGPoint(x: self.view.frame.size.width*0.05, y: self.view.frame.size.height*0.2)
            translateBtn.setBackgroundImage(#imageLiteral(resourceName: "translate"), for: .normal)
            translateBtn.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
            translateBtn.tag = 1
            self.view.addSubview(translateBtn)
            
            self.translateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width*0.8, height: 100))
            self.translateLabel.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2-150)
            self.translateLabel.text = "Corto un panqué con un cuchillo de pan."
            self.translateLabel.textColor = UIColor .black
            self.translateLabel.textAlignment = NSTextAlignment .center
            self.translateLabel.isHidden = true
            self.view.addSubview(self.translateLabel)
            
            let image: UIImage = UIImage(named: "bread_knife")!
            let imageView = UIImageView(image: image)
            self.view.addSubview(imageView)
            imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 150)
            imageView.center = CGPoint(x: self.view.frame.size.width*0.5, y: self.view.frame.size.height*0.35)
            //self.view.addSubview(imageView)
            
            self.sentenceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width*0.8, height: 100))
            self.sentenceLabel.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2+100)
            self.sentenceLabel.text = "I cut a cupcake with a bread knife."
            self.sentenceLabel.textColor = UIColor .black
            self.sentenceLabel.textAlignment = NSTextAlignment .center
            self.view.addSubview(self.sentenceLabel)
            
            let audioBtn: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            audioBtn.center = CGPoint(x: self.view.frame.size.width*0.05, y: self.view.frame.size.height*0.75)
            audioBtn.setBackgroundImage(#imageLiteral(resourceName: "audio"), for: .normal)
            audioBtn.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
            audioBtn.tag = 2
            self.view.addSubview(audioBtn)
            
            self.utterance = AVSpeechUtterance(string: self.sentenceLabel.text!)
            self.utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            
            let wordUsageBtn: UIButton = UIButton(frame: CGRect(x: 50, y: self.view.frame.size.height*0.9, width: self.view.frame.size.width/3-50, height: self.view.frame.size.height*0.1))
            wordUsageBtn.backgroundColor = UIColor.init(red: 82.0, green: 167.0, blue: 36.0, alpha: 1.0)
            wordUsageBtn.titleLabel?.textColor = UIColor.white
            wordUsageBtn.setTitle("Word usage", for: .normal)
            //wordUsageBtn.layer.borderColor = UIColor.init(red: 82.0, green: 167.0, blue: 36.0, alpha: 1.0).cgColor
            wordUsageBtn.addTarget(self, action: #selector(self.changeActivity), for: .touchUpInside)
            wordUsageBtn.tag = 1
            self.view.addSubview(wordUsageBtn)
            
            let writeWordBtn: UIButton = UIButton(frame: CGRect(x: self.view.frame.size.width*0.33, y: self.view.frame.size.height*0.9, width: self.view.frame.size.width/3, height: self.view.frame.size.height*0.1))
            writeWordBtn.titleLabel?.textColor = UIColor.init(red: 82.0, green: 167.0, blue: 36.0, alpha: 1.0)
            writeWordBtn.backgroundColor = UIColor.blue
            writeWordBtn.setTitle("Write a word", for: .normal)
            writeWordBtn.layer.borderColor = UIColor.init(red: 82.0, green: 167.0, blue: 36.0, alpha: 1.0).cgColor
            writeWordBtn.addTarget(self, action: #selector(self.changeActivity), for: .touchUpInside)
            writeWordBtn.tag = 2
            self.view.addSubview(writeWordBtn)
            
            let writeSentenceBtn: UIButton = UIButton(frame: CGRect(x: self.view.frame.size.width*0.66, y: self.view.frame.size.height*0.9, width: self.view.frame.size.width/3, height: self.view.frame.size.height*0.1))
            writeSentenceBtn.titleLabel?.textColor = UIColor.init(red: 82.0, green: 167.0, blue: 36.0, alpha: 1.0)
            writeSentenceBtn.backgroundColor = UIColor.red
            writeSentenceBtn.setTitle("Write a sentence", for: .normal)
            writeSentenceBtn.layer.borderColor = UIColor.init(red: 82.0, green: 167.0, blue: 36.0, alpha: 1.0).cgColor
            writeSentenceBtn.addTarget(self, action: #selector(self.changeActivity), for: .touchUpInside)
            writeSentenceBtn.tag = 3
            self.view.addSubview(writeSentenceBtn)
            
            
            
            //second activity
            self.sentenceLabel.isHidden = true
            
            let phoneticsBtn: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            phoneticsBtn.center = CGPoint(x: self.view.frame.size.width*0.05, y: self.view.frame.size.height*0.75)
            phoneticsBtn.setBackgroundImage(#imageLiteral(resourceName: "phonetics"), for: .normal)
            phoneticsBtn.layer.borderColor = UIColor.init(red: 82.0, green: 167.0, blue: 36.0, alpha: 1.0).cgColor
            phoneticsBtn.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
            phoneticsBtn.tag = 3
            phoneticsBtn.isHidden = true
            self.view.addSubview(phoneticsBtn)
            
            //let currentWord = "BREAD KNIFE".components(separatedBy: " ")
            let currentWordArray = Array("BREAD KNIFE".characters)
            var count = 0;
            let containerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(currentWordArray.count*80), height: 50))
            containerView.center = CGPoint(x: self.view.frame.size.width*0.5, y: self.view.frame.size.height*0.65)
            
            let resultsView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(currentWordArray.count*100), height: self.view.frame.size.height*0.15))
            resultsView.center = CGPoint(x: self.view.frame.size.width*0.5, y: self.view.frame.size.height*0.8)
            
            for letter in currentWordArray {
                let currentLetter: UIButton = UIButton(frame: CGRect(x: 80*count, y: 0, width: 50, height: 50))
                currentLetter.titleLabel?.text = String(letter)
                currentLetter.titleLabel?.textColor = UIColor.black
                currentLetter.layer.borderColor = UIColor.init(red: 240.0, green: 158.0, blue: 44.0, alpha: 0.7).cgColor
                currentLetter.layer.borderWidth = 1.0
                currentLetter.tag = count
                phoneticsBtn.addTarget(self, action: #selector(self.letterAction), for: .touchUpInside)
                containerView.addSubview(currentLetter)
                
                currentLetter.isHidden = true
                resultsView.addSubview(currentLetter)
                self.resultsLettersArray.add(currentLetter)
                
                count += 1
            }
            containerView.isHidden = true
            self.view.addSubview(containerView)
            //containerView.backgroundColor = UIColor.red
            resultsView.isHidden = true
            self.view.addSubview(resultsView)
            //resultsView.backgroundColor = UIColor.yellow
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
            if translateShowed == true {
                translateLabel.isHidden = true
                translateShowed = false
            } else {
                translateLabel.isHidden = false
                translateShowed = true
            }
            
        } else if btnsendtag.tag == 2 {
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(self.utterance)
        }
    }
    
    func changeActivity(sender: UIButton!) {
        let btnsendtag: UIButton = sender

        if btnsendtag.tag == 2 {
            
        } else if btnsendtag.tag == 3 {
            
        }
    }
    
    func letterAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == letterCount {
            UIView.animate(withDuration: 1.5, animations: {
                sender.titleLabel?.textColor = UIColor.blue
            }, completion: { finished in
                sender.isHidden = true
                let selectedLetter: UIButton = self.resultsLettersArray.object(at: self.letterCount) as! UIButton
                selectedLetter.isHidden = false
            })
            letterCount += 1
        } else  {
            UIView.animate(withDuration: 1.5, animations: {
                sender.titleLabel?.textColor = UIColor.red
            }, completion: { finished in
                sender.titleLabel?.textColor = UIColor.init(red: 82.0, green: 167.0, blue: 36.0, alpha: 1.0)
            })
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

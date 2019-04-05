//
//  ViewController.swift
//  Odd
//
//  Created by Fisicon on 11/15/17.
//  Copyright © 2017 NSFTF. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet var Labels: [UIImageView]!
    
    @IBOutlet var BoundsImageView: [UIImageView]!
    @IBOutlet weak var BoundsImageView1: UIImageView!
    @IBOutlet weak var BoundsImageView2: UIImageView!
    @IBOutlet weak var BoundsImageView3: UIImageView!
    @IBOutlet weak var BoundsImageView4: UIImageView!
    @IBOutlet weak var BoundsImageView5: UIImageView!
    @IBOutlet weak var BoundsImageView6: UIImageView!
    @IBOutlet weak var BoundsImageView7: UIImageView!
    @IBOutlet weak var BoundsImageView8: UIImageView!
    @IBOutlet weak var BoundsImageView9: UIImageView!
    
    
    @IBOutlet var Buttons: [UIButton]!
    
    //Array of my images numbers
    var NumbersArray: [String] = ["Num1","Num2","Num3","Num4","Num5","Num6","Num7","Num8","Num9","Num10","Num11","Num12","Num13","Num14","Num15","Num16","Num17","Num18","Num19","Num20","Num21","Num22","Num23","Num24","Num25","Num26","Num27","Num28","Num29","Num30","Num31","Num32","Num33","Num34","Num35","Num36","Num37","Num38","Num39","Num40","Num41","Num42","Num43","Num44","Num45","Num46","Num47","Num48","Num49","Num50","Num51","Num52","Num53","Num54","Num55","Num56","Num57","Num58","Num59","Num60","Num61","Num62","Num63","Num64","Num65","Num66","Num67","Num68","Num69","Num70","Num71","Num72","Num73","Num74","Num75","Num76","Num77","Num78","Num79","Num80","Num81","Num82","Num83","Num84","Num85","Num86","Num87","Num88","Num89","Num90","Num91","Num92","Num93","Num94","Num95","Num96","Num97","Num98","Num99","Num100"]
    
    
    //This func change the number in the random order
    func ChangeImage(_ animated: Bool)
    {
        //ImageVIew function to chage the image of the ImageVoew
        let MainbuttonRandom1:Int = Int(arc4random_uniform(100))
        let MainButtonString1:String =  self.NumbersArray[MainbuttonRandom1]
        
        let MainbuttonRandom2:Int = Int(arc4random_uniform(100))
        let MainButtonString2:String =  self.NumbersArray[MainbuttonRandom2]
        
        let MainbuttonRandom3:Int = Int(arc4random_uniform(100))
        let MainButtonString3:String =  self.NumbersArray[MainbuttonRandom3]
        
        let MainbuttonRandom4:Int = Int(arc4random_uniform(100))
        let MainButtonString4:String =  self.NumbersArray[MainbuttonRandom4]
        
        let MainbuttonRandom5:Int = Int(arc4random_uniform(100))
        let MainButtonString5:String =  self.NumbersArray[MainbuttonRandom5]
        
        let MainbuttonRandom6:Int = Int(arc4random_uniform(100))
        let MainButtonString6:String =  self.NumbersArray[MainbuttonRandom6]
        
        let MainbuttonRandom7:Int = Int(arc4random_uniform(100))
        let MainButtonString7:String =  self.NumbersArray[MainbuttonRandom7]
        
        let MainbuttonRandom8:Int = Int(arc4random_uniform(100))
        let MainButtonString8:String =  self.NumbersArray[MainbuttonRandom8]
        
        let MainbuttonRandom9:Int = Int(arc4random_uniform(100))
        let MainButtonString9:String =  self.NumbersArray[MainbuttonRandom9]
        
        
        self.BoundsImageView1.image = UIImage(named: MainButtonString1)
        self.BoundsImageView2.image = UIImage(named: MainButtonString2)
        self.BoundsImageView3.image = UIImage(named: MainButtonString3)
        self.BoundsImageView4.image = UIImage(named: MainButtonString4)
        self.BoundsImageView5.image = UIImage(named: MainButtonString5)
        self.BoundsImageView6.image = UIImage(named: MainButtonString6)
        self.BoundsImageView7.image = UIImage(named: MainButtonString7)
        self.BoundsImageView8.image = UIImage(named: MainButtonString8)
        self.BoundsImageView9.image = UIImage(named: MainButtonString9)
    }
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Calling the ChangeImage Function
        ChangeImage(true)
        
        let Option = UIViewAnimationOptions.repeat
        
        UIView.animate(withDuration: 2.5, delay: 0.0, options: Option, animations: {
            
            self.BoundsImageView1.frame = CGRect(x: 1200 - 35, y: -320 - 1235 , width: 50, height: 50)
            self.BoundsImageView2.frame = CGRect(x: 120 - 550, y: 220 , width: 50, height: 330)
            
            self.BoundsImageView3.frame = CGRect(x: 420 - 50, y: -220 , width: 50, height: 330)
            self.BoundsImageView4.frame = CGRect(x: -120 - 550, y: -220, width: 0, height: 330)
            
            self.BoundsImageView5.frame = CGRect(x: -320-50, y: -220 , width: 50, height: 50)
            self.BoundsImageView6.frame = CGRect(x: -420-50, y: -220 , width: 50, height: 330)
            
            self.BoundsImageView7.frame = CGRect(x: 1200 - 35, y: -320 - 1235 , width: 50, height: 50)
            self.BoundsImageView8.frame = CGRect(x: 120-550, y: 220 , width: 50, height: 330)
            
            self.BoundsImageView9.frame = CGRect(x: 720 , y: -220 , width: 50, height: 330)
            
        }, completion: nil)
    }
}


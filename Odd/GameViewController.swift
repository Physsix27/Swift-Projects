//
//  GameViewController.swift
//  Odd
//
//  Created by Fisicon on 11/22/17.
//  Copyright © 2017 NSFTF. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
   
    
    // variable
    static var selection: Int = 1;
    var answer: Int = 0
    var number1: Int = 0
    var number2: Int = 0
    var symbol: Character!
    var mainScore: Int = 0
    
    // Main Number
    @IBOutlet weak var mainRandomImage: UIImageView!
    
    // Timer Label
    @IBOutlet weak var timerLabel: UILabel!
    
    // My Number
    @IBOutlet weak var myNumber: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    //
    @IBOutlet weak var pauseButton: UIButton!
    @IBAction func pauseButton(_ sender: Any) {
        
        if (true) {
            pausing()
        }
    }
    
    // An array variable
    private var NumbersArray = [String]()
    
    var timer = Timer() // A timer variable
    var seconds = 60    // 60 seconds
    
    // Views
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var RightView: UIView!
    @IBOutlet weak var LeftView: UIView!
    
    // Left Images Outlets
    @IBOutlet weak var LeftUIImage1: UIImageView!
    @IBOutlet weak var LeftUIImage2: UIImageView!
    @IBOutlet weak var LeftUIImage3: UIImageView!
    @IBOutlet weak var LeftUIImage4: UIImageView!
    
    // filter  string
    func  filter(_ sender: String) -> Int {
        var number: String = ""
        for character in sender {
            if(character >= "0" && character <= "9") {
                // print("character: ", character)
                number.append(character)
            }
        }
        return Int(number)!
    }
    
    // Check if three variables are set up correctly!
    func is3VarSetUp()
    {
        if(number1 != 0 && number2 != 0 && symbol != nil && answer == nil) {
            calculate(number1: number1, symbol: symbol, number2: number2)
            print("answer: ", answer)
        }
        else if (GameViewController.selection == 2 && number1 != 0  && symbol != nil && answer != nil)  {
            calculate(number1: answer, symbol: symbol, number2: number1)
            print("answer: ", answer)
        }
            
        else if (GameViewController.selection == 1 && number1 != 0 && number2 != 0 && symbol != nil && answer != nil ) {
            calculate(number1: answer, symbol: symbol, number2: number2)
            print("answer: ", answer)
        }
        myNumber.text = String(answer)
    }
    
    // Function that calculates the numbers
    func calculate(number1: Int, symbol:Character, number2: Int) {
        switch (symbol) {
        case "+":
            answer = number1 + number2
            break
            
        case "-":
            answer = number1 - number2
            break
            
        case "*":
            answer = number1 * number2
            break
            
        case "/":
            answer = number1 / number2
            break
            
        default:
            break
        }
    }
    
    // A function that loads all the images to the array variable
    private func images(){
        var word: String
        for i in 1...100 {
            word = "Num" + String(i)
            NumbersArray.append(word)
        }
    }
    
    // Function that returns an random image from the array
    private func randomImage() -> String {
        var number: String
        number = NumbersArray[Int(arc4random_uniform(100))]
        return number
    }
    
    // Function that assigns operators
    @IBAction func handleSigns(_ sender: Any?) {
        let image = sender as? UITapGestureRecognizer
        //print("\n", image!.view!.accessibilityIdentifier!)
        symbol = Character(image!.view!.accessibilityIdentifier!)
        print(symbol!)
        is3VarSetUp()
    }
    
    // Function that assings the correct number to my variables
    @IBAction func handleNumbers(_ sender: Any?) {
        let image = sender as? UITapGestureRecognizer
        //print("\n", image!.view!.accessibilityIdentifier!)
        if (GameViewController.selection == 1) {
            number1 =  filter(image!.view!.accessibilityIdentifier!)
            GameViewController.selection += 1
            print("number1: ", number1)
            is3VarSetUp()
        }
        else if(GameViewController.selection == 2) {
            number2 = filter(image!.view!.accessibilityIdentifier!)
            GameViewController.selection = 1
            print("number2: ", number2)
            is3VarSetUp()
            number1 = 0
            number2 = 0
            symbol = nil
        }
        else {
            GameViewController.selection = 1
            number1 = 0
            number2 = 0
            symbol = nil
        }
        is3VarSetUp()
    }
    
    // Function that assings randomImage() to each UIImage
    @objc private func the4Images() {
        
        var assigned: String
        
        assigned = randomImage()
        LeftUIImage1.accessibilityIdentifier = assigned
        LeftUIImage1.image = UIImage(named: assigned)
        
        assigned = randomImage()
        LeftUIImage2.accessibilityIdentifier = assigned
        LeftUIImage2.image = UIImage(named: assigned)
        
        assigned = randomImage()
        LeftUIImage3.accessibilityIdentifier = assigned
        LeftUIImage3.image = UIImage(named: assigned)
        
        assigned = randomImage()
        LeftUIImage4.accessibilityIdentifier = assigned
        LeftUIImage4.image = UIImage(named: assigned)
    }
    
    // Function that changes the main number image
    public func changeNumber() {
        var set: String
        
        set = randomImage()
        mainRandomImage.accessibilityIdentifier = set
        mainRandomImage.image = UIImage(named: set)
    }
    
    //**********************************************************************************//
    
    // My Timer That Changes my images
    public func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2, target: self,   selector: (#selector(GameViewController.the4Images)), userInfo: nil, repeats: true)
    }
    
    // Function for the main timer
    public func clockticking() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.counter), userInfo: nil, repeats: true)
    }
    
    // Timer for the user to play
    func counter(){
        seconds -= 1
        timerLabel.text = String(seconds)
        if (seconds == 0) {
            changeNumber()
            timer.invalidate()
            seconds = 60
            myNumber.text = "0"
            clockticking()
        }
    }
    
    //**********************************************************************************//
    
    // Function that changes the background every second
    func changeBackround()  {
        self.MainView.backgroundColor = UIColor.randomColor()
    }
    
    // Function that resets the timer
    func resetTimer() {
        seconds = 60
    }
    
    public func pausing(){
        timer.invalidate()
        
    }
    
    // Function that checks if it matches the right number
    func checking(){
        if(answer == Int(myNumber.text!)) {
            mainScore += 2
            score.text = String(mainScore)
            changeNumber()
            resetTimer()
            print("it matches")
        }
    }
    
    // Loads eveything when the view loads up
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calling my functions
        images()
        the4Images()
        runTimer()
        changeNumber()
        clockticking()
        checking()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.changeBackround), userInfo: nil, repeats: true)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIColor {
     static func randomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

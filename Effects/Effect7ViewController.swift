//
//  Effect7ViewController.swift
//  Effects
//
//  Created by Denes Csizmadia on 2015. 11. 01..
//  Copyright © 2015. Denes Csizmadia. All rights reserved.
//

import UIKit


var looperFeedback :Float = 1.0
var looperIsOn = false
var currentLooperState = looperState.stop


class Effect7ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var redLed: UIImageView!
    
    var isON = false

    override func viewDidLoad() {
        super.viewDidLoad()
        redLed.image = UIImage(named: "lightOff.png")
        
        
        let tapGestrure = UITapGestureRecognizer()
        tapGestrure.addTarget(self, action: "handleTap")
        
        
        
        let longTapGesture = UILongPressGestureRecognizer()
        longTapGesture.addTarget(self, action: "handleLongTap")
        self.tapView.addGestureRecognizer(tapGestrure)
        self.tapView.addGestureRecognizer(longTapGesture)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchEffect", name: "ByPass7ButtonPressed", object: nil)
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleTap() {
        
        if(currentLooperState == .stop){
            NSNotificationCenter.defaultCenter().postNotificationName("setByPass7", object: nil)
            currentLooperState = .recordingFirstly
            self.redLed.image = UIImage(named: "redLightOn.png")
            looperIsOn = true
        }
        
       else if (currentLooperState == .recordingFirstly) {
            currentLooperState = .play
            self.redLed.image = UIImage(named: "greenLightOn.png")
            looperIndex = 0
            
        }
        
        else if (currentLooperState == .play) {
            currentLooperState = .record
            self.redLed.image = UIImage(named: "redLightOn.png")
        }
        
        else if (currentLooperState == .record) {
            currentLooperState = .play
            self.redLed.image = UIImage(named: "greenLightOn.png")
    }
    }
    
    func switchEffect() {
        if (currentLooperState != .stop){
            currentLooperState = .stop
            looperIsOn = false
            self.redLed.image = UIImage(named: "lightOff.png")
            looperIsOn = false
            looperBuffer = [Double](count: looperBufferCount, repeatedValue : 0.0)
        }
        else {  currentLooperState = .recordingFirstly
            self.redLed.image = UIImage(named: "redLightOn.png")
            looperIsOn = true}
        
       
    }

    func handleLongTap() {
        if (currentLooperState != .stop){
        currentLooperState = .stop
        looperIsOn = false
        self.redLed.image = UIImage(named: "lightOff.png")
         NSNotificationCenter.defaultCenter().postNotificationName("setByPass7", object: nil)
        looperBuffer = [Double](count: looperBufferCount, repeatedValue : 0.0)
        looperIndex = 0
        looperValue = 0
        }
    }
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

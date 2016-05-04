//
//  Effect2ViewController.swift
//  Effects
//
//  Created by Denes Csizmadia on 2015. 10. 02..
//  Copyright © 2015. Denes Csizmadia. All rights reserved.
//

import UIKit

var DelayLevel : Float = 25000
var FeedbackLevel : Float = 0.5
var DelayIsOn = false

class Effect2ViewController: UIViewController {

    
    @IBOutlet weak var delayRotateView: UIView!
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var feedbackRotateView: UIView!
    @IBOutlet weak var delayPot: UIImageView!
    @IBOutlet weak var feedbackPot: UIImageView!
    @IBOutlet weak var redLed: UIImageView!
    
    var delayLevel : Float = 25000
    var feedbackLevel : Float = 0.5
    var isON = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redLed.image = UIImage(named: "lightOff.png")
        
        let rotationGestrure1 = UIRotationGestureRecognizer()
        rotationGestrure1.addTarget(self, action: "handleDelayRotation:")
        self.delayRotateView.addGestureRecognizer(rotationGestrure1)
        let rotationGestrure2 = UIRotationGestureRecognizer()
        rotationGestrure2.addTarget(self, action: "handleFeedbackRotation:")
        self.feedbackRotateView.addGestureRecognizer(rotationGestrure2)

        
        let tapGestrure = UITapGestureRecognizer()
        tapGestrure.addTarget(self, action: "handleTap")
        self.tapView.addGestureRecognizer(tapGestrure)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchEffect", name: "ByPass2ButtonPressed", object: nil)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleDelayRotation (rotationGesture : UIRotationGestureRecognizer) {
        self.delayLevel += Float(rotationGesture.rotation) * 8000
        if self.delayLevel > 45000 {self.delayLevel = 45000}
        else if self.delayLevel < 5000 {self.delayLevel = 5000}
        else {
        self.delayRotateView.transform = CGAffineTransformRotate(self.delayRotateView.transform, rotationGesture.rotation)
        }
        DelayLevel = self.delayLevel
        rotationGesture.rotation = 0.0
    }

    func handleFeedbackRotation (rotationGesture : UIRotationGestureRecognizer) {
        self.feedbackLevel += Float(rotationGesture.rotation) / 6
        if self.feedbackLevel > 0.9 { self.feedbackLevel = 0.9}
        else if self.feedbackLevel < 0.1 {self.feedbackLevel = 0.1}
        else {self.feedbackRotateView.transform = CGAffineTransformRotate(self.feedbackRotateView.transform, rotationGesture.rotation)
        }
        FeedbackLevel = self.feedbackLevel
        rotationGesture.rotation = 0.0
    }
    
    func handleTap() {
        
        NSNotificationCenter.defaultCenter().postNotificationName("setByPass2", object: nil)
        self.isON = !isON
        if(isON){
            self.redLed.image = UIImage(named: "redLightOn.png")

        }
        else {
            self.redLed.image = UIImage(named: "lightOff.png")
        }
        DelayIsOn = self.isON
    }
    
    func switchEffect() {
        self.isON = !isON
        if(isON){
            self.redLed.image = UIImage(named: "redLightOn.png")
        }
        else {
            self.redLed.image = UIImage(named: "lightOff.png")
        }
        DelayIsOn = self.isON
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

//
//  Effect6ViewController.swift
//  Effects
//
//  Created by Denes Csizmadia on 2015. 11. 01..
//  Copyright © 2015. Denes Csizmadia. All rights reserved.
//

import UIKit

var reverbIsOn = false
var ReverbValue : Float = 1500
var ReverbFeedback : Float = 0.6

class Effect6ViewController: UIViewController {
    
    var isON = false
    var reverbValue : Float = 1500
    var reverbFeedback : Float = 0.6
    
    @IBOutlet weak var delayRotateView: UIView!
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var feedbackRotateView: UIView!
    @IBOutlet weak var redLed: UIImageView!

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
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchEffect", name: "ByPass6ButtonPressed", object: nil)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func handleDelayRotation (rotationGesture : UIRotationGestureRecognizer) {
        self.reverbValue += Float(rotationGesture.rotation) * 470
        if self.reverbValue > 2900 {self.reverbValue = 2900}
        else if self.reverbValue < 100 {self.reverbValue = 100}
        else {
        self.delayRotateView.transform = CGAffineTransformRotate(self.delayRotateView.transform, rotationGesture.rotation)
        }
        ReverbValue = self.reverbValue
        rotationGesture.rotation = 0.0
    }
    
    func handleFeedbackRotation (rotationGesture : UIRotationGestureRecognizer) {
        self.reverbFeedback += Float(rotationGesture.rotation) / 10
        if self.reverbFeedback > 0.9 {self.reverbFeedback = 0.9}
        else if self.reverbFeedback < 0.1 {self.reverbFeedback = 0.1}
        else {
        self.feedbackRotateView.transform = CGAffineTransformRotate(self.feedbackRotateView.transform, rotationGesture.rotation)
        }
        ReverbFeedback = self.reverbFeedback
        rotationGesture.rotation = 0.0
    }
    
    func handleTap() {
        
        NSNotificationCenter.defaultCenter().postNotificationName("setByPass6", object: nil)
        self.isON = !isON
        if(isON){
            self.redLed.image = UIImage(named: "redLightOn.png")
            
        }
        else {
            self.redLed.image = UIImage(named: "lightOff.png")
        }
        reverbIsOn = self.isON
    }
    
    func switchEffect() {
        self.isON = !isON
        if(isON){
            self.redLed.image = UIImage(named: "redLightOn.png")
        }
        else {
            self.redLed.image = UIImage(named: "lightOff.png")
        }
        reverbIsOn = self.isON
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

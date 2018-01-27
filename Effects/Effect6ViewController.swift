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
        rotationGestrure1.addTarget(self, action: #selector(Effect6ViewController.handleDelayRotation(_:)))
        self.delayRotateView.addGestureRecognizer(rotationGestrure1)
        let rotationGestrure2 = UIRotationGestureRecognizer()
        rotationGestrure2.addTarget(self, action: #selector(Effect6ViewController.handleFeedbackRotation(_:)))
        self.feedbackRotateView.addGestureRecognizer(rotationGestrure2)
        
        
        let tapGestrure = UITapGestureRecognizer()
        tapGestrure.addTarget(self, action: #selector(Effect6ViewController.handleTap))
        self.tapView.addGestureRecognizer(tapGestrure)
        
        NotificationCenter.default.addObserver(self, selector: #selector(Effect6ViewController.switchEffect), name: NSNotification.Name(rawValue: "ByPass6ButtonPressed"), object: nil)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func handleDelayRotation (_ rotationGesture : UIRotationGestureRecognizer) {
        self.reverbValue += Float(rotationGesture.rotation) * 470
        if self.reverbValue > 2900 {self.reverbValue = 2900}
        else if self.reverbValue < 100 {self.reverbValue = 100}
        else {
        self.delayRotateView.transform = self.delayRotateView.transform.rotated(by: rotationGesture.rotation)
        }
        ReverbValue = self.reverbValue
        rotationGesture.rotation = 0.0
    }
    
    func handleFeedbackRotation (_ rotationGesture : UIRotationGestureRecognizer) {
        self.reverbFeedback += Float(rotationGesture.rotation) / 10
        if self.reverbFeedback > 0.9 {self.reverbFeedback = 0.9}
        else if self.reverbFeedback < 0.1 {self.reverbFeedback = 0.1}
        else {
        self.feedbackRotateView.transform = self.feedbackRotateView.transform.rotated(by: rotationGesture.rotation)
        }
        ReverbFeedback = self.reverbFeedback
        rotationGesture.rotation = 0.0
    }
    
    func handleTap() {
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "setByPass6"), object: nil)
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

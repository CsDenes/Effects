//
//  Effect5ViewController.swift
//  Effects
//
//  Created by Denes Csizmadia on 2015. 11. 01..
//  Copyright © 2015. Denes Csizmadia. All rights reserved.
//

import UIKit

var Tremolo : Float = 0.3
var TremoloIsOn = false

class Effect5ViewController: UIViewController {
    
    @IBOutlet weak var redLed: UIImageView!
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var rotateView: UIView!
    
    var tremolo : Float = 0.3
    var isON = false
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLed.image = UIImage(named: "lightOff.png")
        
        let rotationGestrure = UIRotationGestureRecognizer()
        rotationGestrure.addTarget(self, action: "handleRotation:")
        self.rotateView.addGestureRecognizer(rotationGestrure)
        
        let tapGestrure = UITapGestureRecognizer()
        tapGestrure.addTarget(self, action: "handleTap")
        self.tapView.addGestureRecognizer(tapGestrure)
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchEffect", name: "ByPass5ButtonPressed", object: nil)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleRotation (rotationGesture : UIRotationGestureRecognizer) {
        self.tremolo += Float(rotationGesture.rotation) / 9
        if self.tremolo > 0.59 {self.tremolo = 0.59}
        else if self.tremolo < 0.01 {self.tremolo = 0.01}
        else {
        self.rotateView.transform = CGAffineTransformRotate(self.rotateView.transform, rotationGesture.rotation)
        }
        Tremolo = self.tremolo
        rotationGesture.rotation = 0.0
    }
    
    
    func handleTap() {
        
        NSNotificationCenter.defaultCenter().postNotificationName("setByPass5", object: nil)
        self.isON = !isON
        if(isON){
            self.redLed.image = UIImage(named: "redLightOn.png")
        }
        else {
            self.redLed.image = UIImage(named: "lightOff.png")
        }
        TremoloIsOn = self.isON
    }
    
    func switchEffect() {
         self.isON = !isON
        if(isON){
            self.redLed.image = UIImage(named: "redLightOn.png")
        }
        else {
            self.redLed.image = UIImage(named: "lightOff.png") }
        TremoloIsOn = self.isON
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

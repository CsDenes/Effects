//
//  Effect1ViewController.swift
//  Effects
//
//  Created by Denes Csizmadia on 2015. 10. 02..
//  Copyright © 2015. Denes Csizmadia. All rights reserved.
//

import UIKit



var Overdrivelevel : Float = 0.5
var OverdriveIsOn = false

class Effect1ViewController: UIViewController {

    @IBOutlet weak var redLed: UIImageView!
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var rotateView: UIView!
    
    
    var overdrivelevel: Float = 0.5
    var isON = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redLed.image = UIImage(named: "lightOff.png")
        
        let rotationGestrure = UIRotationGestureRecognizer()
        rotationGestrure.addTarget(self, action: #selector(Effect1ViewController.handleRotation(_:)))
        self.rotateView.addGestureRecognizer(rotationGestrure)
        
        let tapGestrure = UITapGestureRecognizer()
        tapGestrure.addTarget(self, action: #selector(Effect1ViewController.handleTap))
        self.tapView.addGestureRecognizer(tapGestrure)
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(Effect1ViewController.switchEffect), name: NSNotification.Name(rawValue: "ByPass1ButtonPressed"), object: nil)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func handleRotation (_ rotationGesture : UIRotationGestureRecognizer) {
        self.overdrivelevel -= Float(rotationGesture.rotation)/6
        if self.overdrivelevel > 0.9 {self.overdrivelevel = 0.9}
        else if self.overdrivelevel < 0.1 {self.overdrivelevel = 0.1}
        else {
        self.rotateView.transform = self.rotateView.transform.rotated(by: rotationGesture.rotation)
        }
        Overdrivelevel = self.overdrivelevel
      //  print(Overdrivelevel)
        rotationGesture.rotation = 0.0
    }
    
    
    func handleTap() {
    
        NotificationCenter.default.post(name: Notification.Name(rawValue: "setByPass1"), object: nil)
        self.isON = !isON
        if(isON){
        self.redLed.image = UIImage(named: "redLightOn.png")
        }
        else {
        self.redLed.image = UIImage(named: "lightOff.png")
        }
        OverdriveIsOn = self.isON
        }
    
    func switchEffect() {
        if(isON){
            self.redLed.image = UIImage(named: "redLightOn.png")
        }
        else {
            self.redLed.image = UIImage(named: "lightOff.png") }
        OverdriveIsOn = self.isON
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

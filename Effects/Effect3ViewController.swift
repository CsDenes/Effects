//
//  Effect3ViewController.swift
//  Effects
//
//  Created by Denes Csizmadia on 2015. 10. 30..
//  Copyright © 2015. Denes Csizmadia. All rights reserved.
//

import UIKit


var EQ1 : Float = 0.5
var EQ2 : Float = 0.5
var EQ3 : Float = 0.5
var EQ4 : Float = 0.5
var EQ5 : Float = 0.5
var EQ6 : Float = 0.5
var EQIsOn = false

class Effect3ViewController: UIViewController {
    @IBOutlet weak var Slider1: UISlider!

    @IBOutlet weak var Slider2: UISlider!
    
    @IBOutlet weak var Slider3: UISlider!
    
    @IBOutlet weak var Slider4: UISlider!
    
    @IBOutlet weak var Slider5: UISlider!
    
    @IBOutlet weak var Slider6: UISlider!
    
    @IBOutlet weak var tapView: UIView!
    
    @IBOutlet weak var redLed: UIImageView!
    
    var eQ1 : Float = 0.5
    var eQ2 : Float = 0.5
    var eQ3 : Float = 0.5
    var eQ4 : Float = 0.5
    var eQ5 : Float = 0.5
    var eQ6 : Float = 0.5
    
    var isON = false
    override func viewDidLoad() {
        super.viewDidLoad()
        Slider1.setThumbImage(UIImage(named: "SliderButton.png"), forState: .Normal)
        Slider2.setThumbImage(UIImage(named: "SliderButton.png"), forState: .Normal)
        Slider3.setThumbImage(UIImage(named: "SliderButton.png"), forState: .Normal)
        Slider4.setThumbImage(UIImage(named: "SliderButton.png"), forState: .Normal)
        Slider5.setThumbImage(UIImage(named: "SliderButton.png"), forState: .Normal)
        Slider6.setThumbImage(UIImage(named: "SliderButton.png"), forState: .Normal)
        
        
        redLed.image = UIImage(named: "lightOff.png")
        let tapGestrure = UITapGestureRecognizer()
        tapGestrure.addTarget(self, action: "handleTap")
        self.tapView.addGestureRecognizer(tapGestrure)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchEffect", name: "ByPass3ButtonPressed", object: nil)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Slider1(sender: AnyObject) {
    self.eQ1 = Slider1.value
    EQ1 = self.eQ1
    }
    
    @IBAction func Slider2(sender: AnyObject) {
        self.eQ2 = Slider2.value
        EQ2 = self.eQ2
    }
   
    @IBAction func Slider3(sender: AnyObject) {
        self.eQ3 = Slider3.value
        EQ3 = self.eQ3
    }
    
    @IBAction func Slider4(sender: AnyObject) {
        self.eQ4 = Slider4.value
        EQ4 = self.eQ4
    }
    
    @IBAction func Slider5(sender: AnyObject) {
        self.eQ5 = Slider5.value
        EQ5 = self.eQ5
    }

    @IBAction func Slider6(sender: AnyObject) {
        self.eQ6 = Slider6.value
        EQ6 = self.eQ6
    }
    
    
    
    func handleTap() {
        
        NSNotificationCenter.defaultCenter().postNotificationName("setByPass3", object: nil)
        self.isON = !isON
        if(isON){
            self.redLed.image = UIImage(named: "redLightOn.png")
            
        }
        else {
            self.redLed.image = UIImage(named: "lightOff.png")
        }
        EQIsOn = self.isON
    }
    
    func switchEffect() {
        self.isON = !isON
        if(isON){
            self.redLed.image = UIImage(named: "redLightOn.png")
        }
        else {
            self.redLed.image = UIImage(named: "lightOff.png")
        }
        EQIsOn = self.isON
    }

  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//
//  PresetViewContoller.swift
//  Effects
//
//  Created by Denes Csizmadia on 2015. 10. 05..
//  Copyright © 2015. Denes Csizmadia. All rights reserved.
//

import UIKit

let Preset1ButtonKey = "Preset1ButtonKey"
let Preset2ButtonKey = "Preset2ButtonKey"
let Preset3ButtonKey = "Preset3ButtonKey"

var isPreset1 = true
var isPreset2 = false
var isPreset3 = false

class PresetViewContoller: UIViewController {
   
    
    @IBOutlet weak var progressIn: UIProgressView!

    @IBOutlet weak var progressOut: UIProgressView!
    
    @IBOutlet weak var Preset1: UIButton!
    @IBOutlet weak var Preset2: UIButton!
    @IBOutlet weak var Preset3: UIButton!


    @IBOutlet weak var Metronome: UIButton!
   
    @IBOutlet weak var Tuner: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.progressIn.transform = self.progressIn.transform.rotated(by: -1.571)
        
        self.progressOut.transform = self.progressOut.transform.rotated(by: -1.571)
        
        var timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(PresetViewContoller.changeProgress), userInfo: nil, repeats: true)
        
        
        Preset1.setImage(UIImage(named: "preset1.png"), for: UIControlState())
        Preset1.alpha = 1
        
        Preset2.setImage(UIImage(named: "preset2.png"), for: UIControlState())
         Preset2.alpha = 0.2
        
        Preset3.setImage(UIImage(named: "preset3.png"), for: UIControlState())
         Preset3.alpha = 0.2
        
        Metronome.setImage(UIImage(named: "metronomeButtonPressed.png"), for: UIControlState())
        Metronome.alpha = 0.4
        
        Tuner.setImage(UIImage(named: "tunerButtonPressed.png"), for: UIControlState())
        Tuner.alpha = 0.4
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    
    
    
    }
    
    @IBAction func Preset1ButtonPressed(_ sender: AnyObject) {
    NotificationCenter.default.post(name: Notification.Name(rawValue: Preset1ButtonKey), object: nil)
    Overdrivelevel = ViewControllerFactory1.sharedFactory1.effect1ViewController.overdrivelevel
    OverdriveIsOn = ViewControllerFactory1.sharedFactory1.effect1ViewController.isON
    isByPass1 = !OverdriveIsOn
   
    DelayIsOn = ViewControllerFactory1.sharedFactory1.effect2ViewController.isON
    isByPass2 = !DelayIsOn
    DelayLevel = ViewControllerFactory1.sharedFactory1.effect2ViewController.delayLevel
    FeedbackLevel = ViewControllerFactory1.sharedFactory1.effect2ViewController.feedbackLevel
        
    EQIsOn = ViewControllerFactory1.sharedFactory1.effect3ViewController.isON
    isByPass3 = !EQIsOn
    EQ1 = ViewControllerFactory1.sharedFactory1.effect3ViewController.eQ1
    EQ2 = ViewControllerFactory1.sharedFactory1.effect3ViewController.eQ2
    EQ3 = ViewControllerFactory1.sharedFactory1.effect3ViewController.eQ3
    EQ4 = ViewControllerFactory1.sharedFactory1.effect3ViewController.eQ4
    EQ5 = ViewControllerFactory1.sharedFactory1.effect3ViewController.eQ5
    EQ6 = ViewControllerFactory1.sharedFactory1.effect3ViewController.eQ6
        
    FlangerIsOn = ViewControllerFactory1.sharedFactory1.effect4ViewController.isON
    flangerFeedback = ViewControllerFactory1.sharedFactory1.effect4ViewController.delayLevel
    flangerFeedback = ViewControllerFactory1.sharedFactory1.effect4ViewController.feedbackLevel
    isByPass4 = !FlangerIsOn
    
    TremoloIsOn = ViewControllerFactory1.sharedFactory1.effect5ViewController.isON
    Tremolo = ViewControllerFactory1.sharedFactory1.effect5ViewController.tremolo
    isByPass5 = !TremoloIsOn
    
    reverbIsOn = ViewControllerFactory1.sharedFactory1.effect6ViewController.isON
    ReverbValue = ViewControllerFactory1.sharedFactory1.effect6ViewController.reverbValue
    ReverbFeedback = ViewControllerFactory1.sharedFactory1.effect6ViewController.reverbFeedback
    isByPass6 = !reverbIsOn

    
    
    isPreset1 = true
    isPreset2 = false
    isPreset3 = false
    update()
    }

    @IBAction func Preset2ButtonPressed(_ sender: AnyObject) {
    NotificationCenter.default.post(name: Notification.Name(rawValue: Preset2ButtonKey), object: nil)
    Overdrivelevel = ViewControllerFactory2.sharedFactory2.effect1ViewController.overdrivelevel
    OverdriveIsOn = ViewControllerFactory2.sharedFactory2.effect1ViewController.isON
    isByPass1 = !OverdriveIsOn
        
        
    DelayIsOn = ViewControllerFactory2.sharedFactory2.effect2ViewController.isON
    isByPass2 = !DelayIsOn
    DelayLevel = ViewControllerFactory2.sharedFactory2.effect2ViewController.delayLevel
    FeedbackLevel = ViewControllerFactory2.sharedFactory2.effect2ViewController.feedbackLevel
        
    EQIsOn = ViewControllerFactory2.sharedFactory2.effect3ViewController.isON
    isByPass3 = !EQIsOn
    EQ1 = ViewControllerFactory2.sharedFactory2.effect3ViewController.eQ1
    EQ2 = ViewControllerFactory2.sharedFactory2.effect3ViewController.eQ2
    EQ3 = ViewControllerFactory2.sharedFactory2.effect3ViewController.eQ3
    EQ4 = ViewControllerFactory2.sharedFactory2.effect3ViewController.eQ4
    EQ5 = ViewControllerFactory2.sharedFactory2.effect3ViewController.eQ5
    EQ6 = ViewControllerFactory2.sharedFactory2.effect3ViewController.eQ6
        
    FlangerIsOn = ViewControllerFactory2.sharedFactory2.effect4ViewController.isON
    flangerFeedback = ViewControllerFactory2.sharedFactory2.effect4ViewController.delayLevel
    flangerFeedback = ViewControllerFactory2.sharedFactory2.effect4ViewController.feedbackLevel
    isByPass4 = !FlangerIsOn
        
    TremoloIsOn = ViewControllerFactory2.sharedFactory2.effect5ViewController.isON
    Tremolo = ViewControllerFactory2.sharedFactory2.effect5ViewController.tremolo
    isByPass5 = !TremoloIsOn
        
    reverbIsOn = ViewControllerFactory2.sharedFactory2.effect6ViewController.isON
    ReverbValue = ViewControllerFactory2.sharedFactory2.effect6ViewController.reverbValue
    ReverbFeedback = ViewControllerFactory2.sharedFactory2.effect6ViewController.reverbFeedback
    isByPass6 = !reverbIsOn


    isPreset1 = false
    isPreset2 = true
    isPreset3 = false
    update()
    }

    
    @IBAction func Preset3ButtonPressed(_ sender: AnyObject) {
    NotificationCenter.default.post(name: Notification.Name(rawValue: Preset3ButtonKey), object: nil)
    Overdrivelevel = ViewControllerFactory3.sharedFactory3.effect1ViewController.overdrivelevel
    OverdriveIsOn = ViewControllerFactory3.sharedFactory3.effect1ViewController.isON
    isByPass1 = !OverdriveIsOn
    
        DelayIsOn = ViewControllerFactory3.sharedFactory3.effect2ViewController.isON
        isByPass2 = !DelayIsOn
        DelayLevel = ViewControllerFactory3.sharedFactory3.effect2ViewController.delayLevel
        FeedbackLevel = ViewControllerFactory3.sharedFactory3.effect2ViewController.feedbackLevel
        
        EQIsOn = ViewControllerFactory3.sharedFactory3.effect3ViewController.isON
        isByPass3 = !EQIsOn
        EQ1 = ViewControllerFactory3.sharedFactory3.effect3ViewController.eQ1
        EQ2 = ViewControllerFactory3.sharedFactory3.effect3ViewController.eQ2
        EQ3 = ViewControllerFactory3.sharedFactory3.effect3ViewController.eQ3
        EQ4 = ViewControllerFactory3.sharedFactory3.effect3ViewController.eQ4
        EQ5 = ViewControllerFactory3.sharedFactory3.effect3ViewController.eQ5
        EQ6 = ViewControllerFactory3.sharedFactory3.effect3ViewController.eQ6
        
        FlangerIsOn = ViewControllerFactory3.sharedFactory3.effect4ViewController.isON
        flangerFeedback = ViewControllerFactory3.sharedFactory3.effect4ViewController.delayLevel
        flangerFeedback = ViewControllerFactory3.sharedFactory3.effect4ViewController.feedbackLevel
        isByPass4 = !FlangerIsOn
        
        TremoloIsOn = ViewControllerFactory3.sharedFactory3.effect5ViewController.isON
        Tremolo = ViewControllerFactory3.sharedFactory3.effect5ViewController.tremolo
        isByPass5 = !TremoloIsOn
        
        reverbIsOn = ViewControllerFactory3.sharedFactory3.effect6ViewController.isON
        ReverbValue = ViewControllerFactory3.sharedFactory3.effect6ViewController.reverbValue
        ReverbFeedback = ViewControllerFactory3.sharedFactory3.effect6ViewController.reverbFeedback
        isByPass6 = !reverbIsOn
    
    
        
        
        
    isPreset1 = false
    isPreset2 = false
    isPreset3 = true
    update()
    }


    func update() {
        if (isPreset1){
        Preset1.alpha = 1
        }
        else {
        Preset1.alpha = 0.2
        }
        if (isPreset2){
        Preset2.alpha = 1
        }
        else {
        Preset2.alpha = 0.2
        }
        if (isPreset3){
        Preset3.alpha = 1
        }
        else {
        Preset3.alpha = 0.2
        }
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "selectorUpdate"), object: nil)
    }
    
    
    func changeProgress () {
    var value = progressBuffer.max()!
    self.progressIn.setProgress(Float(value), animated: true)
    self.progressOut.setProgress(Float(value), animated: true)
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

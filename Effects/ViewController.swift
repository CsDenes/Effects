//
//  ViewController.swift
//  Effects
//
//  Created by Denes Csizmadia on 2015. 04. 14..
//  Copyright (c) 2015. Denes Csizmadia. All rights reserved.
//

import UIKit




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var audioProcessor : AudioProcessor = AudioProcessor()
    
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    
    @IBOutlet weak var feedBackSlider: UISlider!
    @IBOutlet weak var delaySlider: UISlider!
    
    
    @IBAction func feedBackSliderValueChanged(sender: AnyObject) {
         //Feedback=Double(feedBackSlider.value)
    }
   
    
    
    
    
    @IBAction func overDriveValueChanged(sender: AnyObject) {
   //     Gain=Double(overDrive.value)
    }
    @IBOutlet weak var overDrive: UISlider!
    
    
    
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
      //  Delay=Int(delaySlider.value)
    }
    
    func Slider() -> Float {
    return delaySlider.value
    }
    
    @IBAction func audioSwitch(sender: UISwitch) {
        if(self.mySwitch.on){
            audioProcessor.start()
        }
        else {
            audioProcessor.stop()
        }
    }

}


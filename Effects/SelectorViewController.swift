//
//  SelectorViewController.swift
//  Effects
//
//  Created by Denes Csizmadia on 2015. 09. 15..
//  Copyright (c) 2015. Denes Csizmadia. All rights reserved.
//

import UIKit
import StoreKit

 let mySpecialNotificationKey = "com.&DStudio.switchEffect"

var isByPass1 = true
var isByPass2 = true
var isByPass3 = true
var isByPass4 = true
var isByPass5 = true
var isByPass6 = true
var isByPass7 = true

class SelectorViewController: UIViewController {
 
  //  var delegate: IAPurchaceViewControllerDelegate!
    
    let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    var popViewController : PopUpViewControllerSwift!
    
    
    
    @IBOutlet weak var AddEffect: UIButton!
    @IBOutlet weak var Effect1: UIButton!
    @IBOutlet weak var ByPass1: UIButton!
    @IBOutlet weak var Effect2: UIButton!
    @IBOutlet weak var ByPass2: UIButton!
    @IBOutlet weak var Effect3: UIButton!
    @IBOutlet weak var ByPass3: UIButton!
    @IBOutlet weak var Effect4: UIButton!
    @IBOutlet weak var ByPass4: UIButton!
    @IBOutlet weak var Effect5: UIButton!
    @IBOutlet weak var ByPass5: UIButton!
    @IBOutlet weak var Effect6: UIButton!
    @IBOutlet weak var ByPass6: UIButton!
    @IBOutlet weak var Effect7: UIButton!
    @IBOutlet weak var ByPass7: UIButton!
    
    
    
    
    var isEffect1 = true
    var isEffect2 = false
    var isEffect3 = false
    var isEffect4 = false
    var isEffect5 = false
    var isEffect6 = false
    var isEffect7 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.Effect1.setImage(UIImage(named: "overdriveButtonPressed.png"), forState: .Normal)
        self.ByPass1.setImage(UIImage(named: "bypass.png"), forState: .Normal)
        self.ByPass1.alpha=1
        
        self.Effect2.setImage(UIImage(named: "delayButton.png"), forState: .Normal)
        self.ByPass2.setImage(UIImage(named: "bypass.png"), forState: .Normal)
        self.ByPass2.alpha=1
        
        
        self.Effect3.setImage(UIImage(named: "EQButton.png"), forState: .Normal)
        self.ByPass3.setImage(UIImage(named: "bypass.png"), forState: .Normal)
        self.ByPass3.alpha=1
        
        self.Effect4.setImage(UIImage(named: "flangerButton.png"), forState: .Normal)
        self.ByPass4.setImage(UIImage(named: "bypass.png"), forState: .Normal)
        self.ByPass4.alpha=1
        
        self.Effect5.setImage(UIImage(named: "tremoloButton.png"), forState: .Normal)
        self.ByPass5.setImage(UIImage(named: "bypass.png"), forState: .Normal)
        self.ByPass5.alpha=1

        self.Effect6.setImage(UIImage(named: "reverbButton.png"), forState: .Normal)
        self.ByPass6.setImage(UIImage(named: "bypass.png"), forState: .Normal)
        self.ByPass6.alpha=1

        self.Effect7.setImage(UIImage(named: "looperButton.png"), forState: .Normal)
        self.ByPass7.setImage(UIImage(named: "bypass.png"), forState: .Normal)
        self.ByPass7.alpha=1
        
        self.Effect7.hidden = true
        self.ByPass7.hidden = true

        
        
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "buyEffect1", name: "buyEffect1", object: nil)
        
         NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateNotificationSentLabel", name: mySpecialNotificationKey, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setByPass1", name: "setByPass1", object: nil)
           NSNotificationCenter.defaultCenter().addObserver(self, selector: "setByPass2", name: "setByPass2", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setByPass3", name: "setByPass3", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setByPass4", name: "setByPass4", object: nil)
         NSNotificationCenter.defaultCenter().addObserver(self, selector: "setByPass5", name: "setByPass5", object: nil)
         NSNotificationCenter.defaultCenter().addObserver(self, selector: "setByPass6", name: "setByPass6", object: nil)
         NSNotificationCenter.defaultCenter().addObserver(self, selector: "setByPass7", name: "setByPass7", object: nil)

        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "update", name: "selectorUpdate", object: nil)
        
        
        self.preferredContentSize = CGSizeMake(320.0, 600.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func AddEffectButton(sender: AnyObject) {
       
        NSNotificationCenter.defaultCenter().postNotificationName("PopUp", object: nil)
        
    
        
    }
    
   
    @IBAction func Effect1Button(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName(mySpecialNotificationKey, object: nil, userInfo: ["VC" : 1])
        self.isEffect1 = true
        self.isEffect2 = false
        self.isEffect3 = false
        self.isEffect4 = false
        self.isEffect5 = false
        self.isEffect6 = false
        self.isEffect7 = false
        
        update()
    }
    
    @IBAction func ByPass1Button(sender: AnyObject) {
        isByPass1 = !isByPass1
        NSNotificationCenter.defaultCenter().postNotificationName("ByPass1ButtonPressed", object: nil)
        if(isPreset1){
        ViewControllerFactory1.sharedFactory1.effect1ViewController.isON = !ViewControllerFactory1.sharedFactory1.effect1ViewController.isON
        }
        if(isPreset2){
            ViewControllerFactory2.sharedFactory2.effect1ViewController.isON = !ViewControllerFactory2.sharedFactory2.effect1ViewController.isON
        }
        if(isPreset3){
            ViewControllerFactory3.sharedFactory3.effect1ViewController.isON = !ViewControllerFactory3.sharedFactory3.effect1ViewController.isON
        }
        update()
        
        NSNotificationCenter.defaultCenter().postNotificationName("ByPass1ButtonPressed", object: nil)
    }
    
    
    @IBAction func Effect2Button(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName(mySpecialNotificationKey, object: nil, userInfo: ["VC" : 2])
        self.isEffect1 = false
        self.isEffect2 = true
        self.isEffect3 = false
        self.isEffect4 = false
        self.isEffect5 = false
        self.isEffect6 = false
        self.isEffect7 = false
        update()
    }
    
    @IBAction func ByPass2Button(sender: AnyObject) {
        isByPass2 = !isByPass2
        NSNotificationCenter.defaultCenter().postNotificationName("ByPass2ButtonPressed", object: nil)
        
        if(isPreset1){
            ViewControllerFactory1.sharedFactory1.effect2ViewController.isON = !ViewControllerFactory1.sharedFactory1.effect2ViewController.isON
        }
        if(isPreset2){
            ViewControllerFactory2.sharedFactory2.effect2ViewController.isON = !ViewControllerFactory2.sharedFactory2.effect2ViewController.isON
        }
        if(isPreset3){
            ViewControllerFactory3.sharedFactory3.effect2ViewController.isON = !ViewControllerFactory3.sharedFactory3.effect2ViewController.isON
        }
        NSNotificationCenter.defaultCenter().postNotificationName("ByPass2ButtonPressed", object: nil)
        update()
    }
    
    @IBAction func Effect3Button(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName(mySpecialNotificationKey, object: nil, userInfo: ["VC" : 3])
        self.isEffect1 = false
        self.isEffect2 = false
        self.isEffect3 = true
        self.isEffect4 = false
        self.isEffect5 = false
        self.isEffect6 = false
        self.isEffect7 = false
        update()
    }
    
    @IBAction func ByPass3Button(sender: AnyObject) {
        isByPass3 = !isByPass3
        NSNotificationCenter.defaultCenter().postNotificationName("ByPass3ButtonPressed", object: nil)
        update()
        if(isPreset1){
            ViewControllerFactory1.sharedFactory1.effect3ViewController.isON = !ViewControllerFactory1.sharedFactory1.effect3ViewController.isON
        }
        if(isPreset2){
            ViewControllerFactory2.sharedFactory2.effect3ViewController.isON = !ViewControllerFactory2.sharedFactory2.effect3ViewController.isON
        }
        if(isPreset3){
            ViewControllerFactory3.sharedFactory3.effect3ViewController.isON = !ViewControllerFactory3.sharedFactory3.effect3ViewController.isON
        }
        NSNotificationCenter.defaultCenter().postNotificationName("ByPass3ButtonPressed", object: nil)
        update()

    }
    
    
    @IBAction func Effect4Button(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName(mySpecialNotificationKey, object: nil, userInfo: ["VC" : 4])
        self.isEffect1 = false
        self.isEffect2 = false
        self.isEffect3 = false
        self.isEffect4 = true
        self.isEffect5 = false
        self.isEffect6 = false
        self.isEffect7 = false
        update()
    }
    
    @IBAction func ByPass4Button(sender: AnyObject) {
        isByPass4 = !isByPass4
        NSNotificationCenter.defaultCenter().postNotificationName("ByPass4ButtonPressed", object: nil)
        
        if(isPreset1){
            ViewControllerFactory1.sharedFactory1.effect4ViewController.isON = !ViewControllerFactory1.sharedFactory1.effect4ViewController.isON
        }
        if(isPreset2){
            ViewControllerFactory2.sharedFactory2.effect4ViewController.isON = !ViewControllerFactory2.sharedFactory2.effect4ViewController.isON
        }
        if(isPreset3){
            ViewControllerFactory3.sharedFactory3.effect4ViewController.isON = !ViewControllerFactory3.sharedFactory3.effect4ViewController.isON
        }
    NSNotificationCenter.defaultCenter().postNotificationName("ByPass4ButtonPressed", object: nil)
    update()
    }
    
    
    @IBAction func Effect5Button(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName(mySpecialNotificationKey, object: nil, userInfo: ["VC" : 5])
        self.isEffect1 = false
        self.isEffect2 = false
        self.isEffect3 = false
        self.isEffect4 = false
        self.isEffect5 = true
        self.isEffect6 = false
        self.isEffect7 = false
        update()
    }
    
    @IBAction func ByPass5Button(sender: AnyObject) {
        isByPass5 = !isByPass5
        NSNotificationCenter.defaultCenter().postNotificationName("ByPass5ButtonPressed", object: nil)
        if(isPreset1){
            ViewControllerFactory1.sharedFactory1.effect5ViewController.isON = !ViewControllerFactory1.sharedFactory1.effect5ViewController.isON
        }
        if(isPreset2){
            ViewControllerFactory2.sharedFactory2.effect5ViewController.isON = !ViewControllerFactory2.sharedFactory2.effect5ViewController.isON
        }
        if(isPreset3){
            ViewControllerFactory3.sharedFactory3.effect5ViewController.isON = !ViewControllerFactory3.sharedFactory3.effect5ViewController.isON
        }
        NSNotificationCenter.defaultCenter().postNotificationName("ByPass5ButtonPressed", object: nil)
        update()
    }
    

    @IBAction func Effect6Button(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName(mySpecialNotificationKey, object: nil, userInfo: ["VC" : 6])
        self.isEffect1 = false
        self.isEffect2 = false
        self.isEffect3 = false
        self.isEffect4 = false
        self.isEffect5 = false
        self.isEffect6 = true
        self.isEffect7 = false
        update()
    }
    
    @IBAction func ByPass6Button(sender: AnyObject) {
        isByPass6 = !isByPass6
        NSNotificationCenter.defaultCenter().postNotificationName("ByPass6ButtonPressed", object: nil)
        if(isPreset1){
            ViewControllerFactory1.sharedFactory1.effect6ViewController.isON = !ViewControllerFactory1.sharedFactory1.effect6ViewController.isON
        }
        if(isPreset2){
            ViewControllerFactory2.sharedFactory2.effect6ViewController.isON = !ViewControllerFactory2.sharedFactory2.effect6ViewController.isON
        }
        if(isPreset3){
            ViewControllerFactory3.sharedFactory3.effect6ViewController.isON = !ViewControllerFactory3.sharedFactory3.effect6ViewController.isON
        }
        NSNotificationCenter.defaultCenter().postNotificationName("ByPass6ButtonPressed", object: nil)

        update()
    }

    
    @IBAction func Effect7Button(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName(mySpecialNotificationKey, object: nil, userInfo: ["VC" : 7])
        self.isEffect1 = false
        self.isEffect2 = false
        self.isEffect3 = false
        self.isEffect4 = false
        self.isEffect5 = false
        self.isEffect6 = false
        self.isEffect7 = true
        update()
    }
    
    @IBAction func ByPass7Button(sender: AnyObject) {
        isByPass7 = !isByPass7
        NSNotificationCenter.defaultCenter().postNotificationName("ByPass7ButtonPressed", object: nil)
        if(isPreset1){
            ViewControllerFactory1.sharedFactory1.effect7ViewController.isON = !ViewControllerFactory1.sharedFactory1.effect7ViewController.isON
        }
        if(isPreset2){
            ViewControllerFactory2.sharedFactory2.effect7ViewController.isON = !ViewControllerFactory2.sharedFactory2.effect7ViewController.isON
        }
        if(isPreset3){
            ViewControllerFactory3.sharedFactory3.effect7ViewController.isON = !ViewControllerFactory3.sharedFactory3.effect7ViewController.isON
        }
        NSNotificationCenter.defaultCenter().postNotificationName("ByPass7ButtonPressed", object: nil)
        update()
    }
    
    

    
    
    

    func updateNotificationSentLabel() {
    //    print("Notification sent!")
    }
    
    func update() {
        if (isByPass1){
            self.ByPass1.alpha = 1
        }
        else {
            self.ByPass1.alpha = 0.2
        }
        if (isByPass2){
            self.ByPass2.alpha = 1
        }
        else{
            self.ByPass2.alpha = 0.2
        }
        if (isByPass3){
            self.ByPass3.alpha = 1
        }
        else {
            self.ByPass3.alpha = 0.2
        }
        if (isByPass4){
            self.ByPass4.alpha = 1
        }
        else {
            self.ByPass4.alpha = 0.2
        }
        if (isByPass5){
            self.ByPass5.alpha = 1
        }
        else {
            self.ByPass5.alpha = 0.2
        }
        if (isByPass6){
            self.ByPass6.alpha = 1
        }
        else {
            self.ByPass6.alpha = 0.2
        }
        if (isByPass7){
            self.ByPass7.alpha = 1
        }
        else {
            self.ByPass7.alpha = 0.2
        }
    
        if (isEffect1){
        self.Effect1.setImage(UIImage(named: "overdriveButtonPressed.png"), forState: UIControlState.Normal)
        }
        else{
        self.Effect1.setImage(UIImage(named: "overdriveButton.png"), forState: .Normal)
        }
        if (isEffect2){
            self.Effect2.setImage(UIImage(named: "delayButtonPressed.png"), forState: UIControlState.Normal)
        }
        else{
            self.Effect2.setImage(UIImage(named: "delayButton.png"), forState: .Normal)
        }
        if (isEffect3){
            self.Effect3.setImage(UIImage(named: "EQButtonPressed.png"), forState: UIControlState.Normal)
        }
        else{
            self.Effect3.setImage(UIImage(named: "EQButton.png"), forState: .Normal)
        }
        if (isEffect4){
            self.Effect4.setImage(UIImage(named: "flangerButtonPressed.png"), forState: UIControlState.Normal)
        }
        else{
            self.Effect4.setImage(UIImage(named: "flangerButton.png"), forState: .Normal)
        }
        if (isEffect5){
            self.Effect5.setImage(UIImage(named: "TremoloButtonPressed.png"), forState: UIControlState.Normal)
        }
        else{
            self.Effect5.setImage(UIImage(named: "tremoloButton.png"), forState: .Normal)
        }
        if (isEffect6){
            self.Effect6.setImage(UIImage(named: "reverbButtonPressed.png"), forState: UIControlState.Normal)
        }
        else{
            self.Effect6.setImage(UIImage(named: "reverbButton.png"), forState: .Normal)
        }
        if (isEffect7){
            self.Effect7.setImage(UIImage(named: "looperButtonPressed.png"), forState: UIControlState.Normal)
        }
        else{
            self.Effect7.setImage(UIImage(named: "looperButton.png"), forState: .Normal)
        }

    }
    
    func setByPass1(){
    isByPass1 = !isByPass1
    update()
    }
    
    func setByPass2(){
    isByPass2 = !isByPass2
    update()
    }
    
    func setByPass3(){
        isByPass3 = !isByPass3
        update()
    }
    
    func setByPass4(){
        isByPass4 = !isByPass4
        update()
    }
    
    func setByPass5(){
        isByPass5 = !isByPass5
        update()
    }
    
    func setByPass6(){
        isByPass6 = !isByPass6
        update()
    }
    
    func setByPass7(){
        isByPass7 = !isByPass7
        update()
    }
    

    func buyEffect1 () {
    self.Effect7.hidden = false
    self.ByPass7.hidden = false
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

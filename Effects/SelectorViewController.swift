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
        
        
        self.Effect1.setImage(UIImage(named: "overdriveButtonPressed.png"), for: UIControlState())
        self.ByPass1.setImage(UIImage(named: "bypass.png"), for: UIControlState())
        self.ByPass1.alpha=1
        
        self.Effect2.setImage(UIImage(named: "delayButton.png"), for: UIControlState())
        self.ByPass2.setImage(UIImage(named: "bypass.png"), for: UIControlState())
        self.ByPass2.alpha=1
        
        
        self.Effect3.setImage(UIImage(named: "EQButton.png"), for: UIControlState())
        self.ByPass3.setImage(UIImage(named: "bypass.png"), for: UIControlState())
        self.ByPass3.alpha=1
        
        self.Effect4.setImage(UIImage(named: "flangerButton.png"), for: UIControlState())
        self.ByPass4.setImage(UIImage(named: "bypass.png"), for: UIControlState())
        self.ByPass4.alpha=1
        
        self.Effect5.setImage(UIImage(named: "tremoloButton.png"), for: UIControlState())
        self.ByPass5.setImage(UIImage(named: "bypass.png"), for: UIControlState())
        self.ByPass5.alpha=1

        self.Effect6.setImage(UIImage(named: "reverbButton.png"), for: UIControlState())
        self.ByPass6.setImage(UIImage(named: "bypass.png"), for: UIControlState())
        self.ByPass6.alpha=1

        self.Effect7.setImage(UIImage(named: "looperButton.png"), for: UIControlState())
        self.ByPass7.setImage(UIImage(named: "bypass.png"), for: UIControlState())
        self.ByPass7.alpha=1
        
        self.Effect7.isHidden = true
        self.ByPass7.isHidden = true

        
        
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(SelectorViewController.buyEffect1), name: NSNotification.Name(rawValue: "buyEffect1"), object: nil)
        
         NotificationCenter.default.addObserver(self, selector: #selector(SelectorViewController.updateNotificationSentLabel), name: NSNotification.Name(rawValue: mySpecialNotificationKey), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SelectorViewController.setByPass1), name: NSNotification.Name(rawValue: "setByPass1"), object: nil)
           NotificationCenter.default.addObserver(self, selector: #selector(SelectorViewController.setByPass2), name: NSNotification.Name(rawValue: "setByPass2"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SelectorViewController.setByPass3), name: NSNotification.Name(rawValue: "setByPass3"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SelectorViewController.setByPass4), name: NSNotification.Name(rawValue: "setByPass4"), object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(SelectorViewController.setByPass5), name: NSNotification.Name(rawValue: "setByPass5"), object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(SelectorViewController.setByPass6), name: NSNotification.Name(rawValue: "setByPass6"), object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(SelectorViewController.setByPass7), name: NSNotification.Name(rawValue: "setByPass7"), object: nil)

        
        NotificationCenter.default.addObserver(self, selector: #selector(SelectorViewController.update), name: NSNotification.Name(rawValue: "selectorUpdate"), object: nil)
        
        
        self.preferredContentSize = CGSize(width: 320.0, height: 600.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func AddEffectButton(_ sender: AnyObject) {
       
        NotificationCenter.default.post(name: Notification.Name(rawValue: "PopUp"), object: nil)
        
    
        
    }
    
   
    @IBAction func Effect1Button(_ sender: AnyObject) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: mySpecialNotificationKey), object: nil, userInfo: ["VC" : 1])
        self.isEffect1 = true
        self.isEffect2 = false
        self.isEffect3 = false
        self.isEffect4 = false
        self.isEffect5 = false
        self.isEffect6 = false
        self.isEffect7 = false
        
        update()
    }
    
    @IBAction func ByPass1Button(_ sender: AnyObject) {
        isByPass1 = !isByPass1
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass1ButtonPressed"), object: nil)
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
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass1ButtonPressed"), object: nil)
    }
    
    
    @IBAction func Effect2Button(_ sender: AnyObject) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: mySpecialNotificationKey), object: nil, userInfo: ["VC" : 2])
        self.isEffect1 = false
        self.isEffect2 = true
        self.isEffect3 = false
        self.isEffect4 = false
        self.isEffect5 = false
        self.isEffect6 = false
        self.isEffect7 = false
        update()
    }
    
    @IBAction func ByPass2Button(_ sender: AnyObject) {
        isByPass2 = !isByPass2
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass2ButtonPressed"), object: nil)
        
        if(isPreset1){
            ViewControllerFactory1.sharedFactory1.effect2ViewController.isON = !ViewControllerFactory1.sharedFactory1.effect2ViewController.isON
        }
        if(isPreset2){
            ViewControllerFactory2.sharedFactory2.effect2ViewController.isON = !ViewControllerFactory2.sharedFactory2.effect2ViewController.isON
        }
        if(isPreset3){
            ViewControllerFactory3.sharedFactory3.effect2ViewController.isON = !ViewControllerFactory3.sharedFactory3.effect2ViewController.isON
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass2ButtonPressed"), object: nil)
        update()
    }
    
    @IBAction func Effect3Button(_ sender: AnyObject) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: mySpecialNotificationKey), object: nil, userInfo: ["VC" : 3])
        self.isEffect1 = false
        self.isEffect2 = false
        self.isEffect3 = true
        self.isEffect4 = false
        self.isEffect5 = false
        self.isEffect6 = false
        self.isEffect7 = false
        update()
    }
    
    @IBAction func ByPass3Button(_ sender: AnyObject) {
        isByPass3 = !isByPass3
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass3ButtonPressed"), object: nil)
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
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass3ButtonPressed"), object: nil)
        update()

    }
    
    
    @IBAction func Effect4Button(_ sender: AnyObject) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: mySpecialNotificationKey), object: nil, userInfo: ["VC" : 4])
        self.isEffect1 = false
        self.isEffect2 = false
        self.isEffect3 = false
        self.isEffect4 = true
        self.isEffect5 = false
        self.isEffect6 = false
        self.isEffect7 = false
        update()
    }
    
    @IBAction func ByPass4Button(_ sender: AnyObject) {
        isByPass4 = !isByPass4
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass4ButtonPressed"), object: nil)
        
        if(isPreset1){
            ViewControllerFactory1.sharedFactory1.effect4ViewController.isON = !ViewControllerFactory1.sharedFactory1.effect4ViewController.isON
        }
        if(isPreset2){
            ViewControllerFactory2.sharedFactory2.effect4ViewController.isON = !ViewControllerFactory2.sharedFactory2.effect4ViewController.isON
        }
        if(isPreset3){
            ViewControllerFactory3.sharedFactory3.effect4ViewController.isON = !ViewControllerFactory3.sharedFactory3.effect4ViewController.isON
        }
    NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass4ButtonPressed"), object: nil)
    update()
    }
    
    
    @IBAction func Effect5Button(_ sender: AnyObject) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: mySpecialNotificationKey), object: nil, userInfo: ["VC" : 5])
        self.isEffect1 = false
        self.isEffect2 = false
        self.isEffect3 = false
        self.isEffect4 = false
        self.isEffect5 = true
        self.isEffect6 = false
        self.isEffect7 = false
        update()
    }
    
    @IBAction func ByPass5Button(_ sender: AnyObject) {
        isByPass5 = !isByPass5
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass5ButtonPressed"), object: nil)
        if(isPreset1){
            ViewControllerFactory1.sharedFactory1.effect5ViewController.isON = !ViewControllerFactory1.sharedFactory1.effect5ViewController.isON
        }
        if(isPreset2){
            ViewControllerFactory2.sharedFactory2.effect5ViewController.isON = !ViewControllerFactory2.sharedFactory2.effect5ViewController.isON
        }
        if(isPreset3){
            ViewControllerFactory3.sharedFactory3.effect5ViewController.isON = !ViewControllerFactory3.sharedFactory3.effect5ViewController.isON
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass5ButtonPressed"), object: nil)
        update()
    }
    

    @IBAction func Effect6Button(_ sender: AnyObject) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: mySpecialNotificationKey), object: nil, userInfo: ["VC" : 6])
        self.isEffect1 = false
        self.isEffect2 = false
        self.isEffect3 = false
        self.isEffect4 = false
        self.isEffect5 = false
        self.isEffect6 = true
        self.isEffect7 = false
        update()
    }
    
    @IBAction func ByPass6Button(_ sender: AnyObject) {
        isByPass6 = !isByPass6
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass6ButtonPressed"), object: nil)
        if(isPreset1){
            ViewControllerFactory1.sharedFactory1.effect6ViewController.isON = !ViewControllerFactory1.sharedFactory1.effect6ViewController.isON
        }
        if(isPreset2){
            ViewControllerFactory2.sharedFactory2.effect6ViewController.isON = !ViewControllerFactory2.sharedFactory2.effect6ViewController.isON
        }
        if(isPreset3){
            ViewControllerFactory3.sharedFactory3.effect6ViewController.isON = !ViewControllerFactory3.sharedFactory3.effect6ViewController.isON
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass6ButtonPressed"), object: nil)

        update()
    }

    
    @IBAction func Effect7Button(_ sender: AnyObject) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: mySpecialNotificationKey), object: nil, userInfo: ["VC" : 7])
        self.isEffect1 = false
        self.isEffect2 = false
        self.isEffect3 = false
        self.isEffect4 = false
        self.isEffect5 = false
        self.isEffect6 = false
        self.isEffect7 = true
        update()
    }
    
    @IBAction func ByPass7Button(_ sender: AnyObject) {
        isByPass7 = !isByPass7
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass7ButtonPressed"), object: nil)
        if(isPreset1){
            ViewControllerFactory1.sharedFactory1.effect7ViewController.isON = !ViewControllerFactory1.sharedFactory1.effect7ViewController.isON
        }
        if(isPreset2){
            ViewControllerFactory2.sharedFactory2.effect7ViewController.isON = !ViewControllerFactory2.sharedFactory2.effect7ViewController.isON
        }
        if(isPreset3){
            ViewControllerFactory3.sharedFactory3.effect7ViewController.isON = !ViewControllerFactory3.sharedFactory3.effect7ViewController.isON
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ByPass7ButtonPressed"), object: nil)
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
        self.Effect1.setImage(UIImage(named: "overdriveButtonPressed.png"), for: UIControlState())
        }
        else{
        self.Effect1.setImage(UIImage(named: "overdriveButton.png"), for: UIControlState())
        }
        if (isEffect2){
            self.Effect2.setImage(UIImage(named: "delayButtonPressed.png"), for: UIControlState())
        }
        else{
            self.Effect2.setImage(UIImage(named: "delayButton.png"), for: UIControlState())
        }
        if (isEffect3){
            self.Effect3.setImage(UIImage(named: "EQButtonPressed.png"), for: UIControlState())
        }
        else{
            self.Effect3.setImage(UIImage(named: "EQButton.png"), for: UIControlState())
        }
        if (isEffect4){
            self.Effect4.setImage(UIImage(named: "flangerButtonPressed.png"), for: UIControlState())
        }
        else{
            self.Effect4.setImage(UIImage(named: "flangerButton.png"), for: UIControlState())
        }
        if (isEffect5){
            self.Effect5.setImage(UIImage(named: "TremoloButtonPressed.png"), for: UIControlState())
        }
        else{
            self.Effect5.setImage(UIImage(named: "tremoloButton.png"), for: UIControlState())
        }
        if (isEffect6){
            self.Effect6.setImage(UIImage(named: "reverbButtonPressed.png"), for: UIControlState())
        }
        else{
            self.Effect6.setImage(UIImage(named: "reverbButton.png"), for: UIControlState())
        }
        if (isEffect7){
            self.Effect7.setImage(UIImage(named: "looperButtonPressed.png"), for: UIControlState())
        }
        else{
            self.Effect7.setImage(UIImage(named: "looperButton.png"), for: UIControlState())
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
    self.Effect7.isHidden = false
    self.ByPass7.isHidden = false
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

//
//  ViewControllerFactory2.swift
//  Effects
//
//  Created by Denes Csizmadia on 2015. 10. 05..
//  Copyright © 2015. Denes Csizmadia. All rights reserved.
//

import UIKit



class ViewControllerFactory2: NSObject {

    static let sharedFactory2 = ViewControllerFactory2()
    
    
    var ef1 : Effect1ViewController?
    var effect1ViewController : Effect1ViewController {
        get {if(ef1 == nil)
        {ef1 = mainStoryboard.instantiateViewController(withIdentifier: "Effect1") as? Effect1ViewController}
            return ef1!}
    }
    
    var ef2 : Effect2ViewController?
    var effect2ViewController : Effect2ViewController {
        get {if(ef2 == nil)
        {ef2 = mainStoryboard.instantiateViewController(withIdentifier: "Effect2") as? Effect2ViewController}
            return ef2!}
    }
    
    var ef3 : Effect3ViewController?
    var effect3ViewController : Effect3ViewController {
        get {if(ef3 == nil)
        {ef3 = mainStoryboard.instantiateViewController(withIdentifier: "Effect3") as? Effect3ViewController}
            return ef3!}
    }
    
    var ef4 : Effect4ViewController?
    var effect4ViewController : Effect4ViewController {
        get {if(ef4 == nil)
        {ef4 = mainStoryboard.instantiateViewController(withIdentifier: "Effect4") as? Effect4ViewController}
            return ef4!}
    }
    
    var ef5 : Effect5ViewController?
    var effect5ViewController : Effect5ViewController {
        get {if(ef5 == nil)
        {ef5 = mainStoryboard.instantiateViewController(withIdentifier: "Effect5") as? Effect5ViewController}
            return ef5!}
    }
    
    var ef6 : Effect6ViewController?
    var effect6ViewController : Effect6ViewController {
        get {if(ef6 == nil)
        {ef6 = mainStoryboard.instantiateViewController(withIdentifier: "Effect6") as? Effect6ViewController}
            return ef6!}
    }
    
    var ef7 : Effect7ViewController?
    var effect7ViewController : Effect7ViewController {
        get {if(ef7 == nil)
        {ef7 = mainStoryboard.instantiateViewController(withIdentifier: "Effect7") as? Effect7ViewController}
            return ef7!}
    }
    
}


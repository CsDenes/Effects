//
//  ProcessBuffer.swift
//  Effects
//
//  Created by Denes Csizmadia on 2015. 04. 14..
//  Copyright (c) 2015. Denes Csizmadia. All rights reserved.
//

import Foundation

import UIKit

//helpBuffer
//var helpBufferCount = 20000
//var helpBuffer = [Double](count: helpBufferCount, repeatedValue: 0.0)  //buffer to delay
//var helpIndex : Int = 0

//OverDrive
var Gain: Double  = 1.0

//Delay
var Delay : Int = 0 //delay samples
var Feedback: Double = 0.0

//Chorus
var Chorus: Double = 30

@objc class ProcessBuffer:NSObject {



}



@objc class Effect : NSObject {
    var bufferSize: UInt32
    var buffer: UnsafeMutablePointer<Int16>
   
    
    init(buffer : UnsafeMutablePointer<Int16>, size : UInt32){
       // self.delayBuffer1 = buffer
       // self.delayBuffer2 = buffer
        self.buffer = buffer
        self.bufferSize = size
        super.init()
        self.doEffect()
        
    }
    
    
    
    // Process the buffer add effects
    
    
    func doEffect () {
        
        
        
        for var index = 0; index < Int(bufferSize); index++ {
        
            
            var Sample : Double = Double(buffer[index]) / 32767.0
            
            
            //Comp
            
            
            //Chorus
            
            
            
            
            //Overdrive
            Sample *= Gain
            
            
            //Delay
        
           
            if helpIndex >= helpBufferCount { helpIndex = 0}
            
            
            var delayIndex = helpIndex-Delay
            delayIndex = (delayIndex<0) ? delayIndex + helpBufferCount : delayIndex
            
            let DelaySample : Double = helpBuffer[delayIndex]
            Sample = Sample + DelaySample * Feedback
            
            
            helpBuffer[helpIndex] = Sample
            helpIndex++
            
            //Reverb
            
            
            
            
            
            
            // writeback Samples
            Sample = (Sample < -1.0) ? -1.0 : (Sample > 1.0) ? 1.0 : Sample
            Sample = Sample * 32767.0
            buffer[index] = Int16(Sample)
        
        
            }
       
        }
    
    
    
    func fft () {
    
    
    }
    
    }



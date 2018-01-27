//
//  BufferProcess.swift
//  Effects
//
//  Created by Denes Csizmadia on 2015. 10. 02..
//  Copyright © 2015. Denes Csizmadia. All rights reserved.
//

import UIKit
import Foundation
import Accelerate


var Buffer : UnsafeMutablePointer<Int16>?

var inValue = 0.0
var outValue = 0.0


var progressBuffer = [Double](repeating: 0.0, count: 2000)
var progressIndex : Int = 1
var helpBufferCount = 50000
var helpBuffer = [Double](repeating: 0.5, count: helpBufferCount)  //buffer to delay
var reverbBufferCount = 100000
var reverbBuffer = [Double](repeating: 0.5, count: reverbBufferCount)
var reverbIndex : Int = 1



var helpIndex : Int = 1
var pitchIndex : Int = 0



var flangerDelay : Float = 60
var flangerHelpIndex : Int = 0
var flangerIndicator = true
var flangerFeedbackValue = 0.0

var TremoloValue : Float = 0
var TremoloCounter : Int = 0
var TremoloIndicator = true



var realfilter = [Double](repeating: 0 , count: 1024)
var imaginaryfilter = [Double](repeating: 0, count: 1024)


var looperBufferCount = 1000000
var looperBuffer = [Double](repeating: 0.0, count: looperBufferCount)


var looperIndex = 0
var looperValue = 0
enum looperState {
    case recordingFirstly
    case play
    case record
    case stop
}


var sign : Bool = true

@objc class BufferProc: NSObject {
    
    var bufferSize: UInt32
    var buffer: UnsafeMutablePointer<Int16>
    
    
    init(buffer : UnsafeMutablePointer<Int16>, size : UInt32){
        self.buffer = buffer
        self.bufferSize = size
        super.init()
        self.doEffect()
        
    }
    
    
    
    // Process the buffer add effects
    
    
    func doEffect (){
        
        
        //var newbuffer = [Double](count: Int(bufferSize), repeatedValue : 0.0)
//        if (EQIsOn){
//            makeFilter()
//            if let buf = Buffer {
//            Buffer = fft(self.buffer)
//            self.buffer = buf}
//            else {
//            Buffer = fft(self.buffer)
//            }
//        
//        
//        }
    
        if (EQIsOn){
        makeFilter()
        self.buffer = fft(self.buffer)
        }
        
        
            
        for index in 0 ..< Int(bufferSize) {
            
            var Sample : Double = Double(buffer[index]) / 32767.0
            
            if progressIndex >= 2000 { progressIndex = 0}
            progressBuffer[progressIndex] = Sample
            progressIndex += 1
            
            if reverbIndex >= reverbBufferCount { reverbIndex = 0}
            
            if helpIndex >= helpBufferCount { helpIndex = 0}
            if reverbIndex >= reverbBufferCount { reverbIndex = 0}
            reverbBuffer[reverbIndex] = Sample
            reverbIndex += 1
            
            
            if (FlangerIsOn){
                
                
                
                // print(flangerDelay)
                // Sample = 0.2 * Sample + 0.8 * flangerFeedbackValue
                var flangerIndex = reverbIndex - Int(flangerDelay)
                flangerIndex = (flangerIndex<0) ? flangerIndex + reverbBufferCount : flangerIndex
                let flangerSample : Double = reverbBuffer[flangerIndex]
                Sample =   Sample + flangerSample * Double(flangerFeedback)
                // flangerFeedbackValue = Sample
                reverbIndex -= 1
                reverbBuffer[reverbIndex] = Sample
                reverbIndex += 1
                
                
            }
            
            
            
            
            
            //Overdrive
            if(OverdriveIsOn){
           // Sample *= Double(Overdrivelevel)
            
            Sample *= (Double(1 - Overdrivelevel) * 10)
            Sample = (Sample < -Double(Overdrivelevel)) ? -Double(Overdrivelevel) : (Sample > Double(Overdrivelevel)) ? Double(Overdrivelevel) : Sample
            
            
            }
          
            
            
           
        
            
            //Delay
            
          if (DelayIsOn){
            var delayIndex = helpIndex-Int(DelayLevel)
            delayIndex = (delayIndex<0) ? delayIndex + helpBufferCount : delayIndex
            let DelaySample : Double = helpBuffer[delayIndex]
            Sample = Sample + DelaySample * Double(FeedbackLevel)
            }
            
            
            
            
            if reverbIsOn {
            var reverbIndex1 = reverbIndex - (1 * Int(ReverbValue))
                reverbIndex1 = (reverbIndex1<0) ? reverbIndex1 + reverbBufferCount : reverbIndex1
            var reverb1 = reverbBuffer[reverbIndex1]
                reverb1 *= Double(ReverbFeedback/1.0)
                
            var reverbIndex2 = reverbIndex - (2 * Int(ReverbValue))
            reverbIndex2 = (reverbIndex2<0) ? reverbIndex2 + reverbBufferCount : reverbIndex2
            var reverb2 = reverbBuffer[reverbIndex2]
                reverb2 *= Double(ReverbFeedback/2.0)
                
            var reverbIndex3 = reverbIndex - (3 * Int(ReverbValue))
            reverbIndex3 = (reverbIndex3<0) ? reverbIndex3 + reverbBufferCount : reverbIndex3
            var reverb3 = reverbBuffer[reverbIndex3]
                reverb3 *= Double(ReverbFeedback/3.0)
                
            var reverbIndex4 = reverbIndex-Int(ReverbValue)
            reverbIndex4 = (reverbIndex4<0) ? reverbIndex4 + reverbBufferCount : reverbIndex4
            var reverb4 = reverbBuffer[reverbIndex4]
                reverb4 *= Double(ReverbFeedback/4.0)
                
            var reverbIndex5 = reverbIndex-Int(ReverbValue)
            reverbIndex5 = (reverbIndex5<0) ? reverbIndex5 + reverbBufferCount : reverbIndex5
            var reverb5 = reverbBuffer[reverbIndex5]
                reverb5 *= Double(ReverbFeedback/5.0)
                
            var reverbIndex6 = reverbIndex-Int(ReverbValue)
            reverbIndex6 = (reverbIndex6<0) ? reverbIndex6 + reverbBufferCount : reverbIndex6
            var reverb6 = reverbBuffer[reverbIndex6]
                reverb6 *= Double(ReverbFeedback/6.0)
            
            var reverbIndex7 = reverbIndex-Int(ReverbValue)
            reverbIndex7 = (reverbIndex7<0) ? reverbIndex7 + reverbBufferCount : reverbIndex7
            var reverb7 = reverbBuffer[reverbIndex7]
                reverb7 *= Double(ReverbFeedback/7.0)
                
            Sample = Sample + reverb1 + reverb2 + reverb3  + reverb4  + reverb5  + reverb6 + reverb7
            }
            
            //Flanger
            
          
            
            
            
                
            //Tremolo
            if (TremoloIsOn){
            Sample = Sample * Double(TremoloValue)
            }
            
            
            
           
            
            if (looperIsOn) {
                switch currentLooperState {
                case .stop: break
                    
                case .recordingFirstly:
                    looperBuffer[looperIndex] = Sample
                    looperValue = looperIndex
                    looperIndex += 1
                    if looperIndex >= looperBufferCount {
                    currentLooperState = .record
                    looperIndex = 0}
                    
                case .play:
                    Sample = Sample + looperBuffer[looperIndex]
                    looperIndex += 1
                    if looperIndex > looperValue {
                    looperIndex = 0}
                case .record:
                    looperBuffer[looperIndex] += Sample
                    Sample = looperBuffer[looperIndex]
                    looperIndex += 1
                    if looperIndex > looperValue {
                    looperIndex = 0}
                    }
                
                
            }
            
                       
            
            helpBuffer[helpIndex] = Sample
            helpIndex += 1
            
            //print (Sample)
            Sample = (Sample < -1.0) ? -1.0 : (Sample > 1.0) ? 1.0 : Sample
            Sample = Sample * 32767.0
            buffer[index] = Int16(Sample)
    }
        
        
        
        
        
       
        
        if (FlangerIsOn) {
            if(flangerIndicator){
                flangerDelay += 0.2
                if (flangerDelay > flangerValue + 10 )
                {
                    flangerIndicator = false
                }
            }
            if(!flangerIndicator){
                flangerDelay -= 0.2
                if (flangerDelay < flangerValue - 10){
                    flangerIndicator = true}
            }
            
           // print(flangerDelay)
            
        }
        
        
        
        
        
        if (TremoloIsOn) {
            if(TremoloIndicator){
                TremoloValue += Tremolo
                if (TremoloValue > 1.0)
                {TremoloValue = 1.0
                    TremoloIndicator = false
                }
            }
            if(!TremoloIndicator){
                TremoloValue -= Tremolo
                if (TremoloValue < 0.0){
                    TremoloValue = 0.0
                    TremoloIndicator = true}
            }
            
        }
        
       
        
        
        
//        if (EQIsOn){
//        makeFilter()
//        newbuffer = fft(newbuffer)
//
//        for var index = 0; index < Int(bufferSize); index++ {
//
//            var Sample : Double = Double(newbuffer[index])
//           // print(Sample)
//             Sample = (Sample < -1.0) ? -1.0 : (Sample > 1.0) ? 1.0 : Sample
//            Sample = Sample * 32767.0
//            buffer[index] = Int16(Sample)
//        }
//    
//        }
}
}








//public func fft(input: [Double]) -> [Double] {
//    var real = [Double](input)
//    var imaginary = [Double](count: input.count, repeatedValue: 0.0)
//    var splitComplex = DSPDoubleSplitComplex(realp: &real, imagp: &imaginary)
//    
//    let length = vDSP_Length(floor(log2(Float(input.count))))
//    let radix = FFTRadix(kFFTRadix2)
//    let weights = vDSP_create_fftsetupD(length, radix)
//    vDSP_fft_zipD(weights, &splitComplex, 1, length, FFTDirection(FFT_FORWARD))
//    
//  
//    var complexFilter = DSPDoubleSplitComplex(realp: &realfilter, imagp: &imaginaryfilter)
//    
//    
//    vDSP_zvmulD(&splitComplex, 1, &complexFilter, 1, &splitComplex, 1, vDSP_Length(input.count), 1)
//    
//    vDSP_fft_zipD(weights, &splitComplex, 1, length, FFTDirection(FFT_INVERSE))
//    
//    
//    var out = [Double](count: input.count, repeatedValue: 0.0)
//    for var index = 0; index < input.count; index++ {
//        out[index] = splitComplex.realp[index]
//    }
//      vDSP_vsmulD(out, 1, [1.0 /  (Double(input.count))], &out, 1, vDSP_Length(input.count))
//    vDSP_destroy_fftsetupD(weights)
//    return out
//    

public func fft(_ input: UnsafeMutablePointer<Int16>) -> UnsafeMutablePointer<Int16> {
    let len = 1024
    var real = [Double](repeating: 0.0, count: len)
    vDSP_vflt16D(input, 1, &real, 1, UInt(len))
    var imaginary = [Double](repeating: 0.0, count: len)
    var splitComplex = DSPDoubleSplitComplex(realp: &real, imagp: &imaginary)
    
    let length = vDSP_Length(floor(log2(Float(len))))
    let radix = FFTRadix(kFFTRadix2)
    let weights = vDSP_create_fftsetupD(length, radix)
    vDSP_fft_zipD(weights!, &splitComplex, 1, length, FFTDirection(FFT_FORWARD))
    
    
    var complexFilter = DSPDoubleSplitComplex(realp: &realfilter, imagp: &imaginaryfilter)
    
    
    vDSP_zvmulD(&splitComplex, 1, &complexFilter, 1, &splitComplex, 1, vDSP_Length(len), 1)
    
    vDSP_fft_zipD(weights!, &splitComplex, 1, length, FFTDirection(FFT_INVERSE))
    
    
    var out = [Double](repeating: 0.0, count: len)
    vDSP_vsmulD(splitComplex.realp, 1, [1.0 /  (Double(len))], &out, 1, vDSP_Length(len))

    
    let output : UnsafeMutablePointer<Int16> = input
    vDSP_vfix16D(&out, 1, output, 1, UInt(len))
    
    vDSP_destroy_fftsetupD(weights)
    return output
    
}

func makeFilter () {
    
    for var index in 0..<128{
        if (index < 4) {
        realfilter[index] = Double(EQ1)
        imaginaryfilter[index] = Double(EQ1)

        }
        else if (index < 8) {
            realfilter[index] = Double(EQ1) + ((Double(EQ2) - Double(EQ1)) * ((Double(index)-4) / 4))
            imaginaryfilter[index] = Double(EQ1) + ((Double(EQ2) - Double(EQ1)) * ((Double(index)-4) / 4))
        }
        else if (index < 16) {
            realfilter[index] = Double(EQ2) + ((Double(EQ3) - Double(EQ2)) * ((Double(index)-8) / 8))

            imaginaryfilter[index] = Double(EQ2) + ((Double(EQ3) - Double(EQ2)) * ((Double(index)-8) / 8))

        }
        else if (index < 32) {
            realfilter[index] = Double(EQ3) + ((Double(EQ4) - Double(EQ3)) * ((Double(index)-16) / 16))

            imaginaryfilter[index] = Double(EQ3) + ((Double(EQ4) - Double(EQ3)) * ((Double(index)-16) / 16))

        }
        else if (index < 64) {
            realfilter[index] = Double(EQ4) + ((Double(EQ5) - Double(EQ4)) * ((Double(index)-32) / 32))

            imaginaryfilter[index] = Double(EQ4) + ((Double(EQ5) - Double(EQ4)) * ((Double(index)-32) / 32))

        }
        else{
            realfilter[index] = Double(EQ5) + ((Double(EQ6) - Double(EQ5)) * ((Double(index)-64) / 64))

            imaginaryfilter[index] = Double(EQ5) + ((Double(EQ6) - Double(EQ5)) * ((Double(index)-64) / 64))

        }
    }
}

  //  print(realfilter)

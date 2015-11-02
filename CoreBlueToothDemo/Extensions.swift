//
//  Extensions.swift
//  CoreBlueToothDemo
//
//  Created by kutai on 2015/11/2.
//  Copyright © 2015年 shenyun. All rights reserved.
//

import Foundation
import CoreBluetooth

extension CBCharacteristic {
    
    func isWritable() -> Bool {
        return (self.properties.intersect(CBCharacteristicProperties.Write)) != []
    }
    
    func isReadable() -> Bool {
        return (self.properties.intersect(CBCharacteristicProperties.Read)) != []
    }
    
    func isWritableWithoutResponse() -> Bool {
        return (self.properties.intersect(CBCharacteristicProperties.WriteWithoutResponse)) != []
    }
    
    func isNotifable() -> Bool {
        return (self.properties.intersect(CBCharacteristicProperties.Notify)) != []
    }
    
    func isIdicatable() -> Bool {
        return (self.properties.intersect(CBCharacteristicProperties.Indicate)) != []
    }
    
    func isBroadcastable() -> Bool {
        return (self.properties.intersect(CBCharacteristicProperties.Broadcast)) != []
    }
    
    func isExtendedProperties() -> Bool {
        return (self.properties.intersect(CBCharacteristicProperties.ExtendedProperties)) != []
    }
    
    func isAuthenticatedSignedWrites() -> Bool {
        return (self.properties.intersect(CBCharacteristicProperties.AuthenticatedSignedWrites)) != []
    }
    
    func isNotifyEncryptionRequired() -> Bool {
        return (self.properties.intersect(CBCharacteristicProperties.NotifyEncryptionRequired)) != []
    }
    
    func isIndicateEncryptionRequired() -> Bool {
        return (self.properties.intersect(CBCharacteristicProperties.IndicateEncryptionRequired)) != []
    }
    
    
    func getPropertyContent() -> String {
        var propContent = ""
        if (self.properties.intersect(CBCharacteristicProperties.Broadcast)) != [] {
            propContent += "Broadcast,"
        }
        if (self.properties.intersect(CBCharacteristicProperties.Read)) != [] {
            propContent += "Read,"
        }
        if (self.properties.intersect(CBCharacteristicProperties.WriteWithoutResponse)) != [] {
            propContent += "WriteWithoutResponse,"
        }
        if (self.properties.intersect(CBCharacteristicProperties.Write)) != [] {
            propContent += "Write,"
        }
        if (self.properties.intersect(CBCharacteristicProperties.Notify)) != [] {
            propContent += "Notify,"
        }
        if (self.properties.intersect(CBCharacteristicProperties.Indicate)) != [] {
            propContent += "Indicate,"
        }
        if (self.properties.intersect(CBCharacteristicProperties.AuthenticatedSignedWrites)) != [] {
            propContent += "AuthenticatedSignedWrites,"
        }
        if (self.properties.intersect(CBCharacteristicProperties.ExtendedProperties)) != [] {
            propContent += "ExtendedProperties,"
        }
        if (self.properties.intersect(CBCharacteristicProperties.NotifyEncryptionRequired)) != [] {
            propContent += "NotifyEncryptionRequired,"
        }
        if (self.properties.intersect(CBCharacteristicProperties.IndicateEncryptionRequired)) != [] {
            propContent += "IndicateEncryptionRequired,"
        }
        
        if !propContent.isEmpty {
            propContent = propContent.substringToIndex(propContent.endIndex.advancedBy(-1))
        }
        
        return propContent
    }
}

extension NSData {
    func getByteArray() -> [UInt8]? {
        var byteArray: [UInt8] = [UInt8]()
        for i in 0..<self.length {
            var temp: UInt8 = 0
            self.getBytes(&temp, range: NSRange(location: i, length: 1))
            byteArray.append(temp)
        }
        return byteArray
    }
}
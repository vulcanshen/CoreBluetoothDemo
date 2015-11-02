//
//  ViewController3ViewController.swift
//  CoreBlueToothDemo
//
//  Created by kutai on 2015/11/2.
//  Copyright © 2015年 shenyun. All rights reserved.
//

import UIKit
import CoreBluetooth
class ViewController3: UIViewController, CBPeripheralDelegate {
    
    var char: CBCharacteristic!
    var peripheral: CBPeripheral!
    @IBOutlet weak var lbUUID: UILabel!
    @IBOutlet weak var lbProp: UILabel!
    @IBOutlet weak var lbPropHex: UILabel!
    @IBOutlet weak var btnRead: UIButton!
    @IBOutlet weak var tvResponse: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbUUID.text = char.UUID.UUIDString
        lbProp.text = char.getPropertyContent()
        lbPropHex.text = String(format: "0x%02X", char.properties.rawValue)
        
        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(animated: Bool) {
        peripheral.delegate = self
        if !char.isReadable() {
            btnRead.enabled = false
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionRead(sender: UIButton){
        peripheral.readValueForCharacteristic(char)
    }
    
    func peripheral(peripheral: CBPeripheral, didUpdateValueForCharacteristic characteristic: CBCharacteristic, error: NSError?) {
        if let data = characteristic.value {
            tvResponse.text = (data.getByteArray()?.description)! + "\n" + tvResponse.text
        }
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

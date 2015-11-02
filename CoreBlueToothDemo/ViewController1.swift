//
//  ViewController.swift
//  CoreBlueToothDemo
//
//  Created by kutai on 2015/10/30.
//  Copyright © 2015年 shenyun. All rights reserved.
//

import UIKit
import CoreBluetooth
class ViewController1: UITableViewController, CBCentralManagerDelegate {

    
    var btCentralManager: CBCentralManager!
    var btPeripherals: [CBPeripheral] = []
    var selectedPeripheral: CBPeripheral?
    var btRSSIs: [NSNumber] = []
    var btConnectable: [Int] = []
    @IBOutlet weak var bbRefresh: UIBarButtonItem!
    
    
    @IBAction func actionRefresh(sender: UIBarButtonItem!) {
        bbRefresh.enabled = false
        btConnectable.removeAll()
        btPeripherals.removeAll()
        btRSSIs.removeAll()
        tableView.registerNib(UINib(nibName: "PeripheralCell", bundle: nil), forCellReuseIdentifier: "PeripheralCell")
        
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "stopScan", userInfo: nil, repeats: false)
        btCentralManager.scanForPeripheralsWithServices(nil, options: nil)
    }
    
    func stopScan() {
        btCentralManager.stopScan()
        bbRefresh.enabled = true
        tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        btCentralManager.delegate = self
        if selectedPeripheral != nil {
            btCentralManager.cancelPeripheralConnection(selectedPeripheral!)
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: PeripheralCell = tableView.dequeueReusableCellWithIdentifier("PeripheralCell") as! PeripheralCell
        cell.lbConntable.text = btConnectable[indexPath.row].description
        cell.lbName.text = btPeripherals[indexPath.row].name
        cell.lbRSSI.text = btRSSIs[indexPath.row].description
        cell.lbUUID.text = btPeripherals[indexPath.row].identifier.UUIDString
        cell.accessoryType = .DisclosureIndicator
        return cell

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier("sgToServiceList", sender: indexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let targetVC = segue.destinationViewController as! ViewController2
        targetVC.centralManger = self.btCentralManager
        selectedPeripheral = btPeripherals[sender as! Int]
        targetVC.peripheral = selectedPeripheral
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130.5
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return btPeripherals.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btCentralManager = CBCentralManager(delegate: self, queue: nil)
        tableView.registerNib(UINib(nibName: "PeripheralCell", bundle: nil), forCellReuseIdentifier: "PeripheralCell")
    }
    

    func centralManagerDidUpdateState(central: CBCentralManager) {
        print(central.state)
    }
    
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        let temp = btPeripherals.filter { (pl) -> Bool in
            return pl.identifier.UUIDString == peripheral.identifier.UUIDString
        }
        
        if temp.count == 0 {
            btPeripherals.append(peripheral)
            btRSSIs.append(RSSI)
            btConnectable.append(Int(advertisementData[CBAdvertisementDataIsConnectable]!.description)!)
        }
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


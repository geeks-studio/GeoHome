//
//  ShopViewController.swift
//  GeoHome
//
//  Created by Vadim Drobinin on 26/5/16.
//  Copyright © 2016 Vadim Drobinin. All rights reserved.
//

import UIKit
import CoreLocation

extension ActiveScenariosViewController: CLLocationManagerDelegate {
  func locationManager(manager: CLLocationManager, monitoringDidFailForRegion region: CLRegion?, withError error: NSError) {
    print("Failed monitoring region: \(error.description)")
  }
  
  func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    print("Location manager failed: \(error.description)")
  }
  
  func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
    for beacon in beacons {
      let beaconMinor = beacon.major.integerValue
      let beaconIsClose = beacon.proximity == .Near
      if beaconIsClose {
        self.beacons[beaconMinor]!["count"] = (self.beacons[beaconMinor]!["count"] as! Int) + 1
        if (self.beacons[beaconMinor]!["count"] as! Int) > 10 { // подгоном
          self.textViewLog.text = self.textViewLog.text + self.getTimestamp() + " " + (self.beacons[beaconMinor]!["url"] as! String) + "\n"
          self.beacons[beaconMinor]!["count"] = 0
        }
      }
    }
  }
  
  func beaconRegionWithItem() -> CLBeaconRegion {
    let beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "EBEFD083-70A2-47C8-9837-E7B5634DF524")!, identifier: "ruBeacon")
    return beaconRegion
  }
  
  func searchForBeacons() {
    locationManager.requestAlwaysAuthorization()
    let beaconRegion = beaconRegionWithItem()
    locationManager.startMonitoringForRegion(beaconRegion)
    locationManager.startRangingBeaconsInRegion(beaconRegion)
  }
}

extension ActiveScenariosViewController {
  func getTimestamp() -> String {
    let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .ShortStyle)
    return timestamp
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "Show Detailed Scenario" {
      let scenario = sender as! Scenario
      let vc = segue.destinationViewController as! DetailedScenarioViewController
      vc.scenario = scenario
    }
  }
}

extension ActiveScenariosViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 80.0
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    performSegueWithIdentifier("Show Detailed Scenario", sender: data[indexPath.row])
  }
}

extension ActiveScenariosViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("shopCell") as! ShopCell
    cell.triggerNameLabel.text = data[indexPath.row].trigger.name
    cell.actionNameLabel.text = data[indexPath.row].action.name
    cell.priceLabel.text = "✅"
    return cell
  }
}

class ActiveScenariosViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  let locationManager = CLLocationManager()
  var beacons: [Int: [String: AnyObject]] = [1: ["count": 0, "url": "/api/openWindows"],
                                             2: ["count": 0, "url": "/api/lightsOff"],
                                             3: ["count": 0, "url": "/api/disablePower"]]
  @IBOutlet weak var textViewLog: UITextView! {
    didSet {
      textViewLog.text = getTimestamp() + " Initializing...\n"
      textViewLog.text = textViewLog.text + getTimestamp() + " Connecting with the server...\n"
      textViewLog.text = textViewLog.text + getTimestamp() + " Server successfuly connected.\n"
    }
  }
  
  var data = [Scenario]()
  
  func populateWithDemoData() {
    var trigger = Trigger(name: "Come to the door", description: "Владелец телефона подошел ко входной двери", apiUrl: "demo/closeToExit")
    var action = Action(name: "Lights off", description: "Выключает весь свет в квартире", apiUrl: "demo/lightsOff")
    var scenario = Scenario(name: "Lights off", trigger: trigger, action: action)
    data.append(scenario)
    
    trigger = Trigger(name: "Food expired", description: "Холодильник не содержит продуктов выбранной категори", apiUrl: "demo/foodExpired")
    action = Action(name: "Order new food", description: "На сайте ABC заказывается заранее определенная корзина продуктов", apiUrl: "demo/orderFood")
    scenario = Scenario(name: "Do groceries", trigger: trigger, action: action)
    data.append(scenario)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    let nib = UINib(nibName: "ShopCell", bundle: nil)
    tableView.registerNib(nib, forCellReuseIdentifier: "shopCell")
    locationManager.delegate = self
    populateWithDemoData()
    searchForBeacons()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

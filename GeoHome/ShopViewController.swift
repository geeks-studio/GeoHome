//
//  ShopViewController.swift
//  GeoHome
//
//  Created by Vadim Drobinin on 26/5/16.
//  Copyright © 2016 Vadim Drobinin. All rights reserved.
//

import UIKit

extension ShopViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 80.0
  }
}

extension ShopViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("shopCell") as! ShopCell
    cell.triggerNameLabel.text = data[indexPath.row].trigger.name
    cell.actionNameLabel.text = data[indexPath.row].action.name
    cell.priceLabel.text = "0.99$"
    return cell
  }
}

class ShopViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var data = [Scenario]()
  
  func populateWithDemoData() {
    var trigger = Trigger(name: "Night starts", description: "Наступило 23:00", apiUrl: "demo/isNight")
    var action = Action(name: "Open windows", description: "Переводит все окна в режим проветривания", apiUrl: "demo/openWindowsForVentilation")
    var scenario = Scenario(name: "Open windows for the night", trigger: trigger, action: action)
    data.append(scenario)
    
    trigger = Trigger(name: "Morning starts", description: "Наступило 08:00", apiUrl: "demo/isMorning")
    action = Action(name: "Open curtains", description: "Поднять жалюзи на всех окнах", apiUrl: "demo/openAllCurtains")
    scenario = Scenario(name: "Open curtains", trigger: trigger, action: action)
    data.append(scenario)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    let nib = UINib(nibName: "ShopCell", bundle: nil)
    tableView.registerNib(nib, forCellReuseIdentifier: "shopCell")
    
    populateWithDemoData()
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

}

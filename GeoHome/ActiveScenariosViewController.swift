//
//  ShopViewController.swift
//  GeoHome
//
//  Created by Vadim Drobinin on 26/5/16.
//  Copyright © 2016 Vadim Drobinin. All rights reserved.
//

import UIKit

extension ActiveScenariosViewController {
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
    
    populateWithDemoData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

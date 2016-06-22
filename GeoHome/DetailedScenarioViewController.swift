//
//  DetailedScenarioViewController.swift
//  GeoHome
//
//  Created by Vadim Drobinin on 26/5/16.
//  Copyright © 2016 Vadim Drobinin. All rights reserved.
//

import UIKit

class DetailedScenarioViewController: UIViewController {

  @IBOutlet weak var triggerNameLabel: UILabel!
  @IBOutlet weak var actionNameLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  
  @IBOutlet weak var changeStatusButton: UIButton!
  @IBOutlet weak var updateInfoButton: UIButton!
  
  var scenario: Scenario?
  
  
  
  @IBOutlet weak var tableView: UITableView! {
    didSet {
      tableView.hidden = true
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    triggerNameLabel?.text = scenario?.trigger.name
    actionNameLabel?.text = scenario?.action.name
    statusLabel?.text = "Enabled"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

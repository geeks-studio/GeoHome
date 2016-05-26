//
//  Scenario.swift
//  GeoHome
//
//  Created by Vadim Drobinin on 26/5/16.
//  Copyright © 2016 Vadim Drobinin. All rights reserved.
//

import Foundation

class Scenario {
  class func getId() -> String {
    return "42"
  }
  
  var name: String
  let id: String
  
  let trigger: Trigger
  let action: Action
  
  init(name: String, trigger: Trigger, action: Action) {
    self.name = name
    self.trigger = trigger
    self.action = action
    self.id = Scenario.getId()
  }
}
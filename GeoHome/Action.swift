//
//  Action.swift
//  GeoHome
//
//  Created by Vadim Drobinin on 26/5/16.
//  Copyright © 2016 Vadim Drobinin. All rights reserved.
//

import Foundation

class Action {
  
  class func getId() -> String {
    return "42"
  }
  
  let id: String
  var name: String
  var description: String
  var apiUrl: String
  
  init(name: String, description: String, apiUrl: String) {
    self.name = name
    self.description = description
    self.apiUrl = apiUrl
    
    self.id = Action.getId()
  }
}
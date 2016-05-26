//
//  User.swift
//  GeoHome
//
//  Created by Vadim Drobinin on 26/5/16.
//  Copyright © 2016 Vadim Drobinin. All rights reserved.
//

import Foundation

enum Role {
  case Admin, Member, Guest
}

class User {
  var name: String
  var role: Role
  var scenarios: [Scenario]
  
  init(name: String, role: Role) {
    self.name = name
    self.role = role
    
    scenarios = []
  }
}
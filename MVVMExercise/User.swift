//  Created by Roman Cebula on 10/02/2020.
//  Copyright © 2020 Roman Cebula. All rights reserved.

import UIKit

struct User {
  var name: String
  var age: Int
  var backgroundColor: UIColor
  
  init(name: String, age: Int, backgroundColor: UIColor) {
    self.name = name
    self.age = age
    self.backgroundColor = backgroundColor
  }
}

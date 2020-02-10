//  Created by Roman Cebula on 10/02/2020.
//  Copyright © 2020 Roman Cebula. All rights reserved.

import Foundation

class DispatchQueueHelper {
  
  init() {}
  
  public static func delay(bySeconds seconds: Double, dispatchLevel: DispatchLevel = .main, completion: @escaping () -> ()) {
    let dispatchTime = DispatchTime.now() + seconds
    dispatchLevel.dispatchQueue.asyncAfter(deadline: dispatchTime, execute: completion)
  }
}

public enum DispatchLevel{
  case main, userInteractive, userInitited, utility, background
  var dispatchQueue: DispatchQueue {
    switch self{
    case .main:
      return DispatchQueue.main
    case .userInteractive:
      return DispatchQueue.global(qos: .userInteractive)
    case .userInitited:
      return DispatchQueue.global(qos: .userInitiated)
    case .utility:
      return DispatchQueue.global(qos: .utility)
    case .background:
      return DispatchQueue.global(qos: .background)
    }
  }
}

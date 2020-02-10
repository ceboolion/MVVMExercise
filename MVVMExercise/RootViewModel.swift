//  Created by Roman Cebula on 10/02/2020.
//  Copyright © 2020 Roman Cebula. All rights reserved.

import Foundation

protocol RootViewModelDelegate {
  func didStartFetchingMessage(_ message: String?)
  func didFinishFetchingMessage(_ message: String?)
}

class RootViewModel {
  
  var rootViewModelDelegate: RootViewModelDelegate?
  
  let user: User
  
  init(user: User) {
    self.user = user
  }
  
  func fetchMessage(){
    rootViewModelDelegate?.didStartFetchingMessage("Fetching...")
    DispatchQueueHelper.delay(bySeconds: 3.0, dispatchLevel: .background) {
      var message: String? = "Hello there"
      if message == nil {
        message = "Failed to fetch message from server"
      }
      DispatchQueueHelper.delay(bySeconds: 0.0, completion: {
        self.rootViewModelDelegate?.didFinishFetchingMessage(message)
      })
    }
  }
}

//  Created by Roman Cebula on 10/02/2020.
//  Copyright © 2020 Roman Cebula. All rights reserved.

import UIKit
import SnapKit

class RootViewController: UIViewController {
  
  var viewModel: RootViewModel! {
    didSet{
      view.backgroundColor = self.viewModel.user.backgroundColor
      navigationItem.title = "\(self.viewModel.user.name), \(self.viewModel.user.age)"
    }
  }
  
  lazy var label: UILabel = {
    let label = UILabel()
    label.text = "Tap 'Fetch' to retrieve the message"
    label.textColor = .black
    return label
  }()
  
  lazy var activityIndicator: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView()
    return indicator
  }()
  

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupNavigation()
    let user = User(name: "Roman", age: 39, backgroundColor: .white)
    viewModel = RootViewModel(user: user)
  }
  
  fileprivate func setupNavigation(){
//    navigationItem.title = "Roman, 39"
    let resetBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetBarButtonTapped))
    let fetchBarButtonItem = UIBarButtonItem(title: "Fetch", style: .done, target: self, action: #selector(fetchBarButtonTapped))
    
    navigationItem.setLeftBarButton(resetBarButtonItem, animated: false)
    navigationItem.setRightBarButton(fetchBarButtonItem, animated: false)
  }
  
  @objc fileprivate func resetBarButtonTapped() {
    label.text = "Tap 'Fetch' to retrieve the message"
  }

  @objc fileprivate func fetchBarButtonTapped() {
    
  }
  
  private func setupViews() {
    view.backgroundColor = .systemGray
    view.addSubview(label)
    view.addSubview(activityIndicator)
    
    label.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }
    activityIndicator.snp.makeConstraints { (make) in
      make.top.equalTo(label).offset(5)
      make.centerX.equalToSuperview()
    }
  }

}


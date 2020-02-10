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
    viewModel.rootViewModelDelegate = self
  }
  
  fileprivate func setupNavigation(){
    let resetBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetBarButtonTapped))
    let fetchBarButtonItem = UIBarButtonItem(title: "Fetch", style: .done, target: self, action: #selector(fetchBarButtonTapped))
    
    navigationItem.setLeftBarButton(resetBarButtonItem, animated: false)
    navigationItem.setRightBarButton(fetchBarButtonItem, animated: false)
  }
  
  @objc fileprivate func resetBarButtonTapped() {
    label.text = "Tap 'Fetch' to retrieve the message"
  }

  @objc fileprivate func fetchBarButtonTapped() {
    viewModel.fetchMessage()
  }
  
  private func setupViews() {
    view.backgroundColor = .systemGray
    view.addSubview(label)
    view.addSubview(activityIndicator)
    
    label.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
    }
    activityIndicator.snp.makeConstraints { (make) in
      make.top.equalTo(label).offset(25)
      make.centerX.equalToSuperview()
    }
  }
}

extension RootViewController: RootViewModelDelegate {
  func didStartFetchingMessage(_ message: String?) {
    label.text = message
    activityIndicator.startAnimating()
  }
  func didFinishFetchingMessage(_ message: String?) {
    label.text = message
    activityIndicator.stopAnimating()
  }
}


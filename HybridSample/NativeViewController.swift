//
//  NativeViewController.swift
//  HybridSample
//
//  Created by shoji on 2018/04/09.
//  Copyright © 2018年 shoji fujita. All rights reserved.
//

import UIKit

protocol NativeViewControllerDelegate: class {
  func tappedButton(type: NativeViewController.ButtonType)
}

/// ネイティブ画面
final class NativeViewController: UIViewController {
  weak var delegate: NativeViewControllerDelegate?
  
  enum ButtonType: String {
    case home     = "ホーム画面"
    case setting  = "設定画面"
  }
  
  @IBAction func tappedHomeButton(_ sender: UIButton) {
    dismiss(animated: true, completion: {
      self.delegate?.tappedButton(type: .home)
    })
  }
  
  @IBAction func tappedSettingButton(_ sender: UIButton) {
    dismiss(animated: true, completion: {
      self.delegate?.tappedButton(type: .setting)
    })
  }
}

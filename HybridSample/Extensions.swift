//
//  Extensions.swift
//  HybridSample
//
//  Created by shoji on 2018/04/09.
//  Copyright © 2018年 shoji fujita. All rights reserved.
//

import UIKit

//MARK:- UIViewController
extension UIViewController {
  /// storyboardと繋げて初期化（自身のクラス名とstoryboardのファイル名が同じでinitialの指定が必須）
  static func instance<T: UIViewController>() -> T {
    let st = UIStoryboard(name: self.className, bundle: nil)
    let vc = st.instantiateInitialViewController() as? T
    assert(vc != nil, "\(self.className)を確認してください")
    return vc!
  }
}

//MARK:- NSObject
extension NSObject {
  /// クラス名
  static var className: String {
    return String(describing: self)
  }
}

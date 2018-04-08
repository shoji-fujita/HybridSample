//
//  WebViewController.swift
//  HybridSample
//
//  Created by shoji on 2018/04/09.
//  Copyright © 2018年 shoji fujita. All rights reserved.
//

import WebKit

/// WebView画面
final class WebViewController: UIViewController {
  fileprivate var webView: WKWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupWebView()
  }
}

//MARK:- private
private extension WebViewController {
  func setupWebView() {
    let config = WKWebViewConfiguration()
    let userController = WKUserContentController()
    userController.add(self, name: "callbackHandler")
    config.userContentController = userController
    webView = WKWebView(frame: self.view.bounds, configuration: config)
    self.view.addSubview(webView)
    
    let path = Bundle.main.path(forResource: "index", ofType: "html")!
    let localHtmlUrl = URL(fileURLWithPath: path, isDirectory: false)
    webView.loadFileURL(localHtmlUrl, allowingReadAccessTo: localHtmlUrl)
  }
}

//MARK:- WKScriptMessageHandler
extension WebViewController: WKScriptMessageHandler {
  // WebView → ネイティブ
  func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
    let vc: NativeViewController = NativeViewController.instance()
    vc.delegate = self
    present(vc, animated: true, completion: nil)
  }
}

//MARK:- NativeViewControllerDelegate
extension WebViewController: NativeViewControllerDelegate {
  func tappedButton(type: NativeViewController.ButtonType) {
    // ネイティブ → WebView
    let text = "This is \(type.rawValue)"
    let jsFunc = "changeDisplay(\"\(text)\");"
    webView.evaluateJavaScript(jsFunc, completionHandler: nil)
  }
}

//
//  FavoritedViewController.swift
//  M-News
//
//  Created by Julius on 14/04/2021.
//

import UIKit

import WebKit

class FavoritedViewController: UIViewController {
    
    lazy var savedArticle: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    var website: News?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupUI()
        loadWebsite()
        
        /*let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        savedArticle.load(myRequest)*/
    }
    
    // MARK: Helper function
    func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(savedArticle)
        
        NSLayoutConstraint.activate([
            savedArticle.topAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            savedArticle.leftAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            savedArticle.bottomAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            savedArticle.rightAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    func loadWebsite() {
        if let url = URL(string: website?.urlWebsite ?? "") {
            let request = URLRequest(url: url)
            savedArticle.load(request)
            
        }
    }
}

//MARK: webview delegate
extension FavoritedViewController: WKUIDelegate {
    
}

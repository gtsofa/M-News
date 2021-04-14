//
//  ArticleViewController.swift
//  M-News
//
//  Created by Julius on 14/04/2021.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {
    
    // MARK: Properties
    lazy var articlePage: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
 
    
    weak var website: ArticlesData?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        if let url = URL(string: website?.unwrappedUrlWebsite ?? "") {
            let request = URLRequest(url: url)
            articlePage.load(request)
            
        }
    }
    
    // MARK: Helper function
    func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(articlePage)
        
        NSLayoutConstraint.activate([
            articlePage.topAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            articlePage.leftAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            articlePage.bottomAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            articlePage.rightAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}

// MARK: webview delegate
extension ArticleViewController: WKUIDelegate {
    
}

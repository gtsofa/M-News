//
//  NewsTableViewCell.swift
//  M-News
//
//  Created by Julius on 08/04/2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    
    var authorName: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var headLine: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var timePublication: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var newsImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        return iv
    }()
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //selectionStyle = .none
        self.contentView.addSubview(newsImage)
        containerView.addSubview(authorName)
        containerView.addSubview(headLine)
        containerView.addSubview(timePublication)
        self.contentView.addSubview(containerView)
        
        //addSubview(newsImage)
        //addSubview(authorName)
        //newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        newsImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        newsImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        newsImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.newsImage.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        authorName.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        authorName.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        authorName.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        
        headLine.topAnchor.constraint(equalTo: self.authorName.bottomAnchor).isActive = true
        headLine.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        headLine.heightAnchor.constraint(equalToConstant: 50).isActive = true
        headLine.widthAnchor.constraint(equalToConstant: 230).isActive = true
        
        timePublication.topAnchor.constraint(equalTo: self.headLine.bottomAnchor, constant: 30).isActive = true
        timePublication.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        //timePublication.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //timePublication.widthAnchor.constraint(equalToConstant: 230).isActive = true
        
        //headLine.topAnchor.constraint(equalTo: authorName.bot)
        
        
        /*
        newsImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        newsImage.heightAnchor.constraint(equalToConstant: 130).isActive = true
        newsImage.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        authorName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        authorName.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        authorName.leftAnchor.constraint(equalTo: newsImage.rightAnchor, constant: 12).isActive = true
        */
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


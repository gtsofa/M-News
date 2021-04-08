//
//  HeaderView.swift
//  M-News
//
//  Created by Julius on 07/04/2021.
//

import UIKit

final class HeaderView: UIView {
    private var fontSize: CGFloat
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "News"
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        return label
    }()
    
    private lazy var headerCircleImage: UIImageView = {
        let imagev = UIImageView()
        imagev.translatesAutoresizingMaskIntoConstraints = false
        imagev.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        imagev.image = UIImage(systemName: "largecircle.fill.circle", withConfiguration: config)
        return imagev
    }()
    
    private lazy var plusImage: UIImageView = {
        let imagev = UIImageView()
        imagev.translatesAutoresizingMaskIntoConstraints = false
        imagev.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        imagev.image = UIImage(systemName: "plus", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return imagev
    }()
    
    private lazy var subheadlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(fontSize)
        label.text = "Top Headlines"
        label.textColor = .gray
        return label
    }()
    
    private lazy var headerStackView: UIStackView = {
        let v = UIStackView(arrangedSubviews: [headerCircleImage, headingLabel, plusImage])
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        return v
    }()
    
    init(fontSize: CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(headerStackView)
        addSubview(subheadlineLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        //news header
        NSLayoutConstraint.activate([
                                        headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                        headerStackView.topAnchor.constraint(equalTo: topAnchor)])
        // subheadline
        NSLayoutConstraint.activate([
                                        subheadlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                                        subheadlineLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8),
                                        subheadlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
    }
}

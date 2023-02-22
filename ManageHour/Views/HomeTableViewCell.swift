//
//  TableViewCell.swift
//  ManageHour
//
//  Created by Timur Mannapov on 22.02.2023.
//

import Foundation
import UIKit

final class HomeTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    static let identifier = "homeTableViewCell"
    
    private let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "book.closed")
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .black
        label.text = "Чтение"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "plus.app.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.tintColor = .systemPink
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(background)
        contentView.addSubview(customImageView)
        contentView.addSubview(label)
        contentView.addSubview(button)
        
        setConstraints()
        backgroundColor = .systemGray5
//        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setConstraints
    private func setConstraints() {
        
        let buttonConstraints = [
            button.topAnchor.constraint(equalTo: contentView.readableContentGuide.topAnchor, constant: 20),
            button.bottomAnchor.constraint(equalTo: contentView.readableContentGuide.bottomAnchor, constant:  -10),
            button.trailingAnchor.constraint(equalTo: contentView.readableContentGuide.trailingAnchor, constant: -5),
            button.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        let labelConstraints = [
            
            label.topAnchor.constraint(equalTo: contentView.readableContentGuide.topAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: contentView.readableContentGuide.bottomAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -20)
        ]
        
        let imageViewConstraints = [
//            customImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customImageView.topAnchor.constraint(equalTo: contentView.readableContentGuide.topAnchor, constant: 20),
            customImageView.bottomAnchor.constraint(equalTo: contentView.readableContentGuide.bottomAnchor, constant: -10),
            customImageView.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        let backgroundConstraints = [
            background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            background.leadingAnchor.constraint(equalTo: contentView.readableContentGuide.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: contentView.readableContentGuide.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ]

        NSLayoutConstraint.activate(backgroundConstraints)
        NSLayoutConstraint.activate(imageViewConstraints)
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(buttonConstraints)
    }
}

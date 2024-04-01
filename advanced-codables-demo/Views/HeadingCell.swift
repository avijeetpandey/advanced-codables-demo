//
//  HeadingCell.swift
//  advanced-codables-demo
//
//  Created by Avijeet on 01/04/24.
//

import UIKit

// MARK: - HeadingCell
class HeadingCell: UITableViewCell {
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
     static let reuseIdentifier: String = "HeadingCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    func configure(model: Heading) {
        headingLabel.text = model.text
        headingLabel.font = .systemFont(ofSize: CGFloat(model.size))
    }
    
    private func configureUI() {
        contentView.addSubview(headingLabel)
        backgroundColor = .yellow
        
        NSLayoutConstraint.activate([
            headingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headingLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            headingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

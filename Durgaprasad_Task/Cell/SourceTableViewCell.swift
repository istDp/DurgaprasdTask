//
//  SourceTableViewCell.swift

//

import Foundation
import UIKit





class CustomTableViewCell: UITableViewCell  {
    
    let nameLabel = UILabel()
    let detailLabel = UILabel()
     var userImage = UIImageView()
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        // configure titleLabel
        contentView.addSubview(userImage)

        //Header = 20 from left edge of screen
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 4).isActive = true
//        userImage.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 10).isActive = true
        
        let verticalConstraint = userImage.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor)
        let widthConstraint = userImage.widthAnchor.constraint(equalToConstant: 60)
        let heightConstraint = userImage.heightAnchor.constraint(equalToConstant: 60)

        contentView.addConstraints([heightConstraint, widthConstraint, heightConstraint,verticalConstraint])
        
        // configure Description TitleLabel

        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant:  100).isActive = true
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 21)
        
        // configure Description label
        contentView.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant:  100).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont(name: "Avenir-Book", size: 16)
        detailLabel.textColor = UIColor.darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        userImage.backgroundColor = UIColor.red
        userImage.layer.cornerRadius = 30
        userImage.clipsToBounds = true
    }
}

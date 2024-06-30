//
//  ImageLabelTableViewCell.swift
//  UITableViewStoryBoardWithMultipleCustomSectionCell
//
//  Created by Abdul Hafiz Ramadan on 30/06/24.
//

import UIKit

class ImageLabelTableViewCell: UITableViewCell {
    
    static let identifier = "ImageLabelTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        myImage.contentMode = .scaleAspectFit
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configure(labelTitle: String, imageName: String) {
        myLabel.text = labelTitle
        myImage.image = UIImage(systemName: imageName)
    }
}

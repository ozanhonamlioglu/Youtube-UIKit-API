//
//  StoryCell.swift
//  Youtube-UIKit-API
//
//  Created by ozy on 30.08.2021.
//

import UIKit
import Kingfisher

class StoryCell: UICollectionViewCell {
    
    // MARK: - OUTLETS
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var shortContent: UILabel!
    @IBOutlet weak var viewCount: UILabel!
    
    // MARK: - VARIABLES
    var data: ShortsData? {
        didSet {
            let mData = data!
            let url = URL(string: mData.preiewImage)
            previewImage.kf.setImage(with: url)
            shortContent.text = mData.content
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        setup()
    }
    
    // MARK: - HANDLERS
    private func setup() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = previewImage.bounds
        
        gradientLayer.colors = [
            UIColor.black.withAlphaComponent(0.8).cgColor,
            UIColor.black.withAlphaComponent(0).cgColor
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.30)
        
        previewImage.layer.insertSublayer(gradientLayer, at: 0)
        
    }

}

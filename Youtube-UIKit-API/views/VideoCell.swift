
//  VideoTableViewCell.swift
//  Youtube-UIKit-API
//
//  Created by ozy on 19.08.2021.
//

import UIKit
import Kingfisher

class VideoCell: UITableViewCell {
    
    // MARK: - OUTLETS
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var descriptionContent: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var previewImage: UIImageView!
    
    // MARK: - VARIABLES
    var data: MainModel? {
        didSet {
            descriptionContent.text = data?.description
            let previewUrl = URL(string: data!.preiewImage!)
            previewImage.kf.setImage(with: previewUrl)
            
            let profileUrl = URL(string: data!.channelImage!)
            profilePicture.kf.setImage(with: profileUrl)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupUI()
    }

    // MARK: - HANDLERS
    private func setupUI() {
        profilePicture.layer.cornerRadius = 30
        
        moreButton.setImage(UIImage(named: "more"), for: .normal)
        moreButton.tintColor = .darkGray
    }
    
}

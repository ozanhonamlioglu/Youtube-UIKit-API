//
//  VideoTableViewCell.swift
//  Youtube-UIKit-API
//
//  Created by ozy on 19.08.2021.
//

import UIKit

class VideoCell: UITableViewCell {
    
    // MARK: - OUTLETS
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var duration: UIView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionContent: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    // MARK: - VARIABLES
    var data: MainModel? {
        willSet {
            descriptionContent.text = newValue?.description
            durationLabel.text = newValue?.duration
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
        duration.layer.cornerRadius = 5
        moreButton.setImage(UIImage(named: "more"), for: .normal)
        moreButton.tintColor = .darkGray
    }
    
}

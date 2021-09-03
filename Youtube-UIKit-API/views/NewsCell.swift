//
//  NewsCellTableViewCell.swift
//  Youtube-UIKit-API
//
//  Created by ozy on 23.08.2021.
//

import UIKit

class NewsCell: UITableViewCell {
    
    // MARK: - OUTLETS
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setup()
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
    // MARK: - HANDLERS
    
    private func setup() {
        profilePicture.layer.cornerRadius = 20
        moreButton.setImage(UIImage(named: "more"), for: .normal)
        moreButton.tintColor = .darkGray
    }
    
}

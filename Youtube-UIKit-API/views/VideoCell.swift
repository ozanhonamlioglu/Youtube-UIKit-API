
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
    
    func setupDurationLabel() {
        let v = previewImage.viewWithTag(1)
        
        if(v == nil) {
            let holder = UIView()
            holder.tag = 1
            holder.backgroundColor = .black
            holder.layer.cornerRadius = 3
            holder.translatesAutoresizingMaskIntoConstraints = false
            
            let label = UILabel()
            label.text = data?.duration
            label.font = UIFont(name: "AvenirNext-Medium", size: 12)
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            
            previewImage.addSubview(holder)
            holder.addSubview(label)
            
            let width_of_duration_string = data!.duration!.widthOfString(usingFont: UIFont(name: "AvenirNext-Medium", size: 13)!)
            
            NSLayoutConstraint.activate([
                holder.bottomAnchor.constraint(equalTo: previewImage.bottomAnchor, constant: -5),
                holder.rightAnchor.constraint(equalTo: previewImage.rightAnchor, constant: -5),
                holder.widthAnchor.constraint(equalToConstant: CGFloat(width_of_duration_string) + 5),
                holder.heightAnchor.constraint(equalToConstant: 19),
                label.centerXAnchor.constraint(equalTo: holder.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: holder.centerYAnchor)
            ])
        }

    }

    
}

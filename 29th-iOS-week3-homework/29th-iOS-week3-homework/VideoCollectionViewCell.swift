//
//  VideoCollectionViewCell.swift
//  29th-iOS-week3-homework
//
//  Created by 임주민 on 2021/10/29.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VideoCollectionViewCell"
    
    @IBOutlet weak var youtuberNameLabel: UILabel!
    @IBOutlet weak var youtuberImageView: UIImageView!
    
    func setData(youtuberData: YoutuberData) {
        youtuberImageView.image = youtuberData.makeYoutuberImage()
        youtuberNameLabel.text = youtuberData.youtuberName
    }
    
}

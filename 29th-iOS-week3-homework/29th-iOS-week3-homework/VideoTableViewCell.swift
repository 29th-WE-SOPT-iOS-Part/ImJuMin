//
//  VideoTableViewCell.swift
//  29th-iOS-week3-homework
//
//  Created by 임주민 on 2021/10/29.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    static let identifier = "VideoTableViewCell"

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setText()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(videoData: VideoContentData) {
        titleLabel.text = videoData.videoName
        subTitleLabel.text = videoData.description
    }
    
}

extension VideoTableViewCell {
     func setText() {
         titleLabel.font = UIFont(name: "SFProDisplay-Regular", size: 15)
         subTitleLabel.font = UIFont(name: "SFProDisplay-Regular", size: 13)
         
         titleLabel.numberOfLines = 0
         subTitleLabel.numberOfLines = 0
         
         subTitleLabel.textColor = UIColor(red: 0.376, green: 0.376, blue: 0.376, alpha: 1)
     }
 }

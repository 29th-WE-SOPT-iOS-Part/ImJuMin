//
//  VideoTableViewCell.swift
//  29th-iOS-week3-homework
//
//  Created by 임주민 on 2021/10/29.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
  
  // MARK: - UI Component Part
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subTitleLabel: UILabel!
  
  // MARK: - Life Cycle Part
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setText()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  // MARK: - Custom Method Part
  
  func setData(videoData: VideoContentData) {
    titleLabel.text = videoData.videoName
    subTitleLabel.text = videoData.description
  }
}

// MARK: - Extension Part

extension VideoTableViewCell {
  func setText() {
    //titleLabel.font = UIFont.SFProDiplay(size: 14)
    //subTitleLabel.font =  UIFont.SFProDiplay(size: 13)
    subTitleLabel.textColor = .gray
    
    titleLabel.numberOfLines = 0
    subTitleLabel.numberOfLines = 0
  }
}

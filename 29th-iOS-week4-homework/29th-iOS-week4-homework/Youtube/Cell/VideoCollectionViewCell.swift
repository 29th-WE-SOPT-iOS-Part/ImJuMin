//
//  VideoCollectionViewCell.swift
//  29th-iOS-week3-homework
//
//  Created by 임주민 on 2021/10/29.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
  
  // MARK: - UI Component Part
  
  @IBOutlet weak var youtuberNameLabel: UILabel!
  @IBOutlet weak var youtuberImageView: UIImageView!
  
  // MARK: - Life Cycle
  override func awakeFromNib() {
    super.awakeFromNib()
    setText()
  }
  
  // MARK: - Custom Method Part
  
  func setData(youtuberData: YoutuberData) {
    youtuberImageView.image = youtuberData.makeYoutuberImage()
    youtuberNameLabel.text = youtuberData.youtuberName
  }
  
  func setText() {
    youtuberNameLabel.textColor = .gray
  }
}

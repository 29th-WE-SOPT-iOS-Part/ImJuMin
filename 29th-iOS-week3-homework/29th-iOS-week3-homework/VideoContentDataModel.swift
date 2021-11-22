//
//  VideoContentDataModel.swift
//  29th-iOS-week3-homework
//
//  Created by 임주민 on 2021/10/29.
//

import UIKit

struct VideoContentData{
    let videoName: String
    let description: String
}

struct YoutuberData {
     let youtuberName: String
     let youtuberImageName: String

     func makeYoutuberImage() -> UIImage? {
         return UIImage(named: youtuberImageName)
     }
 }

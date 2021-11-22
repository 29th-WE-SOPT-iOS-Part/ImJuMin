//
//  UIFont+.swift
//  29th-iOS-week4-homework
//
//  Created by 임주민 on 2021/11/22.
//

import UIKit

extension UIFont {
  
  // MARK: - SF-Pro-Display-Regular Font
  
  
  class var head1: UIFont {
    return UIFont(name: "SF-Pro-Display-Regular", size: 15.0)!
  }
  class func SFProDiplay(size: CGFloat) -> UIFont {
       return UIFont(name: "SF-Pro-Display-Regular", size: size)!
  }
  
}


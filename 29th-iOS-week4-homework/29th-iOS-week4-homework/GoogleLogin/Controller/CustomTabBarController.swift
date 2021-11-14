//
//  CustomTabBarController.swift
//  29th-iOS-week2-homework
//
//  Created by 임주민 on 2021/10/19.
//

import UIKit

class CustomTabBarController: UITabBarController {

   // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
      super.viewDidLoad()
      setTabBar()
      self.tabBar.tintColor = .black
      self.tabBar.unselectedItemTintColor = .gray
    }
    
    // MARK: - Custom Method Part
    
    func setTabBar() {
      guard let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeVC"),
        let shortsVC = self.storyboard?.instantiateViewController(identifier: "ShortsVC"),
        let plusVC = self.storyboard?.instantiateViewController(identifier: "PlusVC"),
        let subscriptionVC = self.storyboard?.instantiateViewController(identifier: "SubscriptionVC"),
        let libraryVC = self.storyboard?.instantiateViewController(identifier: "LibraryVC")
      else {return}
        
      homeVC.tabBarItem.title="홈"
      homeVC.tabBarItem.image=UIImage(named: "homeIconFill")
      homeVC.tabBarItem.selectedImage = UIImage(named: "homeIcon")
      shortsVC.tabBarItem.title="shorts"
      shortsVC.tabBarItem.image=UIImage(named: "shortsIcon")
      shortsVC.tabBarItem.selectedImage=UIImage(named: "shortsIconFill")
      plusVC.tabBarItem.title="추가"
      plusVC.tabBarItem.image=UIImage(named: "plueCircleIcon")
      plusVC.tabBarItem.selectedImage=UIImage(named: "plueCircleIcon")
      subscriptionVC.tabBarItem.title="구독"
      subscriptionVC.tabBarItem.image=UIImage(named: "subscriptionsIcon")
      subscriptionVC.tabBarItem.selectedImage=UIImage(named: "subscriptionIconsFill")
      libraryVC.tabBarItem.title="저장"
      libraryVC.tabBarItem.image=UIImage(named: "LibraryIcon")
      libraryVC.tabBarItem.selectedImage=UIImage(named: "LibraryIconFill")
        
      setViewControllers([homeVC, shortsVC, plusVC, subscriptionVC, libraryVC], animated: true)
    }
}

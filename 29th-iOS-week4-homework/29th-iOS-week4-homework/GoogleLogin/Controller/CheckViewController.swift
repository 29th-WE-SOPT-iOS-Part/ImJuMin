//
//  CheckViewController.swift
//  29th-iOS-week2-homework
//
//  Created by 임주민 on 2021/10/20.
//

import UIKit

class CheckViewController: UIViewController {

    // MARK: - Vars & Lets Part
    
    var message: String?
    
    // MARK: - UI Component Part
    
    @IBOutlet weak var showNameLabel: UILabel!
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
      super.viewDidLoad()
      setNameInLabel()
    }
    
    // MARK: - IBAction Part
    
    @IBAction func touchUpOkayButton(_ sender: Any) {
      guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController
      else {return}
        
      nextVC.modalPresentationStyle = .fullScreen
      nextVC.modalTransitionStyle = .crossDissolve
        
      self.present(nextVC, animated: true, completion: nil)
    }
    
    // MARK: - Custom Method Part
    
    func setNameInLabel() {
      if let name = message {
        showNameLabel.text = "\(name)님\n환영합니다!"
        showNameLabel.sizeToFit()
      }
    }
}

//
//  JoinViewController.swift
//  29th-iOS-week1-homework
//
//  Created by 임주민 on 2021/10/06.
//
// 회원가입화면

import UIKit

class JoinViewController: UIViewController {

    //MARK: - @IBOutlet
    @IBOutlet weak var enterNameJoin: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func touchUpToGoCheckViewFromJoin(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier:"CheckViewController") as? CheckViewController else {return}
        
        nextVC.message = enterNameJoin.text
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        
        self.present(nextVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.backgroundColor = UIColor(displayP3Red: 66/255, green: 133/255, blue: 244/255, alpha: 1)
        nextButton.layer.cornerRadius = 10
        nextButton.setTitleColor(UIColor.white, for: .normal)
    }
    
}

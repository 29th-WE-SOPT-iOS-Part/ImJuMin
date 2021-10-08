//
//  ViewController.swift
//  29th-iOS-week1-homework
//
//  Created by 임주민 on 2021/10/06.
//
// 로그인 화면

import UIKit

class ViewController: UIViewController {

    //MARK: - @IBOutlet
    @IBOutlet weak var enterNameLogin: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
   
    @IBAction func createAccount(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinViewController") else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBAction func touchUpToGoCheckViewFromLogin(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier:"CheckViewController") as? CheckViewController else {return}
        
        nextVC.message = enterNameLogin.text
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


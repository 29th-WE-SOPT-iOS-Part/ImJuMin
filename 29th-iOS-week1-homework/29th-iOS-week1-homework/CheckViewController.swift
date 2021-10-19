//
//  CheckViewController.swift
//  29th-iOS-week1-homework
//
//  Created by 임주민 on 2021/10/06.
//
// 확인 화면

import UIKit

class CheckViewController: UIViewController {

    //MARK: - @IBOutlet
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var okayButton: UIButton!
    
    var message: String?
    
    func setMessageInLabel() {
        if let msg = message {
            showNameLabel.text = msg
            showNameLabel.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessageInLabel()
        okayButton.backgroundColor = UIColor(displayP3Red: 66/255, green: 133/255, blue: 244/255, alpha: 1)
        okayButton.layer.cornerRadius = 10
        okayButton.setTitleColor(UIColor.white, for: .normal)
    }


}


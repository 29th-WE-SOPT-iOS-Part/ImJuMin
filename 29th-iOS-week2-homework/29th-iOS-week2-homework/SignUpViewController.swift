//
//  SignUpViewController.swift
//  29th-iOS-week2-homework
//
//  Created by 임주민 on 2021/10/20.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    // MARK: - UI Component Part
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
      super.viewDidLoad()
    }
    
    // MARK: - IBAction Part
    
    @IBAction func touchUpNextButton(_ sender: Any) {
      guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CheckViewController") as? CheckViewController
      else {return}
        
      nextVC.message = nameTextField.text
      nextVC.modalPresentationStyle = .fullScreen
      nextVC.modalTransitionStyle = .crossDissolve
        
      self.nameTextField.text=""
      self.emailTextField.text=""
      self.pwdTextField.text=""
        
      self.present(nextVC, animated: true, completion: nil)
    }

    // MARK: - Custom Method Part
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
      self.view.endEditing(true)
    }
}

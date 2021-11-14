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
        nameTextField.delegate = self
    }
    
    // MARK: - IBAction Part
    
    @IBAction func touchUpNextButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CheckViewController") as? CheckViewController
        else {return}
        
        nextVC.message = nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        
        [nameTextField,emailTextField,pwdTextField].forEach{
            $0.text?.removeAll()
        }
        
        self.present(nextVC, animated: true, completion: nil)
    }
    
    // MARK: - Custom Method Part
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.nameTextField {
            textField.resignFirstResponder()
            self.emailTextField.becomeFirstResponder()
        }
        else if textField == self.emailTextField {
            textField.resignFirstResponder()
            self.pwdTextField.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
}

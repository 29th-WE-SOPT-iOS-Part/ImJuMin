//
//  SignInViewController.swift
//  29th-iOS-week2-homework
//
//  Created by 임주민 on 2021/10/20.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - UI Component Part
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
      super.viewDidLoad()
      nameTextField.delegate = self
    }
    
    // MARK: - IBAction Part
    
    @IBAction func touchUpNextButton(_ sender: Any) {
      requestLogin()
    }
    
    @IBAction func touchUpSignUpButton(_ sender: Any) {
      guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController")
      else {return}
        
      [nameTextField,emailTextField,pwdTextField].forEach{
        $0.text?.removeAll()
      }
        
      self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func myExit(sender: UIStoryboardSegue) {
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
    
    func simpleAlert(message: String) {
        let alert = UIAlertController(title: "로그인", message: message, preferredStyle: .alert)
        if message == "로그인 성공" {
            let okAction = UIAlertAction(title: "확인", style: .default) {(action) in
                self.goToCheckView() }
            alert.addAction(okAction)
            present(alert, animated: true)
        } else {
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
        
    func goToCheckView() {
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
}

// MARK: - Extension Part

extension SignInViewController {
    func requestLogin() {
        UserSignService.shared.login(email: emailTextField.text ?? "" ,
                                     name: nameTextField.text ?? "",
                                     password: pwdTextField.text ?? "") { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else {return}
                self.simpleAlert(message: response.message)
            case .requestErr(let loginResponse):
                guard let message = loginResponse as? String else { return }
                self.simpleAlert(message: message)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}

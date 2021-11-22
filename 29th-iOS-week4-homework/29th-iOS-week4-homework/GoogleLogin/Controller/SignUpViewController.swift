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
    requestSignUp()
  }
  
  @IBAction func touchUpShowPwd(_ sender: UIButton) {
    sender.isSelected.toggle()
    sender.tintColor = .blue
    pwdTextField.isSecureTextEntry.toggle()
  }
  
  // MARK: - Custom Method Part
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    view.endEditing(true)
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == nameTextField {
      textField.resignFirstResponder()
      emailTextField.becomeFirstResponder()
    }
    else if textField == emailTextField {
      textField.resignFirstResponder()
      pwdTextField.becomeFirstResponder()
    }
    textField.resignFirstResponder()
    return true
  }
  
  func simpleAlert(message: String) {
    let alert = UIAlertController(title: "회원가입", message: message, preferredStyle: .alert)
    if message == "회원 가입 성공" {
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
    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: Identifiers.checkVC) as? CheckViewController
    else { return }
    
    nextVC.message = nameTextField.text
    nextVC.modalPresentationStyle = .fullScreen
    nextVC.modalTransitionStyle = .crossDissolve
    
    [nameTextField,emailTextField,pwdTextField].forEach{
      $0.text?.removeAll()
    }
    
    present(nextVC, animated: true, completion: nil)
  }
}

// MARK: - Extension Part

extension SignUpViewController {
  func requestSignUp() {
    UserSignService.shared.signUp(email: emailTextField.text ?? "" ,
                                  name: nameTextField.text ?? "",
                                  password: pwdTextField.text ?? "") { responseData in
      switch responseData {
      case .success(let signUpResponse):
        guard let response = signUpResponse as? AuthResponseData else {return}
        self.simpleAlert(message: response.message)
      case .requestErr(let signUpResponse):
        guard let message = signUpResponse as? String else { return }
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

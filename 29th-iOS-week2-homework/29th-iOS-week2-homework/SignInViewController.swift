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
    
    @IBAction func touchUpSignUpButton(_ sender: Any) {
      guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController")
      else {return}
            
      self.nameTextField.text=""
      self.emailTextField.text=""
      self.pwdTextField.text=""
            
      self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func myExit(sender: UIStoryboardSegue) {
    }
    
    // MARK: - Custom Method Part
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
      self.view.endEditing(true)
    }
    
    // 키보드에서 다음버튼이나 return버튼 눌렀을 때 다음 입력창으로 넘어가기위한 코드
    // 아래 코드가 왜 안될까요..?왜..? 제가 놓친게 뭘까요?ㅜㅜ
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if textField == self.nameTextField { self.emailTextField.becomeFirstResponder() }
      else if textField == self.emailTextField { self.pwdTextField.becomeFirstResponder()  }
      return true
    }
}

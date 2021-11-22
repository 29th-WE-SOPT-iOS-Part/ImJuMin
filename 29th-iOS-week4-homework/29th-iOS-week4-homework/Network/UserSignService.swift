//
//  UserSignService.swift
//  29th-iOS-week4-homework
//
//  Created by 임주민 on 2021/11/14.
//

import Foundation

import UIKit
import Alamofire

struct UserSignService{
  static let shared = UserSignService()
  let header: HTTPHeaders = [
    "Content-Type" : "application/json"
  ]
  
  func login(email: String,
             password: String,
             completion: @escaping (NetworkResult<Any>) -> (Void)) {
    
    let url = APIConstants.loginURL
    
    let body: Parameters = [
      "email": email,
      "password": password
    ]
    
    let dataRequest = AF.request(url,
                                 method: .post,
                                 parameters: body,
                                 encoding: JSONEncoding.default,
                                 headers: header)
    
    dataRequest.responseData { dataResponse in
      switch dataResponse.result{
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else {return}
        guard let value = dataResponse.value else {return}
        let networkResult = self.judgeLoginStatus(by: statusCode, value)
        completion(networkResult)
      case .failure(let err):
        print(err)
        completion(.networkFail)
      }
    }
  }
  
  func signUp(email: String,
              name: String,
              password: String,
              completion: @escaping (NetworkResult<Any>) -> (Void)) {
    
    let url = APIConstants.signUpURL
    
    let header: HTTPHeaders = [
      "Content-Type" : "application/json"
    ]
    
    let body: Parameters = [
      "email": email,
      "name" : name,
      "password": password
    ]
    
    let dataRequest = AF.request(url,
                                 method: .post,
                                 parameters: body,
                                 encoding: JSONEncoding.default,
                                 headers: header)
    
    dataRequest.responseData { dataResponse in
      switch dataResponse.result{
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else {return}
        guard let value = dataResponse.value else {return}
        let networkResult = self.judgeLoginStatus(by: statusCode, value)
        completion(networkResult)
      case .failure(let err):
        print(err)
        completion(.networkFail)
      }
    }
  }
  
  private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    guard let decodedData = try? JSONDecoder().decode(AuthResponseData.self, from: data)
    else { return .pathErr }
    
    switch statusCode{
    case 200: return .success(decodedData)
    case 400: return .requestErr(decodedData.message)
    case 500: return .serverErr
    default: return .networkFail
    }
  }
}

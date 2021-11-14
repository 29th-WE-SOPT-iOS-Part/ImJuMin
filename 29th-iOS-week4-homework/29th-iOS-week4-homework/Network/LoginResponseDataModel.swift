//
//  LoginResponseDataModel.swift
//  29th-iOS-week4-homework
//
//  Created by 임주민 on 2021/11/14.
//  로그인 request에 대한 response를 담을 파일

import Foundation

// MARK: - LoginResponseData

struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

// MARK: - LoginResultData

struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}

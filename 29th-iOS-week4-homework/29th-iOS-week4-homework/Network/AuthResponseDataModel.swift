//
//  AuthResponseDataModel.swift
//  29th-iOS-week4-homework
//
//  Created by 임주민 on 2021/11/14.

import Foundation

// MARK: - AuthResponseData

struct AuthResponseData: Codable {
  let status: Int
  let success: Bool
  let message: String
  let data: AuthResultData?
}

// MARK: - AuthResultData

struct AuthResultData: Codable {
  let id: Int
  let name, email: String
}

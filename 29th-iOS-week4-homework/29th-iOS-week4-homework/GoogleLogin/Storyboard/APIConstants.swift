//
//  APIConstants.swift
//  29th-iOS-week4-homework
//
//  Created by 임주민 on 2021/11/14.
//  API 주소 모아놓는 파일

import Foundation

struct APIConstants {
    
    //MARK: - Base URL
    
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    //MARK: - Feature URL
    
    static let loginURL = baseURL + "/user/login"
    static let signUpURL = baseURL + "/user/signup"
}

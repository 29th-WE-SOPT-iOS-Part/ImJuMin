//
//  NetworkResult.swift
//  29th-iOS-week4-homework
//
//  Created by 임주민 on 2021/11/14.
//  서버 통신 결과 처리

import Foundation

enum NetworkResult<T> {
  case success(T)
  case requestErr(T)
  case pathErr
  case serverErr
  case networkFail
}

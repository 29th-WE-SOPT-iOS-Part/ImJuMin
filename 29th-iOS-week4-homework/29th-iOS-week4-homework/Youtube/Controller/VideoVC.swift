//
//  VideoVC.swift
//  29th-iOS-week3-homework
//
//  Created by 임주민 on 2021/10/29.
//

import UIKit

class VideoVC: UIViewController {
  
  // MARK: - Vars & Lets Part
  
  var videoContentList: [VideoContentData] = []
  var youtuberList: [YoutuberData] = []
  
  // MARK: - UI Component Part
  
  @IBOutlet weak var videoTableView: UITableView!
  @IBOutlet weak var youtuberCollectionView: UICollectionView!
  @IBOutlet weak var loginButton: UIButton!
  
  // MARK: - Life Cycle Part
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mandate()
    initVideoContentList()
    initYoutuberList()
    registerXib()
  }
  
  // MARK: - IBAction Part
  
  @IBAction func touchUpToLogin(_ sender: UIButton) {
    let LoginStoryBoard = UIStoryboard.init(name: Identifiers.googleLogin, bundle: nil)
    guard let nextVC = LoginStoryBoard.instantiateViewController(withIdentifier: Identifiers.navigationVC ) as? NavigationController else {return}
    
    nextVC.modalPresentationStyle = .fullScreen
    present(nextVC, animated: true, completion: nil)
  }
  
  // MARK: - Custom Method Part
  
  func mandate() {
    videoTableView.dataSource = self
    videoTableView.delegate = self
    youtuberCollectionView.delegate = self
    youtuberCollectionView.dataSource = self
  }
  
  func registerXib() {
    let xibName = UINib(nibName: Identifiers.videoTVC, bundle: nil)
    videoTableView.register(xibName, forCellReuseIdentifier: Identifiers.videoTVC)
  }
  
  func initVideoContentList() {
    videoContentList.append(contentsOf: [
      VideoContentData(videoName: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", description: "WE SOPT ・조회수 100만회 ・ 3주 전"),
      VideoContentData(videoName: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", description: "WE SOPT ・조회수 100만회 ・ 3주 전"),
      VideoContentData(videoName: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", description: "WE SOPT ・조회수 100만회 ・ 3주 전"),
      VideoContentData(videoName: "4차 iOS 세미나 : Cocoapods & Networking, REST API", description: "WE SOPT ・조회수 100만회 ・ 3주 전"),
      VideoContentData(videoName: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ", description: "WE SOPT ・조회수 100만회 ・ 3주 전")
    ])
  }
  
  func initYoutuberList() {
    youtuberList.append(contentsOf: [
      YoutuberData(youtuberName: "iOSPart", youtuberImageName: "ggamju1"),
      YoutuberData(youtuberName: "ServerPart", youtuberImageName: "ggamju2"),
      YoutuberData(youtuberName: "AndroidPart", youtuberImageName: "ggamju3"),
      YoutuberData(youtuberName: "DesignPart", youtuberImageName: "ggamju4"),
      YoutuberData(youtuberName: "WebPart", youtuberImageName: "ggamju5"),
      YoutuberData(youtuberName: "PlanPart", youtuberImageName: "ggamju6"),
    ])
  }
=======
    
    // MARK: - Vars & Lets Part
    
    var videoContentList: [VideoContentData] = []
    var youtuberList: [YoutuberData] = []
    
    // MARK: - UI Component Part
    
    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet weak var youtuberCollectionView: UICollectionView!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVideoContentList()
        initYoutuberList()
        registerXib()
        videoTableView.dataSource = self
        videoTableView.delegate = self
        youtuberCollectionView.delegate = self
        youtuberCollectionView.dataSource = self
    }
    
    // MARK: - IBAction Part
    
    @IBAction func touchUpToLogin(_ sender: UIButton) {
        let LoginStoryBoard = UIStoryboard.init(name: "GoogleLogin", bundle: nil)
        guard let nextVC = LoginStoryBoard.instantiateViewController(withIdentifier: "NavigationViewController" ) as? NavigationViewController else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    // MARK: - Custom Method Part
    
    func registerXib() {
        let xibName = UINib(nibName: VideoTableViewCell.identifier, bundle: nil)
        videoTableView.register(xibName, forCellReuseIdentifier: VideoTableViewCell.identifier)
    }
    
    func initVideoContentList() {
        videoContentList.append(contentsOf: [
            VideoContentData(videoName: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", description: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            VideoContentData(videoName: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", description: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            VideoContentData(videoName: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", description: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            VideoContentData(videoName: "4차 iOS 세미나 : Cocoapods & Networking, REST API", description: "WE SOPT ・조회수 100만회 ・ 3주 전"),
            VideoContentData(videoName: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ", description: "WE SOPT ・조회수 100만회 ・ 3주 전")
        ])
    }
    
    func initYoutuberList() {
        youtuberList.append(contentsOf: [
            YoutuberData(youtuberName: "iOSPart", youtuberImageName: "ggamju1"),
            YoutuberData(youtuberName: "ServerPart", youtuberImageName: "ggamju2"),
            YoutuberData(youtuberName: "AndroidPart", youtuberImageName: "ggamju3"),
            YoutuberData(youtuberName: "DesignPart", youtuberImageName: "ggamju4"),
            YoutuberData(youtuberName: "WebPart", youtuberImageName: "ggamju5"),
            YoutuberData(youtuberName: "PlanPart", youtuberImageName: "ggamju6"),
        ])
    }
>>>>>>> feature/7-week4
}

// MARK: - UITableViewDelegate

extension VideoVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 306
  }
}

// MARK: - UITableViewDataSource

extension VideoVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videoContentList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.videoTVC) as? VideoTableViewCell else { return UITableViewCell() }
    
    cell.setData(videoData: videoContentList[indexPath.row])
    return cell
  }
}

// MARK: - UICollectionViewDataSource

extension VideoVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.videoCVC, for: indexPath)
            as? VideoCollectionViewCell else { return UICollectionViewCell() }
    cell.setData(youtuberData: youtuberList[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return youtuberList.count
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension VideoVC: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 72, height: 104)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.zero
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

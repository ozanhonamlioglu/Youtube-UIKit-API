//
//  ViewController.swift
//  Youtube-UIKit-API
//
//  Created by ozan honamlioglu on 11.08.2021.
//

import UIKit
import Combine

fileprivate let VideoCellReuseId = "videocell"
fileprivate let NewsCellReuseId = "newscell"

class HomeTableViewController: UITableViewController {
    
    // MARK: - VARIABLES
    var bag = Set<AnyCancellable>()
    var listData: [MainModel] = [MainModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        xibCellRegisters()
        homeFeedService.fetchHomeList()
        observers()
    }

    // MARK: - HANDLERS
    func xibCellRegisters() {
        tableView.register(UINib(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: VideoCellReuseId)
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: NewsCellReuseId)
    }
    
    func observers() {
        homeFeedService.homeData.sink { [weak self] data in
            guard data != nil else { return }
            self?.listData = data!
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }.store(in: &bag)
    }

    // MARK: - DATA
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func createStoryCollectionView(data: [ShortsData]) -> UIView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let controller = StoryCollectionViewController(collectionViewLayout: layout)
        controller.data = data
        addChild(controller)
        controller.didMove(toParent: self)
        return controller.view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let singleData = listData[indexPath.row]
        
        switch singleData.type {
        case .video:
            let videoCell = tableView.dequeueReusableCell(withIdentifier: VideoCellReuseId, for: indexPath) as! VideoCell
            videoCell.data = singleData
            return videoCell
            
        case .news:
            let newsCell = tableView.dequeueReusableCell(withIdentifier: NewsCellReuseId, for: indexPath) as! NewsCell
            return newsCell
            
        case .shorts:
            let shortsCell = createShortsCell(data: singleData.data!)
            return shortsCell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let singleData = listData[indexPath.row]
        
        switch singleData.type {
        case .video:
            return 400
        case .news:
            return 500
        case .shorts:
            return 300
        }
    }
    
}

extension HomeTableViewController {
    
    func createShortsCell(data: [ShortsData]) -> UITableViewCell {
        let aCell = UITableViewCell(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 300))
        aCell.selectionStyle = .none
        
        let storyCollectionView = createStoryCollectionView(data: data)
        
        let shortIcon = UIImage(named: "shorts")
        let modifiedIcon = shortIcon?.resize(targetSize: CGSize(width: 25, height: 30))
        let shortIconView = UIImageView(image: modifiedIcon)
        shortIconView.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        shortIconView.contentMode = .scaleAspectFit
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let title = UILabel()
        let betaTitle = UILabel()
        
        title.text = "Shorts"
        betaTitle.text = "beta"
        betaTitle.font = UIFont(name: "Avenir-Light", size: 13)
        title.font = UIFont(name: "Avenir-Next", size: 15)
        
        header.addSubview(shortIconView)
        header.addSubview(title)
        header.addSubview(betaTitle)
        aCell.addSubview(header)
        aCell.contentView.addSubview(storyCollectionView)
        
        storyCollectionView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        betaTitle.translatesAutoresizingMaskIntoConstraints = false
        shortIconView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            header.heightAnchor.constraint(equalToConstant: 40),
            header.topAnchor.constraint(equalTo: aCell.topAnchor),
            header.leftAnchor.constraint(equalTo: aCell.leftAnchor),
            header.rightAnchor.constraint(equalTo: aCell.rightAnchor),
            storyCollectionView.topAnchor.constraint(equalTo: header.bottomAnchor),
            storyCollectionView.leftAnchor.constraint(equalTo: aCell.leftAnchor),
            storyCollectionView.rightAnchor.constraint(equalTo: aCell.rightAnchor),
            storyCollectionView.bottomAnchor.constraint(equalTo: aCell.bottomAnchor),
            shortIconView.leftAnchor.constraint(equalTo: header.leftAnchor, constant: 5),
            shortIconView.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            title.leftAnchor.constraint(equalTo: shortIconView.rightAnchor, constant: 5),
            title.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            betaTitle.topAnchor.constraint(equalTo: header.topAnchor, constant: 2),
            betaTitle.leftAnchor.constraint(equalTo: title.rightAnchor, constant: 3)
        ])
        
        return aCell
    }
    
}

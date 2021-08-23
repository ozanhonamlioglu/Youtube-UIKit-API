//
//  ViewController.swift
//  Youtube-UIKit-API
//
//  Created by ozan honamlioglu on 11.08.2021.
//

import UIKit
import Combine

class HomeTableViewController: UITableViewController {
    
    // MARK: - VARIABLES
    var bag = Set<AnyCancellable>()
    var listData: [MainModel] = [MainModel]()
    
    let VideoCellReuseId = "videocell"
    let NewsCellReuseId = "newscell"
    
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
            
        default:
            let cell = UITableViewCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let singleData = listData[indexPath.row]
        
        switch singleData.type {
        case .video:
            return 400
        case .news:
            return 500
        default:
            return 50
        }
        
    }
    
}

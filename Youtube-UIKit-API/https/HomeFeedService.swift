//
//  homefeed.swift
//  Youtube-UIKit-API
//
//  Created by ozan honamlioglu on 12.08.2021.
//

import Foundation
import Combine

class HomeFeedService {
    var homeData = CurrentValueSubject<[MainModel]?, Never>(nil)
    
    func fetchHomeList() {
        let url = URL(string: BASE_URL + "homefeed")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil, data != nil else { return }
            
            do {
                let jsonData = try JSONDecoder().decode([MainModel].self, from: data!)
                self.homeData.send(jsonData)
                
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
    
}

let homeFeedService = HomeFeedService()

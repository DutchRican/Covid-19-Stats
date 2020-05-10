//
//  DataRequest.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 5/5/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import Foundation
import SwiftUI

struct DataRequest {
    //    @Binding var items:Regions?
    @Binding var items:[Country]
    func loadData(){
        guard let url = URL(string: "https://cov19.cc/report.json") else {return}
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        let session = URLSession.init(configuration: config)
        session.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decResponse = try JSONDecoder().decode(CovidData.self,from: data)
                    DispatchQueue.main.async {
                        var temp:[Country] = []
                        temp.append(decResponse.regions.world)
                        temp.append(decResponse.regions.unitedstates)
                        temp.append(decResponse.regions.canada)
                        temp.append(decResponse.regions.china)
                        temp.append(decResponse.regions.australia)
                        self.items = temp
                    }
                } catch{
                    print(error)
                }
                
            }
            return
        }.resume()
    }
}

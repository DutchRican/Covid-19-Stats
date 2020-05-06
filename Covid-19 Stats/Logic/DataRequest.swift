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
    @Binding var items:[(name: String, country:Country)]
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
                        var temp:[(name: String, country:Country)] = []
                        temp.append((name: "Global Stats", country: decResponse.regions.world))
                        temp.append((name: "United States", country: decResponse.regions.unitedstates))
                        temp.append((name: "Canada", country: decResponse.regions.canada))
                        temp.append((name: "China", country: decResponse.regions.china))
                        temp.append((name: "Australia", country: decResponse.regions.australia))
                        self.items = temp
                        //                        self.items = decResponse.regions
                    }
                } catch{
                    print(error)
                }
                
            }
            return
        }.resume()
    }
}

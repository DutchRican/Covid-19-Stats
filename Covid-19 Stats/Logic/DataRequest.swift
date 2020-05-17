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
    @Binding var items:[(name: String, country: Country)]
    @Binding var isLoading:Bool
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
                        var temp: [(name: String, country: Country)] = []
                        for (name, country) in decResponse.regions where country.list != nil {
                            temp.append((name: countryMap[name] ?? name.capitalized, country))
                        }
                        self.items = temp.sorted{
                            $0.country.totals?.confirmed ?? 0 > $1.country.totals?.confirmed ?? 0
                        }
                        self.isLoading = false
                    }
                } catch{
                    print(error)
                }
                
            }
            return
        }.resume()
    }
}



//
//  ResponseDataType.swift
//  Covid-19 Stats
//
//  Created by Paul Van woensel on 4/30/20.
//  Copyright © 2020 Paul Van woensel. All rights reserved.
//

import Foundation


struct CovidData: Codable {
    var last_updated: String
    var regions: Regions
    
    struct parsedData {
        var name: String
        var totals: Totals
    }
}

struct Regions: Codable {
    var world: Country
    var unitedstates: Country
    var canada: Country
    var china: Country
    var australia: Country
//    var asia: CountryMapper
//    var europe: CountryMapper
//    var antarctica: CountryMapper
//    var oceania: CountryMapper
//    var northamerica: CountryMapper
//    var southamerica: CountryMapper
}

struct Country: Codable {
    var name: String
    var totals: Totals
}

struct CountryMapper: Codable {
    var name: String
    var totals: Array<String>
}

struct Totals: Codable {
    var confirmed: Int
    var daily_confirmed: Int
    var daily_deaths: Int
    var deaths: Int
    var tests: Int
    var recovered: Int
    var critical: Int
}


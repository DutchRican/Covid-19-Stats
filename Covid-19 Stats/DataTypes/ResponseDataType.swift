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
    var regions:[String: Country]
}

struct Country: Codable, Identifiable {
    var id: UUID?
    var totals: Totals?
    var list: [CountryTotals]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totals = try? container.decode(Totals.self, forKey: .totals)
        self.list = try? container.decode([CountryTotals].self, forKey: .list)
        self.id = UUID()
    }
    
    //  for testing purposes
    init(totals: Totals, list: [CountryTotals]){
        self.totals = totals
        self.list = list
        self.id = UUID()
    }
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

struct CountryTotals: Codable, Identifiable {
    var id: UUID?
    var state: String?
    var country: String
    var confirmed: Int
    var daily_confirmed: Int
    var daily_deaths: Int
    var deaths: Int
    var tests: Int
    var recovered: Int
    var critical: Int
    var last_updated: String?
    var country_code: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.country = try container.decode(String.self, forKey: .country)
        self.confirmed = try container.decode(Int.self, forKey: .confirmed)
        self.daily_confirmed = try container.decode(Int.self, forKey: .daily_confirmed)
        self.daily_deaths = try container.decode(Int.self, forKey: .daily_deaths)
        self.deaths = try container.decode(Int.self, forKey: .deaths)
        self.tests = try container.decode(Int.self, forKey: .tests)
        self.recovered = try container.decode(Int.self, forKey: .recovered)
        self.critical = try container.decode(Int.self, forKey: .critical)
        self.last_updated = try? container.decode(String.self, forKey: .last_updated)
        self.country_code = try container.decode(String.self, forKey: .country_code)
        self.id = UUID()
    }
    // for testing purposes
    init(state: String, country: String, confirmed: Int, daily_confirmed: Int, daily_deaths: Int, deaths: Int, tests: Int, recovered: Int, critical: Int, last_updated: String, country_code: String){
        self.state = state
        self.country = country
        self.confirmed = confirmed
        self.daily_confirmed = daily_confirmed
        self.daily_deaths = daily_deaths
        self.deaths = deaths
        self.tests = tests
        self.recovered = recovered
        self.critical = critical
        self.last_updated = last_updated
        self.country_code = country_code
        self.id = UUID()
    }
}


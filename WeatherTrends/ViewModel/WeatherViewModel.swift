//
//  WeatherViewModel.swift
//  WeatherTrends
//
//  Created by Mac on 1/15/19.
//  Copyright © 2019 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation

class WeatherViewModel {
    private var weatherService = WeatherService()
    
    func getWeatherData(url:String) { // it should have completion handler
        self.weatherService.downloadData(withURL: url, withCompletion: <#T##([[String]]?, Error?) -> Void#>)
    }
    
}

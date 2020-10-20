//
//  File.swift
//  CTracker
//
//  Created by Anshad R on 25/04/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import Foundation

class CovidAPIManager: ObservableObject {
    @Published var covidData: CovidDataModel?
    
    init() {
        getCovidData()
    }
    
    func getCovidData(){
        NetworkManager().getCovidData { (covidData, error) in
           if let errorString =  error {
                
           } else if let covidData = covidData{
            DispatchQueue.main.async {
                self.covidData = covidData

            }
            }
        }
    }
}

//
//  ContentView.swift
//  CTracker
//
//  Created by Anshad R on 25/04/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var apiManager: CovidAPIManager  = CovidAPIManager()
    var body: some View {
        TabView {
            ListView(stateData: apiManager.covidData?.statewise ?? [Statewise]())
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("List")
            }
            //Plotting last 7 days data
            BarChart(dataSource: BarChartDataSource(caseTimeDataModels:  apiManager.covidData?.caseTimeDataModel?.suffix(60) ?? [CaseTimeDataModel]()))
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Chart")
            }
        }
    }
}

struct ListView: View {
    var stateData: [Statewise]
    var body: some View {
        NavigationView {
            ZStack
            {
                Color.purple
                    .edgesIgnoringSafeArea(.all)
            List(stateData, id: \.state) { stateInfo in
                NavigationLink(destination: DetailsView(stateInfo: stateInfo)) {
                    CellRow(stateInfo: stateInfo)
                }.navigationBarTitle("Covid 19")
                }}
        }
    }
}

struct CellRow: View {
    var stateInfo: Statewise
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(stateInfo.state ?? "")
                    .font(.title)
                    .foregroundColor(Color(UIColor.systemGray2))
            }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DetailsView: View {
    var stateInfo: Statewise
    var body: some View {
        
        VStack {
            Text("Confirmed: \(stateInfo.confirmed ?? "")")
                .font(.body)
                .foregroundColor(.gray)
            Text("Recovered: \(stateInfo.recovered ?? "")")
                .font(.body)
                .foregroundColor(.green)
            Text("Active: \(stateInfo.active ?? "")")
                .font(.body)
                .foregroundColor(.blue)
            Text("Deaths: \(stateInfo.deaths ?? "")")
                .font(.body)
                .foregroundColor(.red)
            
           
        }
    }
}

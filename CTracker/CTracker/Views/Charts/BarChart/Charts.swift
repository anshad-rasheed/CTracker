//
//  Charts.swift
//  CTracker
//
//  Created by Anshad R on 01/05/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import SwiftUI

extension String {
    func floatValue() -> Float {
        return (self as NSString).floatValue
    }
}

struct BarChartDataSource {
    let caseTimeDataModels: [CaseTimeDataModel]
    init(caseTimeDataModels: [CaseTimeDataModel]) {
        self.caseTimeDataModels = caseTimeDataModels
    }
    
    func footNote(for caseTimeDataModel: CaseTimeDataModel) -> String {
        print(caseTimeDataModel.date!)
        return caseTimeDataModel.date!
    }
    
    func barHeight(for caseTimeDataModel: CaseTimeDataModel) -> CGFloat {
        let height  = CGFloat(CaseTimeDataViewModel(caseTimeDataModel: caseTimeDataModel).totalconfirmedFloatValue * 300)/self.maxValue()
        print(height)
        return height
    }
    
    func barHeightA(for caseTimeDataModel: CaseTimeDataModel) -> CGFloat {
        let height  = CGFloat((caseTimeDataModel.dailyconfirmed?.floatValue() ?? 0) * 300) / self.maxValueA()
        print(height)
        return height
    }
    
    private func maxValue() -> CGFloat {
        return CGFloat( caseTimeDataModels.max { $0.totalconfirmed?.floatValue() ?? 0 < $1.totalconfirmed?.floatValue() ?? 0 }?.totalconfirmed?.floatValue() ?? 0)
    }
    
    private func maxValueA() -> CGFloat {
        return CGFloat(caseTimeDataModels.max { $0.dailyconfirmed?.floatValue() ?? 0 < $1.dailyconfirmed?.floatValue() ?? 0 }?.dailyconfirmed?.floatValue() ?? 0)
    }
}

struct Charts: View {
    var body: some View {
        Text("")
    }
}

struct BarChart: View {
    var dataSource: BarChartDataSource
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(dataSource.caseTimeDataModels, id: \.date) { data in
                    BarView(size: CGSize(width: 50, height: self.dataSource.barHeightA(for: data)), footNote: data.date ?? "", value: data.dailyconfirmed ?? "")
                }
            }
        }
    }
}

struct BarView: View {
    var size: CGSize
    var barColor: Color = .pink
    var footNote: String
    var value: String
    var body: some View {
        VStack {
            Spacer()
            Text(value)
                .font(.footnote)
                .zIndex(1)
            Rectangle()
                .fill(barColor)
                .frame(width: size.width, height: size.height)
            Text(footNote)
                .font(.footnote)
                .frame(height: 20)
        }
    }
}

struct BarViewDataSource {
    let index: Int
    let dataPoints: [Float]
    let values: [Float]
    let footNotes: [String]
}


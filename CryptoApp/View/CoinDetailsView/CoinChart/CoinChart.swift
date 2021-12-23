//
//  CoinChart.swift
//  CryptoApp
//
//  Created by Martin Victory on 22/12/2021.
//

import UIKit
import Charts

class CoinChart: UIView {

    private var chartView: LineChartView!
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .backgroundGray
        self.layer.cornerRadius = 5
        
        self.chartView = buildChartView()
        
        setupLayout()
        setData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildChartView() -> LineChartView {
        let chart = LineChartView()
        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.rightAxis.enabled = false
        chart.xAxis.labelPosition = .bottom
        self.addSubview(chart)
        return chart
    }
    
    private func setData() {
        let values = [
            ChartDataEntry(x: 0.0, y: 10.0),
            ChartDataEntry(x: 1.0, y: 5.0),
            ChartDataEntry(x: 2.0, y: 7.0),
            ChartDataEntry(x: 3.0, y: 5.0),
            ChartDataEntry(x: 4.0, y: 10.0),
            ChartDataEntry(x: 5.0, y: 6.0),
            ChartDataEntry(x: 6.0, y: 5.0),
            ChartDataEntry(x: 7.0, y: 7.0),
            ChartDataEntry(x: 8.0, y: 8.0),
            ChartDataEntry(x: 9.0, y: 12.0),
        ]
        
        let set = LineChartDataSet(entries: values, label: "30 days")
        set.drawCirclesEnabled = false
        set.mode = .cubicBezier
        set.lineWidth = 3
        set.setColor(.red)
        set.fill = Fill(color: .red)
        set.fillAlpha = 0.8
        set.drawFilledEnabled = true
        
        let chartData = LineChartData(dataSet: set)
        chartData.setDrawValues(false)
        chartView.data = chartData
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            chartView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            chartView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            chartView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
    }
}

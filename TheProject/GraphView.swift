//
//  GraphView.swift
//  FinalProject
//
//  Created by JingyiZhang on 26/02/2018.
//  Copyright © 2018 jz. All rights reserved.
//

import Foundation
import RealmSwift
import Charts
import UIKit

class GraphView: UIViewController, ChartViewDelegate{
    @IBOutlet weak var chart: LineChartView!
    @IBAction func back(_ sender: Any) {
        self.performSegue(withIdentifier: "graphToSecond", sender: self)
    }
    var year = [String]()
    var percent = [Double]()
    var main = String()
    var sub = String()
//global variable-------------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SecondView{
            let pickName = segue.destination as! SecondView
            pickName.Name = main
        }
    }
    //set chart-------------------------------
    func setChart(data:[String], Values:[Double]){
        chart.delegate = self
        var dataEntries: [ChartDataEntry] = []
        //var dataYears: [String] = []
        for i in 0..<data.count{
            let DataEntry = ChartDataEntry(x: Double(year[i])!, y: Double(percent[i]))
            dataEntries.append(DataEntry)
        }
        let line1 = LineChartDataSet(values: dataEntries, label: "result in %")
        line1.colors = [NSUIColor.blue]
        //let lineChartData = LineChartData(values: dataYears, dataSet: lineChartDataSet)
        //let lineChartData = LineChartData(dataSets: lineChartDataSet)
        let lineChartData = LineChartData()
        lineChartData.addDataSet(line1)
        chart.data = lineChartData
        chart.chartDescription?.text = "Graph for Result"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //appendData()
        setChart(data: year, Values: percent)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func canRotate() -> Void {}
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController) {
            UIDevice.current.setValue(Int(UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
        }
        
    }
}

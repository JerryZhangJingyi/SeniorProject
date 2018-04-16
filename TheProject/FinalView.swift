//
//  FinalView.swift
//  ProjectPrototype
//
//  Created by JingyiZhang on 2/14/18.
//  Copyright © 2018 jz. All rights reserved.
//


import Foundation
import UIKit
import RealmSwift
import Charts

class FinalView: UIViewController, ChartViewDelegate{
    
    
    @IBAction func compare(_ sender: Any) {
        self.performSegue(withIdentifier: "finalToCompare", sender: self)
    }
    
    @IBOutlet weak var chartView: LineChartView!
    
    @IBAction func back(_ sender: Any) {
        self.performSegue(withIdentifier: "finalToSecond", sender: self)
    }
    
    var name = String()
    var Year = [String]()
    var Amount = [Double]()
    
    
    //append data--------------------------
    func appendData(){
        let realm = try! Realm()
        let alldata = realm.objects(GrossDomesticProduct.self)
        
        let alldata2 = realm.objects(PersonalConsumptionExpenditures.self)
        let alldata3 = realm.objects(GrossPrivateDomesticInvestment.self)
        let alldata4 = realm.objects(NetExportsOfGoodsAndServices.self)
        let alldata5 = realm.objects(GovernmentConsumptionExpendituresAndGrossInvestment.self)
        
        let alldata6 = realm.objects(DurableGoods.self)
        let alldata7 = realm.objects(NondurableGoods.self)
        let alldata8 = realm.objects(Services.self)
        
        let alldata9 = realm.objects(FixedPrivateInvestment.self)
        let alldata10 = realm.objects(ChangeInPrivateInventories.self)
        
        let alldata11 = realm.objects(PrivateNonresidentialFixedInvestment.self)
        let alldata12 = realm.objects(PrivateResidentialFixedInvestment.self)
        
        let alldata13 = realm.objects(ExportsOfGoodsAndServices.self)
        let alldata14 = realm.objects(ImportsOfGoodsAndServices.self)
        
        let alldata15 = realm.objects(FederalConsumptionExpendituresAndGrossInvestment.self)
        let alldata16 = realm.objects(StateConsumptionExpendituresAndGrossInvestment.self)
        
        let alldata17 = realm.objects(NationalDefenseExpenditures.self)
        let alldata18 = realm.objects(NondefenseExpenditures.self)
        
        let alldata19 = realm.objects(CivilianNoninstitutionalPopulation.self)
        let alldata20 = realm.objects(CivilianLaborForce.self)
        let alldata21 = realm.objects(EmploymentLevel.self)
        let alldata22 = realm.objects(UnemploymentLevel.self)
        let alldata23 = realm.objects(NotInLaborForce.self)
        
        if name == "Gross Domestic Product"{
            for i in alldata{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Personal Consumption Expenditures"{
            for i in alldata2{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Gross Private Domestic Investment"{
            for i in alldata3{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Net Exports Of Goods And Services"{
            for i in alldata4{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Government Consumption Expenditures And Gross Investment"{
            for i in alldata5{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Durable Goods"{
            for i in alldata6{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Nondurable Goods"{
            for i in alldata7{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Services"{
            for i in alldata8{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Fixed Private Investment"{
            for i in alldata9{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Change In Private Inventories"{
            for i in alldata10{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Private Nonresidential Fixed Investment"{
            for i in alldata11{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Private Residential Fixed Investment"{
            for i in alldata12{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Exports Of Goods And Services"{
            for i in alldata13{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Imports Of Goods And Services"{
            for i in alldata14{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Federal Consumption Expenditures And Gross Investment"{
            for i in alldata15{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "State Consumption Expenditures And Gross Investment"{
            for i in alldata16{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "National Defense Expenditures"{
            for i in alldata17{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Nondefense Expenditures"{
            for i in alldata18{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Civilian Noninstitutional Population"{
            for i in alldata19{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Civilian Labor Force"{
            for i in alldata20{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Employment Level"{
            for i in alldata21{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Unemployment Level"{
            for i in alldata22{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        else if name == "Not In Labor Force"{
            for i in alldata23{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                //tableView.reloadData()
            }
        }
        
    }
    //global variable-------------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SecondView{
            let pickName = segue.destination as! SecondView
            pickName.Name = name
        }
        else if segue.destination is CompareView{
            let pickName = segue.destination as! CompareView
            pickName.name = name
        }
    }
    //set chart------------------------
    func setChart(data:[String], Values:[Double]){
        chartView.delegate = self
        var dataEntries: [ChartDataEntry] = []
        //var dataYears: [String] = []
        for i in 0..<data.count{
            let DataEntry = ChartDataEntry(x: Double(Year[i])!, y: Double(Amount[i]))
            dataEntries.append(DataEntry)
        }
        let line1 = LineChartDataSet(values: dataEntries, label: name)
        line1.colors = [NSUIColor.blue]
        //let lineChartData = LineChartData(values: dataYears, dataSet: lineChartDataSet)
        //let lineChartData = LineChartData(dataSets: lineChartDataSet)
        let lineChartData = LineChartData()
        lineChartData.addDataSet(line1)
        chartView.data = lineChartData
        chartView.chartDescription?.text = "Graph for Result"
        
    }
    //-----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appendData()
        setChart(data: Year, Values: Amount)
        
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

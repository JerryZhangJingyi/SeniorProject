//  Created by JingyiZhang on 2018/3/13.
//  Copyright © 2018 jz. All rights reserved.

import Foundation
import UIKit
import RealmSwift
import Charts

class DuelView: UIViewController, ChartViewDelegate{
    var first = String()
    var second = String()
    var Year = [String]()
    var Amount = [Double]()
    var Amount2 = [Double]()
    //back button
    @IBAction func back(_ sender: Any) {
        self.performSegue(withIdentifier: "duelToCompare", sender: self)
    }
    //the graph view
    @IBOutlet weak var chartView: LineChartView!
    //global variable
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CompareView{
            let pickName = segue.destination as! CompareView
            pickName.name = first
        }
    }
    
    //append data
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
        
        let alldata24 = realm.objects(MonetaryBase.self)
        let alldata25 = realm.objects(CurrencyInCirculation.self)
        let alldata26 = realm.objects(ReserveBalancesWithFederalReserveBanks.self)
        let alldata27 = realm.objects(M1MoneyStock.self)
        let alldata28 = realm.objects(M2MoneyStock.self)
        
        let alldata29 = realm.objects(TradeWeightedUSDollarIndex.self)
        let alldata30 = realm.objects(USUKForeignExchangeRate.self)
        let alldata31 = realm.objects(ChinaUSForeignExchangeRate.self)
        let alldata32 = realm.objects(CanadaUSForeignExchangeRate.self)
        let alldata33 = realm.objects(JapanUSForeignExchangeRate.self)
        //chose data
        if first == "Gross Domestic Product"{
            for i in alldata{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Personal Consumption Expenditures"{
            for i in alldata2{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Gross Private Domestic Investment"{
            for i in alldata3{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Net Exports Of Goods And Services"{
            for i in alldata4{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Government Consumption Expenditures And Gross Investment"{
            for i in alldata5{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Durable Goods"{
            for i in alldata6{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Nondurable Goods"{
            for i in alldata7{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Services"{
            for i in alldata8{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Fixed Private Investment"{
            for i in alldata9{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Change In Private Inventories"{
            for i in alldata10{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Private Nonresidential Fixed Investment"{
            for i in alldata11{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Private Residential Fixed Investment"{
            for i in alldata12{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Exports Of Goods And Services"{
            for i in alldata13{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Imports Of Goods And Services"{
            for i in alldata14{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Federal Consumption Expenditures And Gross Investment"{
            for i in alldata15{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "State Consumption Expenditures And Gross Investment"{
            for i in alldata16{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "National Defense Expenditures"{
            for i in alldata17{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Nondefense Expenditures"{
            for i in alldata18{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Civilian Noninstitutional Population"{
            for i in alldata19{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Civilian Labor Force"{
            for i in alldata20{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Employment Level"{
            for i in alldata21{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Unemployment Level"{
            for i in alldata22{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Not In Labor Force"{
            for i in alldata23{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Monetary Base"{
            for i in alldata24{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Currency In Circulation"{
            for i in alldata25{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Reserve Balances With Federal Reserve Banks"{
            for i in alldata26{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "M1 Money Stock"{
            for i in alldata27{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "M2 Money Stock"{
            for i in alldata28{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Trade Weighted US Dollar Index"{
            for i in alldata29{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "US UK Foreign Exchange Rate"{
            for i in alldata30{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "China US Foreign Exchange Rate"{
            for i in alldata31{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Canada US Foreign Exchange Rate"{
            for i in alldata32{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        else if first == "Japan US Foreign Exchange Rate"{
            for i in alldata33{
                Year.append("\(i.Year)")
                Amount.append(i.data)
            }
        }
        //compared target
        if second == "Gross Domestic Product"{
            for i in alldata{
                Amount2.append(i.data)
            }
        }
        else if second == "Personal Consumption Expenditures"{
            for i in alldata2{
                Amount2.append(i.data)
            }
        }
        else if second == "Gross Private Domestic Investment"{
            for i in alldata3{
                Amount2.append(i.data)
            }
        }
        else if second == "Net Exports Of Goods And Services"{
            for i in alldata4{
                Amount2.append(i.data)
            }
        }
        else if second == "Government Consumption Expenditures And Gross Investment"{
            for i in alldata5{
                Amount2.append(i.data)
            }
        }
        else if second == "Durable Goods"{
            for i in alldata6{
                Amount2.append(i.data)
            }
        }
        else if second == "Nondurable Goods"{
            for i in alldata7{
                Amount2.append(i.data)
            }
        }
        else if second == "Services"{
            for i in alldata8{
                Amount2.append(i.data)
            }
        }
        else if second == "Fixed Private Investment"{
            for i in alldata9{
                Amount2.append(i.data)
            }
        }
        else if second == "Change In Private Inventories"{
            for i in alldata10{
                Amount2.append(i.data)
            }
        }
        else if second == "Private Nonresidential Fixed Investment"{
            for i in alldata11{
                Amount2.append(i.data)
            }
        }
        else if second == "Private Residential Fixed Investment"{
            for i in alldata12{
                Amount2.append(i.data)
            }
        }
        else if second == "Exports Of Goods And Services"{
            for i in alldata13{
                Amount2.append(i.data)
            }
        }
        else if second == "Imports Of Goods And Services"{
            for i in alldata14{
                Amount2.append(i.data)
            }
        }
        else if second == "Federal Consumption Expenditures And Gross Investment"{
            for i in alldata15{
                Amount2.append(i.data)
            }
        }
        else if second == "State Consumption Expenditures And Gross Investment"{
            for i in alldata16{
                Amount2.append(i.data)
            }
        }
        else if second == "National Defense Expenditures"{
            for i in alldata17{
                Amount2.append(i.data)
            }
        }
        else if second == "Nondefense Expenditures"{
            for i in alldata18{
                Amount2.append(i.data)
            }
        }
        else if second == "Civilian Noninstitutional Population"{
            for i in alldata19{
                Amount2.append(i.data)
            }
        }
        else if second == "Civilian Labor Force"{
            for i in alldata20{
                Amount2.append(i.data)
            }
        }
        else if second == "Employment Level"{
            for i in alldata21{
                Amount2.append(i.data)
            }
        }
        else if second == "Unemployment Level"{
            for i in alldata22{
                Amount2.append(i.data)
            }
        }
        else if second == "Not In Labor Force"{
            for i in alldata23{
                Amount2.append(i.data)
            }
        }
        else if second == "Monetary Base"{
            for i in alldata24{
                Amount2.append(i.data)
            }
        }
        else if second == "Currency In Circulation"{
            for i in alldata25{
                Amount2.append(i.data)
            }
        }
        else if second == "Reserve Balances With Federal Reserve Banks"{
            for i in alldata26{
                Amount2.append(i.data)
            }
        }
        else if second == "M1 Money Stock"{
            for i in alldata27{
                Amount2.append(i.data)
            }
        }
        else if second == "M2 Money Stock"{
            for i in alldata28{
                Amount2.append(i.data)
            }
        }
        else if second == "Trade Weighted US Dollar Index"{
            for i in alldata29{
                Amount2.append(i.data)
            }
        }
        else if second == "US UK Foreign Exchange Rate"{
            for i in alldata30{
                Amount2.append(i.data)
            }
        }
        else if second == "China US Foreign Exchange Rate"{
            for i in alldata31{
                Amount2.append(i.data)
            }
        }
        else if second == "Canada US Foreign Exchange Rate"{
            for i in alldata32{
                Amount2.append(i.data)
            }
        }
        else if second == "Japan US Foreign Exchange Rate"{
            for i in alldata33{
                Amount2.append(i.data)
            }
        }
    }
    //set the line chart for graph view
    func setChart(data:[String], Values:[Double]){
        chartView.delegate = self
        var dataEntries: [ChartDataEntry] = []
        var dataEntries2: [ChartDataEntry] = []
        for i in 0..<data.count{
            let DataEntry = ChartDataEntry(x: Double(Year[i])!, y: Double(Amount[i]))
            dataEntries.append(DataEntry)
        }
        for j in 0..<data.count{
            let DataEntry2 = ChartDataEntry(x: Double(Year[j])!, y: Double(Amount2[j]))
            dataEntries2.append(DataEntry2)
        }
        let line1 = LineChartDataSet(values: dataEntries, label: first)
        line1.colors = [NSUIColor.blue]
        let line2 = LineChartDataSet(values: dataEntries2, label: second)
        line2.colors = [NSUIColor.red]
        let lineChartData = LineChartData()
        lineChartData.addDataSet(line1)
        lineChartData.addDataSet(line2)
        chartView.data = lineChartData
        chartView.chartDescription?.text = "Graph for Result"
        
    }

    //load comments
    override func viewDidLoad() {
        super.viewDidLoad()
        appendData()
        setChart(data: Year, Values: Amount)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //allows rotation
    @objc func canRotate() -> Void {}
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (self.isMovingFromParentViewController) {
            UIDevice.current.setValue(Int(UIInterfaceOrientation.portrait.rawValue), forKey: "orientation")
        }
    }
}

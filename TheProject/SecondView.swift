//  Created by JingyiZhang on 2/12/18.
//  Copyright © 2018 jz. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class SecondView: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate{
    
    //shows the unit of the dataset
    @IBOutlet weak var unit: UILabel!
    //prevent process if nothing is selected
    @IBOutlet weak var flag: UILabel!
    //shows the name of the dataset
    @IBOutlet weak var DataName: UILabel!
    //back button
    @IBAction func BackFirst(_ sender: Any) {
        self.performSegue(withIdentifier: "ConnectFirst", sender: self)
    }
    //table view
    @IBOutlet weak var tableView: UITableView!
    //the calculate button
    @IBAction func calculate(_ sender: Any) {
        if flag.text != "Select" {
            self.performSegue(withIdentifier: "connectThird", sender: self)
        }
    }
    //the graph button
    @IBAction func graph(_ sender: Any) {
        self.performSegue(withIdentifier: "secondToFinal", sender: self)
    }
    //shows the content of calculation
    @IBOutlet weak var notification: UILabel!
    //picler view
    @IBOutlet weak var PickerView: UIPickerView!
    var Year = [String]()
    var Amount = [String]()
    var Name = String()
    var Target = ""
    var DataSet = [String]()
    var flagInt = 0
    //global variable
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ThirdView{
            let pickName = segue.destination as! ThirdView
            pickName.first = DataName.text!
            pickName.second = Target
        }
        else if segue.destination is FinalView{
            let pickName = segue.destination as! FinalView
            pickName.name = DataName.text!
        }
    }
    
    //picker view functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DataSet[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataSet.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if DataSet[0] != "Not Valid"{
            Target = DataSet[row]
            notification.text = "Check " + Name + " as a % of " + Target
            flag.text = ""
        }
    }
    //table view functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Year.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = Year[indexPath.row]
        cell.detailTextLabel?.text = Amount[indexPath.row]
        
        return cell
    }
    
    //display the correct unit
    func checkUnit(){
        if Name == "Gross Domestic Product" ||
            Name == "Personal Consumption Expenditures" ||
            Name == "Durable Goods" ||
            Name == "Nondurable Goods" ||
            Name == "Services" ||
            Name == "Gross Private Domestic Investment" ||
            Name == "Fixed Private Investment" ||
            Name == "Private Nonresidential Fixed Investment" ||
            Name == "Private Residential Fixed Investment" ||
            Name == "Change In Private Inventories" ||
            Name == "Net Exports Of Goods And Services" ||
            Name == "Exports Of Goods And Services" ||
            Name == "Imports Of Goods And Services" ||
            Name == "Government Consumption Expenditures And Gross Investment" ||
            Name == "Federal Consumption Expenditures And Gross Investment" ||
            Name == "National Defense Expenditures" ||
            Name == "Nondefense Expenditures" ||
            Name == "State Consumption Expenditures And Gross Investment" ||
            Name == "Monetary Base" ||
            Name == "Currency In Circulation" ||
            Name == "Reserve Balances With Federal Reserve Banks" ||
            Name == "M1 Money Stock" ||
            Name == "M2 Money Stock"
        {
            unit.text = "(Billions of Dollars)"
        }
        else if Name == "Civilian Noninstitutional Population" ||
            Name == "Civilian Labor Force" ||
            Name == "Employment Level" ||
            Name == "Unemployment Level" ||
            Name == "Not In Labor Force"{
            unit.text = "(Thousands of Personnels)"
        }
        else if Name == "Trade Weighted US Dollar Index"{
            unit.text = "(Index Mar 1973 = 100)"
        }
        else if Name == "US UK Foreign Exchange Rate"{
            unit.text = "(US Dollars to One British Pound)"
        }
        else if Name == "China US Foreign Exchange Rate"{
            unit.text = "(US Dollars to One Chinese Yuan)"
        }
        else if Name == "Canada US Foreign Exchange Rate"{
            unit.text = "(US Dollars to One Canadian Dollar)"
        }
        else if Name == "Japan US Foreign Exchange Rate"{
            unit.text = "(US Dollars to One Japanese Yen)"
        }
        else if Name == "SP 500" ||
            Name == "Dow Jones Industrial Average" ||
            Name == "Wilshire 5000 Total Market Index" ||
            Name == "CBOE Volatility Index" ||
            Name == "St Louis Fed Financial Stress Index" ||
            Name == "StateAndLocalBondsIndex"{
            unit.text = ""
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
        
        let alldata34 = realm.objects(SP500.self)
        let alldata35 = realm.objects(DowJonesIndustrialAverage.self)
        let alldata36 = realm.objects(Wilshire5000TotalMarketIndex.self)
        let alldata37 = realm.objects(CBOEVolatilityIndex.self)
        let alldata38 = realm.objects(StLouisFedFinancialStressIndex.self)
        let alldata39 = realm.objects(StateAndLocalBondsIndex.self)
        
        if Name == "Gross Domestic Product"{
            for i in alldata{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Personal Consumption Expenditures"{
            for i in alldata2{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Gross Private Domestic Investment"{
            for i in alldata3{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Net Exports Of Goods And Services"{
            for i in alldata4{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Government Consumption Expenditures And Gross Investment"{
            for i in alldata5{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Durable Goods"{
            for i in alldata6{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Nondurable Goods"{
            for i in alldata7{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Services"{
            for i in alldata8{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Fixed Private Investment"{
            for i in alldata9{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Change In Private Inventories"{
            for i in alldata10{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Private Nonresidential Fixed Investment"{
            for i in alldata11{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Private Residential Fixed Investment"{
            for i in alldata12{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Exports Of Goods And Services"{
            for i in alldata13{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Imports Of Goods And Services"{
            for i in alldata14{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Federal Consumption Expenditures And Gross Investment"{
            for i in alldata15{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "State Consumption Expenditures And Gross Investment"{
            for i in alldata16{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "National Defense Expenditures"{
            for i in alldata17{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Nondefense Expenditures"{
            for i in alldata18{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        //Labor
        else if Name == "Civilian Noninstitutional Population"{
            for i in alldata19{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Civilian Labor Force"{
            for i in alldata20{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Employment Level"{
            for i in alldata21{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Unemployment Level"{
            for i in alldata22{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Not In Labor Force"{
            for i in alldata23{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        //money
        else if Name == "Monetary Base"{
            for i in alldata24{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Currency In Circulation"{
            for i in alldata25{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Reserve Balances With Federal Reserve Banks"{
            for i in alldata26{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "M1 Money Stock"{
            for i in alldata27{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "M2 Money Stock"{
            for i in alldata28{
                Year.append("\(i.Year)")
                Amount.append("$\(i.data)")
                tableView.reloadData()
            }
        }
        //Currency
        else if Name == "Trade Weighted US Dollar Index"{
            for i in alldata29{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "US UK Foreign Exchange Rate"{
            for i in alldata30{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "China US Foreign Exchange Rate"{
            for i in alldata31{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Canada US Foreign Exchange Rate"{
            for i in alldata32{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Japan US Foreign Exchange Rate"{
            for i in alldata33{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        //Other
        else if Name == "SP 500"{
            for i in alldata34{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Dow Jones Industrial Average"{
            for i in alldata35{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "Wilshire 5000 Total Market Index"{
            for i in alldata36{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "CBOE Volatility Index"{
            for i in alldata37{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "St Louis Fed Financial Stress Index"{
            for i in alldata38{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
        else if Name == "State And Local Bonds Index"{
            for i in alldata39{
                Year.append("\(i.Year)")
                Amount.append("\(i.data)")
                tableView.reloadData()
            }
        }
    }
    //select the valid target for calculation
    func autoTarget(){
        if Name == "Personal Consumption Expenditures" ||
            Name == "Gross Private Domestic Investment" ||
            //Name == "Net Exports Of Goods And Services" ||
            Name == "Exports Of Goods And Services" ||
            Name == "Imports Of Goods And Services" ||
            Name == "Government Consumption Expenditures And Gross Investment"{
            DataSet = ["Gross Domestic Product"]
            flagInt = 0
        }
        else if Name == "Durable Goods" ||
            Name == "Nondurable Goods" ||
            Name == "Services"{
            DataSet = ["Gross Domestic Product",
                       "Personal Consumption Expenditures"
            ]
            flagInt = 0
        }
        else if Name == "Fixed Private Investment" ||
            Name == "Change In Private Inventories"{
            DataSet = ["Gross Domestic Product",
                       "Gross Private Domestic Investment"
            ]
            flagInt = 0
        }
        else if Name == "Private Nonresidential Fixed Investment" ||
            Name == "Private Residential Fixed Investment"{
            DataSet = ["Gross Domestic Product",
                       "Gross Private Domestic Investment",
                       "Fixed Private Investment"]
            flagInt = 0
        }
        else if Name == "National Defense Expenditures" ||
            Name == "Nondefense Expenditures"{
            DataSet = ["Gross Domestic Product",
                       "Government Consumption Expenditures And Gross Investment",
                       "Federal Consumption Expenditures And Gross Investment"
            ]
            flagInt = 0
        }
        else if Name == "Federal Consumption Expenditures And Gross Investment" ||
            Name == "State Consumption Expenditures And Gross Investment"{
            DataSet = ["Gross Domestic Product",
                       "Government Consumption Expenditures And Gross Investment"
            ]
            flagInt = 0
        }
        else if Name == "Civilian Labor Force" ||
            Name == "Not In Labor Force"{
            DataSet = ["Civilian Noninstitutional Population"
            ]
            flagInt = 0
        }
        else if Name == "Employment Level" ||
            Name == "Unemployment Level"{
            DataSet = ["Civilian Noninstitutional Population",
                       "Civilian Labor Force"
            ]
            flagInt = 0
        }
        else if Name == "Currency In Circulation" ||
            Name == "Reserve Balances With Federal Reserve Banks"{
            DataSet = ["Monetary Base"
            ]
            flagInt = 0
        }
        else{
            DataSet = ["Not Valid"]
            flagInt = 1
        }
    }
    //load view
    override func viewDidLoad() {
        super.viewDidLoad()
        DataName.text = Name
        appendData()
        checkUnit()
        autoTarget()
        if flagInt == 0{
            notification.text = "Check " + Name + " as a % of (select one)"
        }
        else if flagInt == 1{
            notification.text = "No valid denominator"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //prevent rotation to landscape
    func canRotate() -> Void {}
}



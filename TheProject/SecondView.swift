//
//  SecondView.swift
//  ProjectPrototype
//
//  Created by JingyiZhang on 2/12/18.
//  Copyright © 2018 jz. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class SecondView: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate{
    

    @IBOutlet weak var unit: UILabel!
    @IBOutlet weak var flag: UILabel!
    @IBOutlet weak var DataName: UILabel!
    @IBAction func BackFirst(_ sender: Any) {
        self.performSegue(withIdentifier: "ConnectFirst", sender: self)
    }
    @IBOutlet weak var tableView: UITableView!
    @IBAction func calculate(_ sender: Any) {
        if flag.text != "Select" {
            self.performSegue(withIdentifier: "connectThird", sender: self)
        }
    }
    @IBAction func graph(_ sender: Any) {
        self.performSegue(withIdentifier: "secondToFinal", sender: self)
    }
    @IBOutlet weak var notification: UILabel!
    
    
    @IBOutlet weak var PickerView: UIPickerView!
    var Year = [String]()
    var Amount = [String]()
    var Name = String()
    var Target = ""
    var DataSet = [String]()
    var flagInt = 0
    //var nameForThird = String()
    //var go = "0"
    
    
    //global variable---------------------------------------
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
    
    //picker view functions----------------
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
        //autoTarget()
        if DataSet[0] != "Not Valid"{
            Target = DataSet[row]
            notification.text = "Check " + Name + " as a % of " + Target
            flag.text = ""
            //go = "1"
            //print("#", go)
        }
    }
    //table view functions-----------------
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
    
    //check unit
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
            Name == "State Consumption Expenditures And Gross Investment"
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
    }
    
    //append data------------------------------------
    
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
        //Labor------------------
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
    }
    //select target-------------------------------
    func autoTarget(){
        if Name == "Personal Consumption Expenditures" ||
            Name == "Gross Private Domestic Investment" ||
            Name == "Net Exports Of Goods And Services" ||
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
        else{
            DataSet = ["Not Valid"]
            flagInt = 1
        }
    }
    //------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        //Target = ""
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
        //autoTarget()
        //print("##",go)
        //print ("TARGET IS########### |" + Target + "|")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func canRotate() -> Void {}
    
    
}



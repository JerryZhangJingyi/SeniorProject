//
//  File.swift
//  ProjectPrototype
//
//  Created by JingyiZhang on 2/14/18.
//  Copyright © 2018 jz. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class ThirdView: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var resultNote: UILabel!
    @IBOutlet weak var resultTable: UITableView!
    @IBAction func backSecond(_ sender: Any) {
        self.performSegue(withIdentifier: "thirdToSecond", sender: self)
    }
    @IBAction func graph(_ sender: Any) {
        self.performSegue(withIdentifier: "ThirdToGraph", sender: self)
    }
    
    var Year = [String]()
    var Amount = [Double]()
    var Amount2 = [Double]()
    var Array = [String]()
    var first = String()
    var second = String()
    var final = [String]()
    var pass = [Double]()
    //table view function-------------------------------
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Year.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = Year[indexPath.row]
        
        cell.detailTextLabel?.text = final[indexPath.row]
        
        return cell
    }
    //append array---------------------------------------------------------
    func appendArray(){
        let i = 0
        var x = String()
        while i <= Amount.count{
            x = String(Amount[i])
            Array.append(x)
        }
    }
    //append data-------------------------
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
        //first---------------------------------
        if first == "Gross Domestic Product"{
            for i in alldata{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Personal Consumption Expenditures"{
            for i in alldata2{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Gross Private Domestic Investment"{
            for i in alldata3{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Net Exports Of Goods And Services"{
            for i in alldata4{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Government Consumption Expenditures And Gross Investment"{
            for i in alldata5{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Durable Goods"{
            for i in alldata6{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Nondurable Goods"{
            for i in alldata7{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Services"{
            for i in alldata8{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Fixed Private Investment"{
            for i in alldata9{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Change In Private Inventories"{
            for i in alldata10{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Private Nonresidential Fixed Investment"{
            for i in alldata11{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Private Residential Fixed Investment"{
            for i in alldata12{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Exports Of Goods And Services"{
            for i in alldata13{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Imports Of Goods And Services"{
            for i in alldata14{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Federal Consumption Expenditures And Gross Investment"{
            for i in alldata15{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "State Consumption Expenditures And Gross Investment"{
            for i in alldata16{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "National Defense Expenditures"{
            for i in alldata17{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Nondefense Expenditures"{
            for i in alldata18{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Civilian Noninstitutional Population"{
            for i in alldata19{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Civilian Labor Force"{
            for i in alldata20{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Employment Level"{
            for i in alldata21{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Unemployment Level"{
            for i in alldata22{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        else if first == "Not In Labor Force"{
            for i in alldata23{
                Year.append("\(i.Year)")
                Amount.append(i.data)
                resultTable.reloadData()
            }
        }
        //second----------------------
        if second == "Gross Domestic Product"{
            for i in alldata{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Personal Consumption Expenditures"{
            for i in alldata2{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Gross Private Domestic Investment"{
            for i in alldata3{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Net Exports Of Goods And Services"{
            for i in alldata4{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Government Consumption Expenditures And Gross Investment"{
            for i in alldata5{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Durable Goods"{
            for i in alldata6{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Nondurable Goods"{
            for i in alldata7{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Services"{
            for i in alldata8{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Fixed Private Investment"{
            for i in alldata9{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Change In Private Inventories"{
            for i in alldata10{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Private Nonresidential Fixed Investment"{
            for i in alldata11{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Private Residential Fixed Investment"{
            for i in alldata12{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Exports Of Goods And Services"{
            for i in alldata13{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Imports Of Goods And Services"{
            for i in alldata14{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Federal Consumption Expenditures And Gross Investment"{
            for i in alldata15{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "State Consumption Expenditures And Gross Investment"{
            for i in alldata16{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "National Defense Expenditures"{
            for i in alldata17{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Nondefense Expenditures"{
            for i in alldata18{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Civilian Noninstitutional Population"{
            for i in alldata19{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Civilian Labor Force"{
            for i in alldata20{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Employment Level"{
            for i in alldata21{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Unemployment Level"{
            for i in alldata22{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
        else if second == "Not In Labor Force"{
            for i in alldata23{
                //Year.append("\(i.Year)")
                Amount2.append(i.data)
                resultTable.reloadData()
            }
        }
    }
    //calculation ----------------------
    func calculation(){
        var x = 0
        var up = 0.0
        var down = 0.0
        let result = 0
        var finalResult = Double()
        while x < Amount.count{
            //print ("x is -----> ", x)
            up = Amount[x]
            let upFloat = Double(up)
            down = Amount2[x]
            let downFloat = Double(down)
            var resultFloat = Double(result)
            resultFloat = upFloat/downFloat
            finalResult = round(10000 * resultFloat)/10000
            finalResult = finalResult * 100
            pass.append(finalResult)
            final.append("\(String(finalResult))%")
            x = x + 1
        }
        
    }
    //global variable-----------------------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SecondView{
            let pickName = segue.destination as! SecondView
            
            pickName.Name = first
        }
        else if segue.destination is GraphView{
            let pickName2 = segue.destination as! GraphView
            pickName2.main = first
            pickName2.year = Year
            pickName2.percent = pass
            pickName2.sub = second
        }
    }
    
    //--------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        appendData()
        //print(first)
        //print(second)
        //print(Amount)
        //print(Amount2)
        calculation()
        resultNote.text = first + " as a % of " + second
        //print(final)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func canRotate() -> Void {}
    
}


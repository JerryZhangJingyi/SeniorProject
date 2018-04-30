//  Created by JingyiZhang on 2018/3/13.
//  Copyright © 2018 jz. All rights reserved.

import Foundation
import UIKit
import RealmSwift

class CompareView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    //name of the compared datasets
    @IBOutlet weak var notes: UILabel!
    //prevent progress if nothing is selected
    @IBOutlet weak var flag: UILabel!
    //picker view
    @IBOutlet weak var picker: UIPickerView!
    //back button
    @IBAction func back(_ sender: Any) {
        self.performSegue(withIdentifier: "compareToFinal", sender: self)
    }
    //graph button
    @IBAction func duel(_ sender: Any) {
        if flag.text == ""{
            self.performSegue(withIdentifier: "compareToDuel", sender: self)
        }
    }
    var Set = [String]()
    var name = String()
    var target = String()
    //pickerView functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Set[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Set.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if Set[0] != "Not Valid"{
            target = Set[row]
            notes.text = "Compare " + name + " with " + target
            flag.text = ""
        }
        else{
            flag.text = "Not Comparable"
        }
    }
    //shows the compareable datasets
    func autoTarget(){
        if name == "Gross Domestic Product" ||
            name == "Personal Consumption Expenditures" ||
            name == "Durable Goods" ||
            name == "Nondurable Goods" ||
            name == "Services" ||
            name == "Gross Private Domestic Investment" ||
            name == "Fixed Private Investment" ||
            name == "Private Nonresidential Fixed Investment" ||
            name == "Private Residential Fixed Investment" ||
            name == "Change In Private Inventories" ||
            name == "Net Exports Of Goods And Services" ||
            name == "Exports Of Goods And Services" ||
            name == "Imports Of Goods And Services" ||
            name == "Government Consumption Expenditures And Gross Investment" ||
            name == "Federal Consumption Expenditures And Gross Investment" ||
            name == "National Defense Expenditures" ||
            name == "Nondefense Expenditures" ||
            name == "State Consumption Expenditures And Gross Investment"
        {
            Set = ["Gross Domestic Product",
                       "Personal Consumption Expenditures",
                       "Durable Goods",
                       "Nondurable Goods",
                       "Services",
                       "Gross Private Domestic Investment",
                       "Fixed Private Investment",
                       "Private Nonresidential Fixed Investment",
                       "Private Residential Fixed Investment",
                       "Change In Private Inventories",
                       "Net Exports Of Goods And Services",
                       "Exports Of Goods And Services",
                       "Imports Of Goods And Services",
                       "Government Consumption Expenditures And Gross Investment",
                       "Federal Consumption Expenditures And Gross Investment",
                       "National Defense Expenditures",
                       "Nondefense Expenditures",
                       "State Consumption Expenditures And Gross Investment"]
            
        }
        else if name == "Civilian Noninstitutional Population" ||
                name == "Civilian Labor Force" ||
                name == "Employment Level" ||
                name == "Unemployment Level" ||
                name == "Not In Labor Force"{
            Set = ["Civilian Noninstitutional Population",
                    "Civilian Labor Force",
                    "Employment Level",
                    "Unemployment Level",
                    "Not In Labor Force"
            ]
        }
        else if name == "Monetary Base" ||
            name == "Currency In Circulation" ||
            name == "Reserve Balances With Federal Reserve Banks" ||
            name == "M1 Money Stock" ||
            name == "M2 Money Stock"{
            Set = ["Monetary Base",
                       "Currency In Circulation",
                       "Reserve Balances With Federal Reserve Banks",
                       "M1 Money Stock",
                       "M2 Money Stock"
            ]
        }
            
        else if
            name == "China US Foreign Exchange Rate" ||
            name == "Canada US Foreign Exchange Rate" ||
            name == "Japan US Foreign Exchange Rate"{
            Set = [
                       "China US Foreign Exchange Rate",
                       "Canada US Foreign Exchange Rate",
                       "Japan US Foreign Exchange Rate"
            ]
        }
            
        else{
            Set = ["Not Valid"]
        }
        var x = 0
        while (x < Set.count){
            if name == Set[x]{
                Set.remove(at: x)
            }
            x = x + 1
        }
    }
    //global variable
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FinalView{
            let pickName = segue.destination as! FinalView
            pickName.name = name
        }
        else if segue.destination is DuelView{
            let pickName = segue.destination as! DuelView
            pickName.first = name
            pickName.second = target
        }
    }
    //load view
    override func viewDidLoad() {
        super.viewDidLoad()
        target = ""
        notes.text = "Compare " + name + " with " + target
        flag.text = "Select"
        autoTarget()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //prevent rotation to landscape
    func canRotate() -> Void {}
}

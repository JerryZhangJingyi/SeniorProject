//
//  CompareView.swift
//  TheProject
//
//  Created by JingyiZhang on 2018/4/13.
//  Copyright © 2018 jz. All rights reserved.
//

import Foundation
//
//  CompareView.swift
//  FinalProject
//
//  Created by JingyiZhang on 2018/4/13.
//  Copyright © 2018 jz. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class CompareView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var notes: UILabel!
    
    @IBOutlet weak var flag: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBAction func back(_ sender: Any) {
        self.performSegue(withIdentifier: "compareToFinal", sender: self)
    }

    @IBAction func duel(_ sender: Any) {
        if flag.text == ""{
            self.performSegue(withIdentifier: "compareToDuel", sender: self)
        }
    }
    
    
    var Set = [String]()
    var name = String()
    var target = String()
    //pickerView------------------------
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
        //autoTarget()
        if Set[0] != "Not Valid"{
            target = Set[row]
            notes.text = "Compare " + name + " with " + target
            flag.text = ""
            //go = "1"
            //print("#", go)
        }
    }
    //auto Target------------------------
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
    //global variable-------------------------
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
    //-------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        target = ""
        notes.text = "Compare " + name + " with " + target
        flag.text = "Select"
        //appendData()
        autoTarget()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func canRotate() -> Void {}
    
}

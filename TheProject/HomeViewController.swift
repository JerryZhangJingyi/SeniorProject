//
//  ViewController.swift
//  ProjectPrototype
//
//  Created by JingyiZhang on 2/12/18.
//  Copyright © 2018 jz. All rights reserved.
//

import UIKit
import RealmSwift


class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var Select: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    
    @IBAction func selectData(_ sender: UIButton) {
        dataCollection.forEach{ (button) in
            UIView.animate(withDuration: 0.3, animations:
                {button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
            
            //button.isHidden = !button.isHidden
            
        }
    }
    
    
    var flag = 0
    enum choices: String{
        case GDP = "GDP Data"
        case Labor = "Labor Data"
    }
    
    //--------------
    @IBAction func data(_ sender: UIButton) {
        guard let title = sender.currentTitle,
        let choice = choices(rawValue: title) else {
            return
        }
        
        selectButton.titleLabel?.text = sender.titleLabel?.text
        
        dataCollection.forEach{ (button) in
            UIView.animate(withDuration: 0.3, animations:
                {button.isHidden = !button.isHidden
                    self.view.layoutIfNeeded()
            })}
        
        switch choice{
        
        case .Labor:
            flag = 1
            Select.text = "Select one"
            dataset.removeAll()
            dataset = ["Civilian Noninstitutional Population",
                       "Civilian Labor Force",
                       "Employment Level",
                        "Unemployment Level",
                        "Not In Labor Force"
            ]
            loadData()
            
        default:
            flag = 0
            Select.text = "Select one"
            dataset.removeAll()
            dataset = ["Gross Domestic Product",
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
                       "State Consumption Expenditures And Gross Investment"
            ]
            loadData()
            
        }
    }
    
    @IBOutlet var dataCollection: [UIButton]!
    
    @IBOutlet weak var PickerView: UIPickerView!
    @IBAction func Confirm(_ sender: Any) {
        if Select.text != "Select one" {
            self.performSegue(withIdentifier: "ConnectSecond", sender: self)
        }
        
        
    }
    //var dataset = [String]()

    var dataset = ["Gross Domestic Product",
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
                   "State Consumption Expenditures And Gross Investment"
    ]
    
   
    
    
    
    //delete data-------------
    func deleteData(){
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(GrossDomesticProduct.self))
            realm.delete(realm.objects(GrossPrivateDomesticInvestment.self))
            realm.delete(realm.objects(PersonalConsumptionExpenditures.self))
            realm.delete(realm.objects(NetExportsOfGoodsAndServices.self))
            realm.delete(realm.objects(GovernmentConsumptionExpendituresAndGrossInvestment.self))
            realm.delete(realm.objects(DurableGoods.self))
            realm.delete(realm.objects(NondurableGoods.self))
            realm.delete(realm.objects(Services.self))
        }
    }
    //----------------------------------------------------------
    //global variable
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SecondView{
            let pickName = segue.destination as! SecondView
            
            pickName.Name = Select.text!
        }
    }
    //picker view func------------------------------
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataset[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataset.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        Select.text = dataset[row]
    }
    
    //reload picker view--------------------------------------------------------
    func loadData(){
        PickerView.reloadAllComponents()
    }
   //set Realm path

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) 
        
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}



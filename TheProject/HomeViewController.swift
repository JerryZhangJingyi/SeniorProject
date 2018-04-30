//  Created by JingyiZhang on 2/12/18.


import UIKit
import RealmSwift


class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //the label which shows the name of the data
    @IBOutlet weak var Select: UILabel!
    //the select button
    @IBOutlet weak var selectButton: UIButton!
    //data collection for the drop down menu
    @IBAction func selectData(_ sender: UIButton) {
        dataCollection.forEach{ (button) in
            UIView.animate(withDuration: 0.3, animations:
                {button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    //add cases for the drop down menu
    var flag = 0
    enum choices: String{
        case GDP = "GDP Data"
        case Labor = "Labor Data"
        case Monetary = "Monetary Data"
        case Currency = "Currency Data"
        case Other = "Other Data"
    }
    //data selected
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
            
        case .Other:
            flag = 1
            Select.text = "Select one"
            dataset.removeAll()
            dataset = ["SP 500",
                       "Dow Jones Industrial Average",
                       "Wilshire 5000 Total Market Index",
                       "CBOE Volatility Index",
                       "St Louis Fed Financial Stress Index",
                       "State And Local Bonds Index"
            ]
            loadData()
            
        case .Currency:
            flag = 1
            Select.text = "Select one"
            dataset.removeAll()
            dataset = ["Trade Weighted US Dollar Index",
                       "US UK Foreign Exchange Rate",
                       "China US Foreign Exchange Rate",
                       "Canada US Foreign Exchange Rate",
                       "Japan US Foreign Exchange Rate"
            ]
            loadData()
            
        case .Monetary:
            flag = 1
            Select.text = "Select one"
            dataset.removeAll()
            dataset = ["Monetary Base",
                       "Currency In Circulation",
                       "Reserve Balances With Federal Reserve Banks",
                       "M1 Money Stock",
                       "M2 Money Stock"
            ]
            loadData()
        
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
    //button collection for the drop down menu
    @IBOutlet var dataCollection: [UIButton]!
    //picker view
    @IBOutlet weak var PickerView: UIPickerView!
    //confirm button
    @IBAction func Confirm(_ sender: Any) {
        if Select.text != "Select one" {
            self.performSegue(withIdentifier: "ConnectSecond", sender: self)
        }
        
        
    }
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
    //global variable
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SecondView{
            let pickName = segue.destination as! SecondView
            
            pickName.Name = Select.text!
        }
    }
    //picker view functions
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
    
    //reload picker view
    func loadData(){
        PickerView.reloadAllComponents()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}



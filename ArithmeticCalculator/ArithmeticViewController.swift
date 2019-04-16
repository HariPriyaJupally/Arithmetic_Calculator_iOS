//
//  ViewController.swift
//  ArithmeticCalculator
//
//  Created by Jupally,Hari Priya on 4/15/19.
//  Copyright © 2019 Jupally,Hari Priya. All rights reserved.
//

import UIKit

class ArithmeticViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    
    @IBOutlet weak var activityPicker: UIPickerView!
    
    @IBOutlet weak var weightTF: UITextField!
    
    @IBOutlet weak var timeTF: UITextField!
    
    @IBOutlet weak var energyLBL: UILabel!
    
    @IBOutlet weak var loseTF: UILabel!
    
    var pickerContents: [String] = [String]()
    
    func invalidInput(){
        
        let alert = UIAlertController(title: "Invalid Input",
                                      
                                      message: "you have not given input",
                                      
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      
                                      handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func calculateBTN(_ sender: Any) {
//        let weightArray = weightTF.text!.components(separatedBy: " ")
//
//        var weight = 0.0
//
//        for i in weightArray {
//
//            weight += Double(i)!
//
//        }
        
        if Int(timeTF.text!) != nil {
        //let activity = activityTF.text!
            
            let weightArray = weightTF.text!.components(separatedBy: " ")
            
            var weight1 = 0.0
            
            for i in weightArray {
                
                weight1 += Double(i)!
                
            }
            
            
        let value = pickerContents[activityPicker.selectedRow(inComponent : 0)]
        let weight = weightTF.text!
        let time = timeTF.text!
        energyLBL.text! =  String(format: "%.1f",ExerciseCoach.energyConsumed(during: value, weight: Double(weight)!, time: Int(time)!)) + " cal"
        loseTF.text! = String(format: "%.1f",ExerciseCoach.timeToLose1Pound(during: value, weight: Double(weight)!)) + " minutes"
        }
        else {
            invalidInput()
        }
        
    }
    //Buss method of doing it
//    func invalidInput(){
//
//        let alert = UIAlertController(title: "Invalid Input",message: "you have not given input",
//preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "OK", style: .default,
//
//                                      handler: nil))
//
//        self.present(alert, animated: true, completion: nil)
//
//    }
//
//
//
//    @IBAction func Calculate(_ sender: Any) {
//
//        var weight = 0.0
//
//        if weightTF.text! != ""
//
//        {
//
//            let weightArray = weightTF.text!.components(separatedBy: " ")
//
//
//
//            for i in weightArray {
//
//                weight += Double(i)!
//
//            }}
//
//        else{
//
//            invalidInput()
//
//        }
//
//        if let time = Int(ExerciseTimeTF.text!) {
//
//            let energyConsumed = ExcerciseCoach.energyConsumed(during: activites!, weight: weight, time: time)
//
//            let timeToLose1Pound = ExcerciseCoach.timeToLose1Pound(during:activites!,weight: weight)
//
//            EnergyConsumed.text = "\(energyConsumed) cal"
//
//            Time.text = String(format:"%.1f", timeToLose1Pound)+" " + "minutes"
//
//        }else{
//
//            invalidInput()
//
//        }
//
//    }
    
    @IBAction func clearBTN(_ sender: Any) {
        //activityTF.text = ""
        activityPicker.reloadAllComponents()
        weightTF.text = ""
        timeTF.text = ""
        energyLBL.text = "0"
        loseTF.text = "0"
        activityPicker.selectRow(0, inComponent: 0, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.8205476403, blue: 0.9772850871, alpha: 1)
        pickerContents = ["Bicycling", "Jumping rope", "Running - slow", "Running - fast", "Tennis", "Swimming"]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerContents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerContents[row]
    }


}


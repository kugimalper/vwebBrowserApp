//
//  WebStettingsViewController.swift
//  webApp2
//
//  Created by ST13 on 16.10.2017.
//  Copyright © 2017 Kugim. All rights reserved.
//

import UIKit

let searchEngines = [
    ["Google", "https://www.google.com.tr/search?q=", "google"],
    ["Yandex", "https://yandex.com/search?q=", "yahoo"],
    ["Bing", "https://bing/search?q=", "bing"],
]

var searchEntryArray = [String]()
var searchEntry : String = ""
var searchIsOn = true
var searchURL = 2
var selectedSegment = 0


class WebStettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var searchHistoryLabel: UILabel!
    
    @IBOutlet weak var historyViewOutlet: UIView!
    
    @IBAction func settingsSegmentAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            historyViewOutlet.isHidden = true
            settingsViewOutlet.isHidden = false
            
        } else {
            historyViewOutlet.isHidden = false
            settingsViewOutlet.isHidden = true
        }
        selectedSegment = sender.selectedSegmentIndex
    }
    
    @IBOutlet weak var settingsSegmentOutlet: UISegmentedControl!
    @IBOutlet weak var settingsViewOutlet: UIView!
    @IBOutlet weak var searchImageOutlet: UIImageView!
    @IBOutlet weak var searchEnginePickerOutlet: UIPickerView!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return searchEngines.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return searchEngines[row][0]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        searchURL = row
        print(print(searchURL))
        searchImageOutlet.image = UIImage(named: searchEngines[row][2])
    }
    
    
    @IBOutlet weak var searchSettingsView: UIView!
    
    @IBOutlet weak var searchSwitchOutlet: UISwitch!

    @IBAction func searchSwitchAction(_ sender: UISwitch) {
        
        if sender.isOn == true {
            searchSettingsView.isHidden = false
            searchIsOn = true
        } else {
            searchSettingsView.isHidden = true
            searchIsOn = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change default search engine
        searchEnginePickerOutlet.selectRow(searchURL, inComponent: 0, animated: true)
        searchImageOutlet.image = UIImage(named: searchEngines[searchURL][2])
        
        

        
        // globaldeki bilgi searchSwitchOutlet'e gelsin
        searchSwitchOutlet.isOn = searchIsOn
        searchSwitchAction(searchSwitchOutlet)
        
        // ilk acildiginda hangi segment seciliyse ona gore kurallar calissin
        settingsSegmentOutlet.selectedSegmentIndex = selectedSegment
        settingsSegmentAction(settingsSegmentOutlet)
        
        for (ind,result) in searchEntryArray.enumerated() {
            //print(ind,result)
            searchEntry += "\n" + String(ind+1) + "-) \(result) "
            print (searchEntry)
        }
        searchHistoryLabel.text = searchEntry
        
        print ("alper")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    }

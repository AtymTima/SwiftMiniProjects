//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        getBitcoinData(url: "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCAUD")
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        finalURL = baseURL + currencyArray[row]
        getBitcoinData(url: finalURL)
    }
    
    
//    
//    //MARK: - Networking
//    /***************************************************************/
//    
    func getBitcoinData(url: String) {
        AF.request(url, method: .get).responseString { response in
            switch response.result{
            case .success(let value):
                print("Success! Got Bitcoin data")
                let bitcoinJSON : JSON = JSON(value)
                self.updateBitcoinData(json: bitcoinJSON)
            case .failure(let error):
                print("Error: \(error)")
                self.bitcoinPriceLabel.text = "Connection Issues"
            }
        }
    }
   
//    //MARK: - JSON Parsing
//    /***************************************************************/
    
    func updateBitcoinData(json: JSON){
        print(json)
        if let bitcoinPrice = json["last"].double{
            bitcoinPriceLabel.text = "\(bitcoinPrice)"
        }
    }
}


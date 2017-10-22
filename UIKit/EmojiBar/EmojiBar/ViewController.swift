//
//  ViewController.swift
//  EmojiBar
//
//  Created by Edward Chiang on 04/11/2016.
//  Copyright © 2016 TKU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageArray = ["🍎", "🍐", "🍏", "🍊", "🍋", "🍌", "🍉", "🍇", "🍒", "🌽"]
        
        for _ in 0..<100 {
            dataArray1.append((Int)(arc4random()%UInt32(imageArray.count)))
            dataArray2.append((Int)(arc4random()%UInt32(imageArray.count)))
            dataArray3.append((Int)(arc4random()%UInt32(imageArray.count)))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private
    
    @IBAction func pickClicked(_ sender: Any) {
        self.pickerView.selectRow(((Int)(arc4random()%UInt32(imageArray.count-6)+3)), inComponent: 0, animated: true)
        self.pickerView.selectRow(((Int)(arc4random()%UInt32(imageArray.count-6)+3)), inComponent: 1, animated: true)
        self.pickerView.selectRow(((Int)(arc4random()%UInt32(imageArray.count-6)+3)), inComponent: 2, animated: true)
        
        if self.dataArray1[self.pickerView.selectedRow(inComponent: 0)] == self.dataArray2[self.pickerView.selectedRow(inComponent: 1)] && self.dataArray1[self.pickerView.selectedRow(inComponent: 0)] == self.dataArray3[self.pickerView.selectedRow(inComponent: 2)] {
            let alert = UIAlertController(title: "Bingo!!", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        switch component {
        case 0:
            pickerLabel.text = imageArray[dataArray1[row]]
            break
        case 1:
            pickerLabel.text = imageArray[dataArray2[row]]
            break
        case 2:
            pickerLabel.text = imageArray[dataArray3[row]]
            break
        default:
            break
        }
        pickerLabel.font = UIFont.systemFont(ofSize: 22)
        pickerLabel.textAlignment = .center
        
        return pickerLabel
    }

}


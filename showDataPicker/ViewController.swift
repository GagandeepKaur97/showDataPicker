//
//  ViewController.swift
//  showDataPicker
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var textField_Date: UITextField!
    
    var datepicker : UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
       // textField_Date.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUpDate(_, textField: self.textField_Date)
    }
    func pickUpDate( _
        textField : UITextField)
    {
        self.datepicker = UIDatePicker(frame: CGRect(x : 0,y : 0,width:
            self.view.frame.size.width,height: 216))
        self.datepicker.backgroundColor = UIColor.white
        self.datepicker.datePickerMode = UIDatePicker.Mode.date
        
        textField.inputView = self.datepicker
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .red
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(ViewController.doneClick))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(ViewController.cancelClick))
        toolBar.setItems([cancelButton,spaceButton,doneButton],
                         animated: false)
        toolBar.isUserInteractionEnabled = true
        
       textField.inputAccessoryView = toolBar
    }
    @objc func doneClick(){
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        textField_Date.text = dateFormatter1.string(from: datepicker.date)
        textField_Date.resignFirstResponder()
        
    }
    @objc func cancelClick()
    {
        textField_Date.resignFirstResponder()
    }
    
}


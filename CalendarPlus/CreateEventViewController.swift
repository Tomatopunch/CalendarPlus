//
//  CreateEventViewController.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-15.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {

    @IBOutlet weak var UITextInputEventName: UITextField!
    
    @IBOutlet weak var UITextInputEventDescription: UITextField!
    
    @IBOutlet weak var UITextInputEventDate: UITextField!
    
    @IBOutlet weak var UITextViewDisplayTextInput: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapOnScreen()
        
    }
    // configureTextFields makes the textinputs editable, for example adding dismiss options for keyboard
    private func configureTextFields() {
        UITextInputEventName.delegate = self
        UITextInputEventDescription.delegate = self
        UITextInputEventDate.delegate = self
    }
    
    // function for dismissing keyboard when tapping outside of keyboard
    private func configureTapOnScreen(){
        
        let tapOnScreen = UITapGestureRecognizer(target: self, action: #selector(CreateEventViewController.handleTap))
        view.addGestureRecognizer(tapOnScreen)
        
    }
    @objc func handleTap(){
        view.endEditing(true)
        
    }
    
     
    @IBAction func UIButtonSumbitEvent(_ sender: Any) {
        
        ConvertTextInputToString()
        UITextViewDisplayTextInput.text = "Event name: \(UITextInputEventName.text!), Event description: \(UITextInputEventDescription.text!), Event date: \(UITextInputEventDate.text!)"
        clearTextFields()
        view.endEditing(true)
    }
    
    private func ConvertTextInputToString(){
        let tempEventName =  UITextInputEventName.text
        let tempEventDescription = UITextInputEventDescription.text
        let tempEventDate = UITextInputEventDate.text
        let eventInformation = EventInformation(eventName: String(tempEventName!), eventDescription: String(tempEventDescription!), eventDate: String(tempEventDate!))
        print(eventInformation.eventName)
    }
    private func clearTextFields(){
        UITextInputEventName.text?.removeAll()
        UITextInputEventDescription.text?.removeAll()
        UITextInputEventDate.text?.removeAll()
    }
    
  

}

extension CreateEventViewController: UITextFieldDelegate {
    
    // This function makes the return button close the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

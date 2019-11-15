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
    
    @IBOutlet weak var UITextViewDisplayTextInput: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapOnScreen()
        
    }
    // configureTextFields makes the textinputs editable, for example adding dismiss options for keyboard
    private func configureTextFields() {
        UITextInputEventName.delegate = self
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
        UITextViewDisplayTextInput.text = "Event name: \(UITextInputEventName.text!)"
        view.endEditing(true)
    }
  

}

extension CreateEventViewController: UITextFieldDelegate {
    
    // This function makes the return button close the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

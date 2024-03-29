//
//  CreateEventViewController.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-15.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {

    @IBOutlet weak var UIImageViewDisplayImage: UIImageView!
    @IBOutlet weak var UITextInputEventName: UITextField!
    @IBOutlet weak var UITextInputEventDescription: UITextField!
    @IBOutlet weak var UITextInputEventDate: UITextField!
    @IBOutlet weak var UILabelDisplayEventNameError: UILabel!
    @IBOutlet weak var UILabelDisplayDescriptionError: UILabel!
    @IBOutlet weak var UILabelDisplayImageError: UILabel!
    @IBOutlet weak var UILabelDisplayDateError: UILabel!
    @IBOutlet weak var UIButtonPickImage: UIButton!
    @IBOutlet weak var UILabelEventTitle: UILabel!
    @IBOutlet weak var UIButtonSubmit: UIButton!
    
    let database = Database.init()
    let eventInformation = EventInformation.init()
    let uiDesign = UIdesign.init()
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureTextFields()
        configureTapOnScreen()
        setDateForTextInput()
        setUI()
    }
    //MARK: SetUI
    //sets the UI for the view
    private func setUI(){
        
        uiDesign.setButton(button: UIButtonSubmit)
        uiDesign.setButton(button: UIButtonPickImage)
        uiDesign.setTitleText(titleLabel: UILabelEventTitle)
    }
    
    // MARK: configureTextFields
    // configureTextFields makes the textinputs editable, for example adding dismiss options for keyboard
    private func configureTextFields() {
        
        UITextInputEventName.delegate = self
        UITextInputEventDescription.delegate = self
        UITextInputEventDate.delegate = self
    }
    
    // MARK: configureTapOnScreen
    // function for dismissing keyboard when tapping outside of keyboard
    private func configureTapOnScreen() {
        
        let tapOnScreen = UITapGestureRecognizer(target: self, action: #selector(CreateEventViewController.handleTap))
        
        view.addGestureRecognizer(tapOnScreen)
    }
    
    // MARK: setDateForTextInput
    private func setDateForTextInput() {
        
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        UITextInputEventDate.inputView = datePicker
    }
    
    // MARK: dateChanged
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        UITextInputEventDate.text = dateFormatter.string(from: datePicker.date)
    }
    
    // MARK: handleTap
    @objc func handleTap() {
        
        view.endEditing(true)
    }
    
     // MARK: UIButtonSubmitEvent
    @IBAction func UIButtonSubmitEvent(_ sender: Any) {
        
        if(validateInput() == false) {
            
            return
        }
        
        ConvertTextInputToString()
        clearInputs()
        
        view.endEditing(true)
        
        database.addEvent(eventTitle: eventInformation.eventName!, eventDescription: eventInformation.eventDescription!, eventDate: eventInformation.eventDate!, eventImage: eventInformation.eventImage!)
        
        database.listEvent()
    }
    
    // MARK: UIImagePicker
    @IBAction func UIImagePicker(_ sender: Any) {
        
           chooseSource()
       }
    
    // MARK: convertTextInputToString
    private func ConvertTextInputToString() {
        
        let tempEventName =  UITextInputEventName.text
        let tempEventDescription = UITextInputEventDescription.text
        let tempEventDate = UITextInputEventDate.text
        
        eventInformation.eventName = String(tempEventName!)
        eventInformation.eventDescription = String(tempEventDescription!)
        eventInformation.eventDate = String(tempEventDate!)
    }
    
    // MARK: clearTextFields
    private func clearInputs() {
        
        UITextInputEventName.text?.removeAll()
        UITextInputEventDescription.text?.removeAll()
        UITextInputEventDate.text?.removeAll()
        UILabelDisplayImageError.text = ""
        UILabelDisplayEventNameError.text = ""
        UILabelDisplayDescriptionError.text = ""
        UILabelDisplayDateError.text = ""
        UIImageViewDisplayImage.image = nil
    }
    
    // MARK: ValidateInput
    private func validateInput() -> Bool {
        
        if (UIImageViewDisplayImage.image == nil) {
            
            UILabelDisplayImageError.text = "Must pick an image!"
            
        }
        else {
            
            UILabelDisplayImageError.text = ""
        }
        
        if (UITextInputEventName.text == "") {
            
            UILabelDisplayEventNameError.text = "Must enter an eventname"
            
        }
        else {
            
            UILabelDisplayEventNameError.text = ""
        }
        
        if(UITextInputEventDescription.text == "") {
            
            UILabelDisplayDescriptionError.text = "Must enter a description"

        }
        else {
            UILabelDisplayDescriptionError.text = ""
        }
        
        if (UITextInputEventDate.text == "") {
            
            UILabelDisplayDateError.text = "Must enter a date"
        }
            
        else {
            
            UILabelDisplayDateError.text = ""
        }
        
        if (UIImageViewDisplayImage.image == nil || UITextInputEventName.text == "" || UITextInputEventDescription.text == "" || UITextInputEventDate.text == "") {
            
            return false
        }

        return true
    }
}

// MARK: Extensions
extension CreateEventViewController: UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: textFieldShouldreturn
    // This function makes the return button close the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    // MARK:UIImagePickerController
    //function display images to pick when clicking on the image button
    func showImagePickerController() {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // function specifing which image to be picked, eiter an edited image(cropped image by user..) or just the original image without any alterations
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
                eventInformation.eventImage = editedImage.pngData() // saves UIImage as data
                
            if let tempImg = UIImage(data: eventInformation.eventImage!) {
                // converts data to an UIImage
                UIImageViewDisplayImage.image = tempImg
            }
        }
        else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            eventInformation.eventImage = originalImage.pngData()
            
            if let tempImg = UIImage(data: eventInformation.eventImage!) {
                
                UIImageViewDisplayImage.image = tempImg
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: chooseSource
    // displays options of choosing camera or photolibrary as source
    func chooseSource() {
        
        let imagePickerController = UIImagePickerController()
        let actionSheet = UIAlertController()
        
        imagePickerController.delegate = self
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action:UIAlertAction) in
            self.showImagePickerController()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
            else {
                
                print("Camera is not available")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
}

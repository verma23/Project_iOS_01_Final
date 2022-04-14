//
//  RegisterViewController.swift
//  Project_iOS
//
//  Created by Shivanshu Verma on 2022-03-11.
//

import UIKit

class Shivanshu_RegisterViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet  var tFname: UITextField! // Textfields for User to input their Name
    
    @IBOutlet var tLname: UITextField! // Textfields for User their Last Name
     
    @IBOutlet var tEmailAdd: UITextField! // Textfields for User to enter Emaill Address
    @IBOutlet var tPnum: UITextField!   // Textfiled for entering Phone Number
    @IBOutlet var tNewPass: UITextField!   // // Textfields for User new Password
    @IBOutlet var tConfirmPass: UITextField! // // Textfields for User  to confirm the password entered in new password
    
  
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate // Connection of App Delegate with this controller
    
 
    @IBAction func addUserToDatabase(sender : Any)    // Button for adding user into Database
    {
        let person = Shivanshu_Data.init()
        person.initWithData(theRow: 0, theFname: tFname.text!, theLname: tLname.text!, theEmail: tEmailAdd.text!,thePhone: tPnum.text!, theNpass: tNewPass.text!, theConfirmpass: tConfirmPass.text!)
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        let returnCode = mainDelegate.insertIntoDatabase(person: person)
                var reutrnMSG : String = "Person Added"
                if returnCode == false{
                    reutrnMSG = "Person Add Failed"
                }
        displayMyAlerMessage(userMessage: "User added ")
        
        
    }
    
    @IBAction func RegisterUser(_ sender: Any) //Validates all the required details are submitted or not
    {
        let firstName = tFname.text;
        let lastName = tLname.text;
        let emailAddress = tEmailAdd.text;
        let phoneNum = tPnum.text;
        let newPass = tNewPass.text;
        let confirmPass = tConfirmPass.text;
        
        if(((firstName?.isEmpty) == true) || ((lastName?.isEmpty) == true) || ((emailAddress?.isEmpty) == true) || ((confirmPass?.isEmpty) == true) || ((newPass?.isEmpty) == true))
        {
            displayMyAlerMessage(userMessage: "All Fields are required")
            
            return;
    }
    if( newPass != confirmPass)
        {
        displayMyAlerMessage(userMessage: "Password Should Match")
    }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    func displayMyAlerMessage(userMessage : String) // Function to get alert messages and this function has been called at couple of lines to make code compact.
    {
        var myAlert = UIAlertController(title: "Warning", message: userMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true)
    
    }
    
    @IBAction func unwindToRegisterViewController(sender : UIStoryboardSegue)  // Function to go back
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

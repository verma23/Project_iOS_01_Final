//
//  LoginViewController.swift
//  Project_iOS
//
//  Created by Shivanshu Verma on 2022-03-11.
//

import UIKit



class Shivanshu_LoginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var userEmail: UITextField!  // Textfields for User to input their Email Address
    
    @IBOutlet var userPass: UITextField! // Textfields for User to input their Password
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate // Connection of AppDelegate to this controller
    
    @IBAction func unwindToLoginViewController(sender : UIStoryboardSegue)  // Function to go back
    {
        
    }
   
    @IBAction func CheckTextFields(_ sender: Any)  // Function to check for all the textfields are entered by user or not
    {
        let userEmailAdd = userEmail.text
        let user_Pass = userPass.text
        
        if(((userEmailAdd?.isEmpty) == true) || ((user_Pass?.isEmpty) == true))
        {
            displayMyAlerMessage(userMessage: "All Fields Are Required")
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  // Function to send email address from textfield to other controller
    {
        if let dest = segue.destination as?  Karn_MoviesListViewController{
            dest.emailbl = userEmail.text
           
            
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    @IBAction func verifyuserLogin() // Function to check the information entered are correct from Database.
    {

        var result = mainDelegate.VerifyLoginFromDatase(uEmail: userEmail.text!, uPass: userPass.text!)



        if(result == true)
        {
            
            performSegue(withIdentifier: "ViewController", sender: self)
         
        }
    }
    
    
    func displayMyAlerMessage(userMessage : String) // Alert Function to be used in the code to show alert.
    {
        var myAlert = UIAlertController(title: "App Alert", message: userMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true)
    
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

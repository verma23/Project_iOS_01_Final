//
//  Shivanshu_AccountViewController.swift
//  Project_iOS
//
//  Created by SHivanshu on 2022-04-07.
//

import UIKit

class Shivanshu_AccountViewController: UIViewController {

    
    @IBOutlet var userFullName: UILabel!  // Label for User Name
    var emailLbl : String!   // variable for Email to be reireved
    @IBOutlet var userEmailInfo: UILabel!   // Lable for user Email Address to be shown
    @IBOutlet var userNumber: UILabel!   // LAbel for user Number
    @IBOutlet var userImageOutput: UIImageView!   // Image view to show clicked and Stored Image for Database
    
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate  //Connection of the controller with App Delegate

    
    override func viewDidLoad() {
        super.viewDidLoad()

       userEmailInfo.text = emailLbl   // Retievering current user's Email Address
        mainDelegate.confirmDetails(userInfo: mainDelegate.userI!)
        
        userFullName.text = mainDelegate.user_1  // Retireved info( User's Name)
        userNumber.text = mainDelegate.user_2  // User's Number from Database
          
        mainDelegate.readForImage(userInfo: 1) // A default id to be selected
        
        
        userImageOutput.image = convertBase64ToImage(imageString: mainDelegate.user_img!)   // Retievering Image from Database
      

    }
    func convertBase64ToImage(imageString: String) -> UIImage         //Coverts Image string data to Image format
    {
        let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
        
     }
    
    @IBAction func unwindToHomeViewController(segue: UIStoryboardSegue )   // Back button Method
    {
        
        
    }

    

}

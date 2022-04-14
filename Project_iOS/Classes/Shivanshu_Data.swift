//
//  Data.swift
//  Project_iOS
//
//  Created by Shivanshu Verma on 2022-03-12.
// This class is for login and register fields

import UIKit

class Shivanshu_Data: NSObject {
    var id : Int? // Unique id for a registered and login user
    var Fname: String? // Unique String Variable to store the First name of the user into the database
    var Lname: String? // Unique String Variable to store the Last name of the user into the database
    var EmailAddress: String? // Unique String Variable to store Email Address of the user into the database
    var PhoneNumber: String?  // Unique String Variable to store phone number of the user into the database
    var newPass: String? // Unique String Variable to store New Password of the user into the database
    var confirmPass: String? // Unique String Variable to store PAssword submitted into previos textfield of the user into the database
    var imageInfo : String? // Unique String Variable to store image String of the user into the database
    
    
    // A constructor initwithdata for Saving Textfield Values into Database
    func initWithData(theRow i :Int, theFname n: String , theLname l: String, theEmail e : String, thePhone pn : String, theNpass p : String, theConfirmpass c : String ){
    id = i
    Fname = n
       Lname = l
        EmailAddress = e
        PhoneNumber = pn
        newPass = p
        confirmPass = c
       
        
    }
    // A constructor initwithdata for retrieving info from database
    func initWithDetails(theRow r : Int, theEmail em: String, theName nam : String, theNumber n : String)
    {
    id = r
    EmailAddress = em
        Fname = nam
        PhoneNumber = n
        
    }
    // A constructor initwithdata for Storing image sting into database
    func initWithImageInfo(theRow i : Int, theImageInfo img : String)
    {
        id = i
        imageInfo = img
        
    }
}

//
//  Shivanshu_PhotoViewController.swift
//  Project_iOS
//
//  Created by SHivanshu on 2022-04-07.
//

import UIKit

class Shivanshu_PhotoViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!   // Image View for Showing User clicked Picture
    @IBOutlet var buttonClick: UIButton!    // Outlet for opening Camera
    var imgStr : String!   // string varaible for Storing image string
    
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Do any additional setup after loading the view.
    }
    @IBAction func SaveToDatabase(_ sender: Any)   // Save String o image into Database
    {
        let imageStore = Shivanshu_Data.init()
        imageStore.initWithImageInfo(theRow: 0, theImageInfo: imgStr)
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        let rtCode = mainDelegate.InsertImage(imageInfo: imageStore)
        var returnMS : String = "Image Added"
        if rtCode == false
        {
            returnMS = " image Add Failed "
            
        }
    }
    @IBAction func didTapButton()     // Opens Camera
    {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present (picker,animated: true)
        
        
    }
    func convertImageToBase64(image: UIImage) -> String   //converts clicked picture into string format
    {
           let imageData = image.pngData()!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
     }

   



}
extension Shivanshu_PhotoViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)   // After click it makes camera disappear
    {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])  // Image Controller Fuctions
    {
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        else{
            return
        }
        imageView.image = image
        imgStr = convertImageToBase64(image: image)
        
    
    
        
    }
}
    

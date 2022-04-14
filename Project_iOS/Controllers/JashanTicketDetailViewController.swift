//
//  TicketDetailViewController.swift
//  Project_iOS
//  JashanGoyal
//
//  Created by Jashan Goyal on 2022-03-25.
//

import UIKit

class JashanTicketDetailViewController: UIViewController {
    
    @IBOutlet var lbName: UILabel!     // movie name label
    @IBOutlet var lbTheatre: UILabel!  // theatre label
    @IBOutlet var lbSeats: UILabel!    // ticket seats label
    @IBOutlet var lbQuantity: UILabel! // ticket quantity label
    @IBOutlet var lbType: UILabel!     // ticket type label
    @IBOutlet var lbDate: UILabel!     // ticket date label
    @IBOutlet var img: UIImageView!    // ticket image view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate

        lbName.text = mainDelegate.selectedTicketName
        lbTheatre.text = mainDelegate.selectedTicketTheatre
        lbSeats.text = mainDelegate.selectedTicketSeats
        lbQuantity.text = mainDelegate.selectedTicketQuantity
        lbType.text = mainDelegate.selectedTicketType
        lbDate.text = mainDelegate.selectedTicketDate
        img.image = UIImage(imageLiteralResourceName: mainDelegate.selectedTicketImage)
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

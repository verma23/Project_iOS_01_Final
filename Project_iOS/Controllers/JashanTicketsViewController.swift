//
//  TicketsViewController.swift
//  Project_iOS
//  JashanGoyal
//
//  Created by Jashan Goyal on 2022-03-25.
//

import UIKit

class JashanTicketsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate

    
    // sets the number of rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDelegate.tickets.count
    }
    
    //sets the height for the rows
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    @IBAction func unwindToMyTicketsViewController(segue: UIStoryboardSegue ){
        
        
    }
    // designs the cell layout
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? JashanCell ?? JashanCell(style: .default, reuseIdentifier: "cell")
        
        let rowNum = indexPath.row
        tableCell.nameLb.text = "Movie : \(mainDelegate.tickets[rowNum].moviename!)"
        tableCell.dateofBookingLb.text = "Ticket Details: \(mainDelegate.tickets[rowNum].dateTime!)"

        tableCell.movieImg.image = UIImage(imageLiteralResourceName: mainDelegate.tickets[rowNum].image!)
        tableView.backgroundView = UIImageView(image: UIImage(named: "blackBg.jpeg"))
        
        
        tableCell.accessoryType = .disclosureIndicator
        return tableCell
    }
    
    
    // determines the action when a cell is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowNum = indexPath.row
                
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        mainDelegate.selectedTicketName = mainDelegate.tickets[rowNum].moviename!
        mainDelegate.selectedTicketDate = mainDelegate.tickets[rowNum].dateTime!
        mainDelegate.selectedTicketType = mainDelegate.tickets[rowNum].ticketType!
        mainDelegate.selectedTicketSeats = mainDelegate.tickets[rowNum].seats!
        mainDelegate.selectedTicketTheatre = mainDelegate.tickets[rowNum].theatre!
        mainDelegate.selectedTicketQuantity = mainDelegate.tickets[rowNum].quantity!
        mainDelegate.selectedTicketImage = mainDelegate.tickets[rowNum].image!

        performSegue(withIdentifier: "TicketToDetailView", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print( "main delegate selected email: " + mainDelegate.selectedEmail)
        mainDelegate.readFromDataBaseBooking()
        
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

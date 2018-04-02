//
//  WeatherTableViewController.swift
//  WeatherApp
//
//  Created by Shashank Sharma on 4/2/18.
//  Copyright © 2018 Shashank Sharma. All rights reserved.
//

import UIKit
import Alamofire_SwiftyJSON
import Alamofire
import SwiftyJSON


class WeatherTableViewController: UITableViewController {
    var url = "http://api.openweathermap.org/data/2.5/forecast?zip=08817,us&APPID=e1aa078477f1ac19434eb5db3642e5c3"
    var isFirstIter = true
    var weatherJson: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData()
        self.tableView.rowHeight = 127
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var count = 0
        
        if (self.weatherJson != nil) {
            return self.weatherJson!["list"].count
        } else {
            return 0
        }
    }
    
    func getWeatherData() {
            Alamofire.request(url).responseJSON { (responseData) -> Void in
                if((responseData.result.value) != nil) {
                    self.weatherJson = (JSON(responseData.result.value!))
                }
                self.tableView.reloadData()
            }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        var humidity: String = ""
        var temp: String = ""
        var date: String = ""
        
        if(self.weatherJson != nil) {
            print(self.weatherJson!["list"][indexPath.row])
            humidity  = String(describing: self.weatherJson!["list"][indexPath.row]["main"]["humidity"])
            temp  = String(describing: self.weatherJson!["list"][indexPath.row]["main"]["temp"])
            date = String(describing: self.weatherJson!["list"][indexPath.row]["dt_txt"])
            date = String(date[..<date.index(date.startIndex, offsetBy: 10)])
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! TableViewCell

        cell.setUpCell(humidity: humidity, temp: temp, date: date)
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

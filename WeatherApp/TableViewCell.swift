//
//  TableViewCell.swift
//  WeatherApp
//
//  Created by Shashank Sharma on 4/2/18.
//  Copyright © 2018 Shashank Sharma. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(humidity: String, temp: String, date: String) {
        humidityLabel.text = "Humidity: \(humidity)"
        tempLabel.text = "Temperature: \(temp)"
        dateLabel.text = "Date: \(date)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

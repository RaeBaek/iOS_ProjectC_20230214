//
//  CityCell.swift
//  iOS_ProjectC_20230214
//
//  Created by 백래훈 on 2023/02/14.
//

import UIKit

class CityCell: UITableViewCell {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var celAndFahLabel: UILabel!
    @IBOutlet weak var rainfallPerLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}


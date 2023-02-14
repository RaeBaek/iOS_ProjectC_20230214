//
//  CountryCell.swift
//  iOS_ProjectC_20230214
//
//  Created by 백래훈 on 2023/02/14.
//

import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet weak var nationalFlagImageView: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

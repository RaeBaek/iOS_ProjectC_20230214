//
//  DetailViewController.swift
//  iOS_ProjectC_20230214
//
//  Created by 백래훈 on 2023/02/15.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var celAndFahLabel: UILabel!
    @IBOutlet weak var rainfallPerLabel: UILabel!
    
    var cityKoreanName: String?
    var weather: String?
    var celAndFah: String?
    var rainfallPer: String?
    
    //MARK: - Methods
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationControllerLayout()
        self.weatherInfo()
    }
    
//    func navigationControllerLayout() {
//        if let countryName = countryKoreanName {
//            self.navigationItem.title = countryName
//        } else {
//            return
//        }
//        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    
    func weatherCase(weather: String) -> String {
        print(weather)
        switch weather {
        case "sunny":
            return "해"
        case "cloudy":
            return "구름"
        case "rainy":
            return "비"
        case "snowy":
            return "눈"
        default:
            return "?"
        }
    }
    
    func weatherInfo() {
        if let weather = weather, let cityKoreanName = cityKoreanName, let celAndFah = celAndFah, let rainfallPer = rainfallPer {
            self.navigationItem.title = cityKoreanName
            self.weatherImageView.image = UIImage(named: weather)
            self.weatherLabel.text = self.weatherCase(weather: weather)
            self.celAndFahLabel.text = celAndFah
            self.rainfallPerLabel.text = rainfallPer
        } else {
            return
        }
        
        
    }
}

//
//  CountryListViewController.swift
//  iOS_ProjectC_20230214
//
//  Created by 백래훈 on 2023/02/14.
//

import UIKit

class CityListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var countryKoreanName: String?
    var countryAssetName: String?
    let cellIdentifier = "CityCell"
    var cities: [City] = []
    
    //MARK: - Methods
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.navigationControllerLayout()
        self.jsonDecoding()
    }
    
    func navigationControllerLayout() {
        if let countryName = countryKoreanName {
            self.navigationItem.title = countryName
        } else {
            return
        }
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func jsonDecoding() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        if let countryName = countryAssetName {
            print(countryName)
            guard let dataAsset: NSDataAsset = NSDataAsset(name: countryName) else {
                return
            }
            do {
                print("성공: " + countryName)
                self.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
            } catch {
                print("실패: " + error.localizedDescription)
            }
        } else {
            print("옵셔널 바인딩 실패")
        }
        self.tableView?.reloadData()
    }
    
    func stateToWeather(state: Int) -> String {
        var weather: String
        switch state {
        case 10:
            weather = "sunny"
        case 11:
            weather = "cloudy"
        case 12:
            weather = "rainy"
        case 13:
            weather = "snowy"
        default:
            weather = "error"
        }
        return weather
    }
}

extension CityListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CityCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CityCell
        
        cell.weatherImageView.image = UIImage(named: self.stateToWeather(state: cities[indexPath.row].state))
        cell.cityNameLabel.text = cities[indexPath.row].cityName
        cell.celAndFahLabel.text = cities[indexPath.row].celAndFah
        cell.rainfallPerLabel.text = cities[indexPath.row].rainfallPercent
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        nextViewController.cityKoreanName = cities[indexPath.row].cityName
        nextViewController.weather = self.stateToWeather(state: cities[indexPath.row].state)
        nextViewController.celAndFah = cities[indexPath.row].celAndFah
        nextViewController.rainfallPer = cities[indexPath.row].rainfallPercent
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

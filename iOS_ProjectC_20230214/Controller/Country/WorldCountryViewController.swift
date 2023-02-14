//
//  ViewController.swift
//  iOS_ProjectC_20230214
//
//  Created by 백래훈 on 2023/02/14.
//

import UIKit

class WorldCountryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "CountryCell"
    var countries: [Country] = []
    
    //MARK: - Methods
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationControllerLayout()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.jsonDecoding()
    }
    
    func navigationControllerLayout() {
        self.navigationItem.title = "세계날씨"
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(red: 72/255, green: 145/255, blue: 221/255, alpha: 1.0)
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func jsonDecoding() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do {
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        self.tableView?.reloadData()
    }
    
    //    private func registerXib() {
    //        let nibName = UINib(nibName: self.cellIdentifier, bundle: nil)
    //        tableView.register(nibName, forCellReuseIdentifier: self.cellIdentifier)
    //    }
}

extension WorldCountryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountryCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CountryCell
        
        cell.nationalFlagImageView.image = UIImage(named: "flag_\(countries[indexPath.row].assetName)")
        cell.countryName.text = countries[indexPath.row].koreanName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            guard let nextViewController: CityListViewController = segue.destination as? CityListViewController else {
//                return
//            }
//            guard let cell: CountryCell = sender as? CountryCell else {
//                return
//            }
//            nextViewController.countryCode = countries[indexPath.row].assetName
//        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let nextViewController = storyboard?.instantiateViewController(withIdentifier: "CityListViewController") as? CityListViewController else { return }
        nextViewController.countryKoreanName = countries[indexPath.row].koreanName
        nextViewController.countryAssetName = countries[indexPath.row].assetName
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

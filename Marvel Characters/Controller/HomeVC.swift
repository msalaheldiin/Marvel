//
//  Home.swift
//  Marvel Characters
//
//  Created by Mahmoud Salaheldin on 3/8/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import UIKit
import Moya_ModelMapper
class HomeVC: UIViewController {
    var CharList : DataClass!
    @IBOutlet weak var charTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = UIImageView(image: UIImage(named: "Marvel"))
        charTabelView.delegate = self
        charTabelView.dataSource = self
        charTabelView.registerNib(cell: CharCell.self)
        getCharDetails()
        searchbutton()
    }
    private func searchbutton(){
        let btnSearch = UIButton(frame: CGRect(x: 0, y: 0, width: 28, height: 28))
        btnSearch.setImage(UIImage(named: "icSearch"), for: .normal)
        btnSearch.backgroundColor = UIColor.clear
        btnSearch.layer.masksToBounds = true
        btnSearch.addTarget(self, action: #selector(searchBtnPressed), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btnSearch)
    }
    @objc private func searchBtnPressed(){
        let nextViewController = K_MainStoryboard.instantiateViewController(withIdentifier: "searchVC") as! SearchVC
        nextViewController.CharList = self.CharList
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    private func getCharDetails() {
        charProvider.request(.getCharacterResult) {(result) in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    do {
                        self.CharList = try response.map(to: DataClass.self,keyPath: "data")
                        DispatchQueue.main.async {
                            self.charTabelView.reloadData()
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            case .failure (let error):
                print(error.errorDescription as Any)
            }
        }
    }
}
extension HomeVC : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if CharList != nil {
            return CharList.results?.count ?? 0
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as CharCell
        
        if let char = CharList.results?[indexPath.row]{
            let imageUrl =  "\( char.thumbnail?.path ?? "").\(char.thumbnail?.thumbnailExtension ?? "")"
            cell.configureCell(name: char.name! , image:imageUrl )
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = K_MainStoryboard.instantiateViewController(withIdentifier: "detailsVC") as! DetailsVC
        if let charDetails = CharList.results?[indexPath.row]{
            detailsVC.charDetails = charDetails
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
        
    }
}

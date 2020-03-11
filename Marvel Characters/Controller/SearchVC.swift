//
//  SearchVV.swift
//  Marvel Characters
//
//  Created by Mahmoud Salaheldin on 3/9/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchTableView: UITableView!
    var CharList : DataClass!
    var result = [Result]()
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVC()
    }
    
    fileprivate func initVC() {
        navigationItem.hidesBackButton = true
        searchTableView.registerNib(cell: SearchCell.self)
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchBar.delegate = self
        configureSearchBar()
        cancelbutton()
    }
    func configureSearchBar(){
        searchBar.delegate = self
        searchBar.placeholder = "search"
        if #available(iOS 11.0, *) {
            searchBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
            if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
                if let backgroundview = textfield.subviews.first {
                    textfield.backgroundColor = .white
                    textfield.becomeFirstResponder()
                    backgroundview.layer.cornerRadius = 18
                    backgroundview.clipsToBounds = true
                }
            }
        }
        navigationItem.titleView = searchBar
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        result = (CharList.results?.filter({ (s:Result)  -> Bool in
            return (s.name?.lowercased().range(of: searchText.lowercased()) != nil)
        }))!
        searchTableView.reloadData()
    }
}
extension SearchVC : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if result.count > 0 {
            return result.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as SearchCell
        let char = result[indexPath.row]
        
        let imageUrl = "\( char.thumbnail?.path ?? "").\(char.thumbnail?.thumbnailExtension ?? "")"
        cell.configureCell(name: char.name! , image: imageUrl  )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = K_MainStoryboard.instantiateViewController(withIdentifier: "detailsVC") as! DetailsVC
        let charDetails = result[indexPath.row]
        detailsVC.charDetails = charDetails
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
    }
}

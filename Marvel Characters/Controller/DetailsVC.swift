//
//  DetailsVC.swift
//  Marvel Characters
//
//  Created by Mahmoud Salaheldin on 3/8/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController  {
    var charDetails : Result!
   
    @IBOutlet weak var detailsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        detailsTableView.registerNib(cell: DetailsCell.self)
        detailsTableView.registerNib(cell: StoryCollection.self)
        detailsTableView.registerNib(cell: DisclosureCell.self)
        
        
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
           self.navigationController?.popViewController(animated: true)
       }
}

extension DetailsVC : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1 :
            return
                charDetails.urls?.count ?? 0
        default:
            return 0
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
              switch indexPath.row {
                    case 0:
                        let detailsCell = tableView.dequeue() as DetailsCell
                        if let charDetails = charDetails
                        {
                            let imageUrl = "\( charDetails.thumbnail?.path ?? "").\(charDetails.thumbnail?.thumbnailExtension ?? "")"
                            detailsCell.configureDetailsCell(image:imageUrl
                                , name: charDetails.name ?? "", description: charDetails.description ?? "No description Available")
                        }
                        return detailsCell
                        
                    case 1 :
                        let comic = tableView.dequeue() as StoryCollection
                        comic.configureComicCell(comics: charDetails.comics?.items ?? [] ,title: "comics")
                        return comic
                    case 2 :
                        let seriesCell = tableView.dequeue() as StoryCollection
                        seriesCell.configureseriesCell(series: charDetails.series?.items ?? [] , title: "series")
                        return seriesCell
                    case 3 :
                        let storyCell = tableView.dequeue() as StoryCollection
                         storyCell.configurestoriesCell(stories: charDetails.stories?.items ?? [], title: "Stories")
                        return storyCell
                    case 4 :
                        let eventCell = tableView.dequeue() as StoryCollection
                        eventCell.configureEventCell(events: charDetails.events?.items ?? [], title: "Events")
                        return eventCell
              default:
                return UITableViewCell()
            }
        case 1 :
            let disclusureCell = tableView.dequeue() as DisclosureCell
            disclusureCell.textLabel?.text = charDetails.urls?[indexPath.row].type
            return disclusureCell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row{
                    case 0 :
                        return UITableView.automaticDimension
                    case 1:
                        return charDetails.comics?.items?.count != 0 ? 225 : 0
                    case 2 :
                        return charDetails.series?.items?.count != 0 ? 225 : 0
                    case 3 :
                        return charDetails.stories?.items?.count != 0 ? 225 : 0
                    case 4 :
                        return charDetails.events?.items?.count != 0 ? 225 : 0
        default:
            return UITableView.automaticDimension
        }
        case 1:
             return charDetails.urls?.count != 0 ? 60 : 0
        default:
        return UITableView.automaticDimension
        }

    }
}

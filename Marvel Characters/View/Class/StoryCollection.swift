//
//  storyCollection.swift
//  Marvel Characters
//
//  Created by Mahmoud Salaheldin on 3/10/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import UIKit

class StoryCollection: UITableViewCell {
    
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet weak var stroyCollectionView: UICollectionView!
    var comics = [ComicsItem]()
    var series = [ComicsItem]()
    var events = [ComicsItem]()
    var stories = [StoriesItem]()
    var iscomic = false
    var isseries = false
    var isevent = false
    var isstories = false
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        stroyCollectionView.dataSource = self
        stroyCollectionView.delegate = self
        stroyCollectionView.showsHorizontalScrollIndicator = false
        stroyCollectionView.register(UINib.init(nibName:NibNames.StoryCell, bundle: nil), forCellWithReuseIdentifier: NibNames.StoryCell)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configureComicCell(comics: [ComicsItem], title :String) {
        self.comics = comics
        iscomic = true
        isseries = false
        isstories = false
        isevent = false
        titleLbl.text = title
        stroyCollectionView.reloadData()
    }
    
    func configureseriesCell(series: [ComicsItem], title :String) {
        self.series = series
        titleLbl.text = title
        iscomic = false
        isseries = true
        isstories = false
        isevent = false
        stroyCollectionView.reloadData()
    }
    
    func configurestoriesCell(stories: [StoriesItem], title :String) {
        self.stories = stories
        titleLbl.text = title
        iscomic = false
        isseries = false
        isstories = true
        isevent = false
        stroyCollectionView.reloadData()
    }
    
    func configureEventCell(events: [ComicsItem], title :String) {
        self.events = events
        titleLbl.text = title
        iscomic = false
        isseries = false
        isstories = false
        isevent = true
        stroyCollectionView.reloadData()
    }
}
extension StoryCollection : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if iscomic{
            return comics.count}
        else if isseries{
            return series.count
        }
        else if  isstories {
            return stories.count
        }
        else if isevent {
            return events.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let storycell = stroyCollectionView.dequeueReusableCell(withReuseIdentifier: NibNames.StoryCell, for: indexPath) as? StoryCell
            else {return UICollectionViewCell() }
        if  iscomic {
            storycell.configureStoryCell(image: comics[indexPath.item].resourceURI ?? "" , name :comics[indexPath.item].name ?? "")
        }
        else if isseries {
            storycell.configureStoryCell(image: series[indexPath.item].resourceURI ?? "" , name :series[indexPath.item].name ?? "")
        }
        else if isstories {
            storycell.configureStoryCell(image: stories[indexPath.item].resourceURI ?? "", name : stories[indexPath.item].name ?? "" )
        }
        else if isevent {
            storycell.configureStoryCell(image: events[indexPath.item].resourceURI ?? "", name : events[indexPath.item].name ?? "" )
        }
        return storycell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: collectionView.bounds.width/3.15, height: collectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


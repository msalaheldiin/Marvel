//
//  Character.swift
//  Marvel Characters
//
//  Created by Mahmoud Salaheldin on 3/9/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//


import Mapper
// MARK: - DataClass
class DataClass: Mappable {
    var offset, limit, total, count: Int?
    var results: [Result]?
    required init(map: Mapper) throws{
    offset = try? map.from("offset") ?? 0
    limit = try? map.from("limit") ?? 0
    total = try? map.from("total") ?? 0
    count = try? map.from("count") ?? 0
    results = try? map.from("results")
}
}

// MARK: - Result
class Result: Mappable {
    var id: Int?
    var name : String?
    var description: String?
    var modified: String?
    var thumbnail: Thumbnail?
    var resourceURI: String?
    var comics , series, events : Comics?
    var stories: Stories?
    var urls: [URLElement]?
    
    required init(map: Mapper) throws{
        id = try? map.from("id") ?? 0
        name = try? map.from("name") ?? ""
        description = try? map.from("description") ?? ""
        modified = try? map.from("modified") ?? ""
        thumbnail = try? map.from("thumbnail")
        resourceURI = try? map.from("resourceURI") ?? ""
        comics = try? map.from("comics")
        series = try? map.from("series")
        stories = try? map.from("stories")
        events = try? map.from("events")
        urls = try? map.from("urls")
    }
}

// MARK: - Comics
class Comics: Mappable{
    var available: Int?
    var collectionURI: String?
    var items: [ComicsItem]?
    var returned: Int?
    
    required init(map: Mapper) throws{
           available = try? map.from("available") ?? 0
           collectionURI = try? map.from("collectionURI") ?? ""
           items = try? map.from("items")
           returned =  try? map.from("returned")

 }
}

// MARK: - ComicsItem
class ComicsItem: Mappable {
    var resourceURI: String?
    var name: String?
    required init(map: Mapper) throws {
    resourceURI = try? map.from("resourceURI") ?? ""
    name = try? map.from("name") ?? ""
}
    }

// MARK: - Stories
class Stories: Mappable {
    var available: Int?
    var collectionURI: String?
    var items: [StoriesItem]?
    var returned: Int?
    required init(map: Mapper) throws {
        available = try? map.from("available") ?? 0
        collectionURI = try? map.from("collectionURI") ?? ""
        items = try? map.from("items")
        returned = try? map.from("path") ?? 0
    }
}

// MARK: - StoriesItem
class StoriesItem: Mappable {
    var resourceURI: String?
    var name: String?
    var type: String?
    required init(map: Mapper) throws{
        resourceURI = try? map.from("resourceURI") ?? ""
        name = try? map.from("name") ?? ""
        type = try? map.from("type") ?? ""
        
    }
}


// MARK: - Thumbnail
class Thumbnail: Mappable {
    var path: String?
    var thumbnailExtension: String?
    required init(map: Mapper) throws{
         path = try? map.from("path") ?? ""
        thumbnailExtension = try? map.from("extension") ?? ""
    }
}

// MARK: - URLElement
class URLElement: Mappable {
    var type: String?
    var url: String?
    required init(map: Mapper) throws{
        type = try? map.from("type") ?? ""
        url = try? map.from("url") ?? ""
}
}


















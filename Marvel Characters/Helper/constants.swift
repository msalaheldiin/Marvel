//
//  constants.swift
//  Marvel Characters
//
//  Created by Mahmoud Salaheldin on 3/9/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//

import Moya
struct URLs {
    static let baseURL = "http://gateway.marvel.com/v1/public/"
    static let charURL = "characters"
}

struct Constants {
    static let apiKey = "0d229e8844a051706315859e6497a56a"
    static let privateKey = "7b7dc68e2f8b25faa9e27f581ef136c6b62c63a2"
}
let charProvider = MoyaProvider<CharacterService>()
let K_MainStoryboard = UIStoryboard(name: "Main", bundle: nil)


struct NibNames {
static let StoryCell = "StoryCell"
 }

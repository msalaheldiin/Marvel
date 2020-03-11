//
//  Network Service.swift
//  Marvel Characters
//
//  Created by Mahmoud Salaheldin on 3/8/20.
//  Copyright © 2020 Mahmoud Salaheldin. All rights reserved.
//
import Moya
enum CharacterService {
    case getCharacterResult
}
extension CharacterService : TargetType {
    var baseURL: URL {
        switch self {
        case .getCharacterResult:
            return URL(string: URLs.baseURL as String)!
        }
    }
    var path: String {
        switch self {
        case .getCharacterResult:
            return URLs.charURL
        }
    }
    var method: Moya.Method {
        switch self {
        case .getCharacterResult:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    var parameters: [String: Any]? {
        switch self {
        case .getCharacterResult:
            var parameters = [String: Any]()
            parameters["ts"] = "1"
            parameters["apikey"] = Constants.apiKey
            parameters["hash"] = "1\(Constants.privateKey)\(Constants.apiKey)".md5
            return parameters
        }
    }
    var headers: [String: String]? {
        switch self {
        case .getCharacterResult:
            return nil
        }
    }
    var task: Task {
        switch self {
       default:
            return .requestParameters(parameters: parameters!, encoding: URLEncoding.default)
        }
    }

}



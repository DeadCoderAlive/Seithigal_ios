//
//  Constants.swift
//  Seithigal
//
//  Created by Srinivasan Sundaramoorthy on 8/17/17.
//  Copyright © 2017 Srinivasan Sundaramoorthy. All rights reserved.
//

import Foundation

class Config {
    //news api props
   static let urlArticles = "newsapi_url_articles"
    static let urlSources = "newsapi_url_sources"
     static let newsApiKey = "newsapi_apikey"
    
    static var SGonfig:NSDictionary {
        if let path = Bundle.main.path(forResource: "config", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            return dict as NSDictionary
        } else {
            return NSDictionary()
        }
    }
    
    //MARK: Get Values
    static func valueFor(key:String) -> String {
        return SGonfig[key] as! String
    }

}

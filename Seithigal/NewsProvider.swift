//
//  NewsProvider.swift
//  Seithigal
//
//  Created by Srinivasan Sundaramoorthy on 8/17/17.
//  Copyright © 2017 Srinivasan Sundaramoorthy. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import SwiftyJSON

class NewsProvider {
    //
    static func getRecentArticleForSource(source:String,callback: @escaping (JSON)->Void){
//        let url:URL = URL(string:Config.valueFor(key: Config.urlArticles))!
        let apiKey = Config.valueFor(key: Config.newsApiKey)
        let params:[String:String] = ["apiKey":apiKey,"sortBy":"latest","source":source]
        Alamofire.request(
            URL(string:"https://newsapi.org/v1/articles?apiKey=\(apiKey)&sortBy=latest&source=\(source)")!,
            method:.get,
            parameters:params).validate().responseJSON { response in
            switch response.result{
            case .success:
                print("success")
                print(response)
                callback(JSON(response.result.value ?? JSON("")))
            case .failure(let error):
                print("failure"+error.localizedDescription)
                callback(JSON(error))
        }
        }
    }
    
    static func getSourcesList(callback:@escaping (JSON)->Void){
        Alamofire.request("\(Config.valueFor(key: Config.urlSources))?language=en").validate().responseJSON {
            response in
            switch response.result{
            case .success:
                callback(JSON(response.result.value ?? JSON("")))
            case .failure(let error):
                callback(JSON(error))
            }
        }
    }
   
}

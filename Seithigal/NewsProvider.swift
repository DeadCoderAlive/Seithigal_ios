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
        Alamofire.request("\(Config.valueFor(key: Config.urlArticles))?source=\(source)&sortBy=latest&apiKey=\(Config.valueFor(key: Config.newsApiKey))").validate().responseJSON { response in
            switch response.result{
            case .success:
                callback(JSON(response.result.value ?? JSON("")))
            case .failure(let error):
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

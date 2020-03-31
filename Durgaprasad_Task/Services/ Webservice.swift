
//
//   Webservice.swift
//  DurgaprasadTask


import Foundation
import UIKit
typealias JSONDictionary = [String:Any]

class Webservice {
    
    func loadSources(completion :@escaping ([ModalList],_ title:String) -> ()) {
        var request: URLRequest = URLRequest(url: URL(string: Apis.url)!)
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // Request the data
        let session: URLSession = URLSession.shared
        Indicator.shared.show()
        let task = session.dataTask(with: request) { (data, response, error) in
            Indicator.shared.hide()
            print(response)
            // Did we get an error?
            guard error == nil else {
                print(error!)
                return
            }
            guard let json = data else {
                print("No data")
                return
            }
            
            guard json.count != 0 else {
                print("Zero bytes of data")
                return
            }
            let data = (String(decoding: json, as: UTF8.self))
            print(String(decoding: json, as: UTF8.self))
            let sourceDictionary = data.convertToDictionary()
            
            //Set navigation Title ::
            
            let navTitle = sourceDictionary["title"] as? String ?? ""

            let dictionaries = sourceDictionary["rows"] as! [JSONDictionary]
          let sources = dictionaries.compactMap(ModalList.init)
                                    DispatchQueue.main.async {
                                        completion(sources,navTitle)
                                    }
            
        }
        task.resume()
    }
}

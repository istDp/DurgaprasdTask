//
//  Constants.swift
//  Headlines
//
//  Created by Mohammad Azam on 11/20/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit


//MARK:: Extension for String to convert to Dictionary

extension String {
    func convertToDictionary() -> JSONDictionary {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? [:]
            } catch {
                print(error.localizedDescription)
            }
        }
        return [:]
    }
}
//MARK:: Extension for images to load  to laod images dynamically

extension UIImageView{
    func setImageFromUrl(ImageURL :String) {
        URLSession.shared.dataTask( with: NSURL(string:ImageURL)! as URL, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                if let data = data {
                    self.image = UIImage(data: data)
                }else{
                    self.image = UIImage()
                }
            }
        }).resume()
    }
}


struct Cells {
    static let source = "CustomTableViewCell"
}
struct Apis {
    static let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
}





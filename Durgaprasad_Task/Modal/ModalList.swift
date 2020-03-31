//
//  ModalList.swift

import Foundation


class ModalList:NSObject{
    var title :String!
    var desc :String!
    var imageHref :String!
   
    init?(dictionary :JSONDictionary) {
        
        if  let title = dictionary["title"] as? String{
            self.title = title
        }
        if let desc = dictionary["description"] as? String {
            self.desc = desc
        }
        if let imageHref = dictionary["imageHref"] as? String{
            self.imageHref = imageHref
        }
    }
}

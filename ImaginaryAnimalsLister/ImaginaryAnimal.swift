//
//  ImaginaryAnimal.swift
//  ImaginaryAnimalsLister
//
//  Created by Charlie Williams on 14/09/2015.
//  Copyright © 2015 Charlie Williams. All rights reserved.
//

import Foundation

struct ImaginaryAnimal {
    var name: String
    var height: Float
    var location: String
    var dateLastSeen: String
    var imageURL: NSURL?
    
    init?(fromJSON json: AnyObject) {
        
        guard let json = json as? [String:AnyObject] else {
            return nil
        }
        
        name = json["name"] as! String
        height = json["height"] as! Float
        location = json["location"] as! String
        dateLastSeen = json["dateLastSeen"] as! String
        
        if let imageURLString = json["imageURL"] as? String {
            imageURL = NSURL(string: imageURLString)
        }
    }
}
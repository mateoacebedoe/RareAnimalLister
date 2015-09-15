//
//  AnimalsLoader.swift
//  ImaginaryAnimalsLister
//
//  Created by Charlie Williams on 14/09/2015.
//  Copyright © 2015 Charlie Williams. All rights reserved.
//

import Foundation

struct AnimalsLoader {
    
    func loadAnimals() -> [ImaginaryAnimal] {
        
        var retArr = [ImaginaryAnimal]()
        
        guard let url = NSBundle.mainBundle().URLForResource("Animals", withExtension: "json"),
            let data = NSData(contentsOfURL: url),
            let jsonArray = try? NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions(rawValue: 0)) as? [AnyObject] else {
                    return retArr
        }
        
        if let jsonArray:[AnyObject] = jsonArray {
            for animalJSON in jsonArray {
                if let animal = ImaginaryAnimal(fromJSON: animalJSON) {
                    retArr.append(animal)
                }
            }
        }
//            for (let obj in jso)
          return retArr
    }
}
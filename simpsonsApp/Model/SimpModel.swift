//
//  altSimpModel.swift
//  simpsonsApp
//
//  Created by C02PX1DFFVH5 on 12/4/18.
//  Copyright © 2018 C02PX1DFFVH5. All rights reserved.
//

import Foundation

class SimpModel : Codable  {
    let result : String
    let text : String
    let icon : Icon
    let firstURL : String
    var image : Data?
    
    enum CodingKeys : String, CodingKey {
        case result = "Result"
        case text = "Text"
        case icon = "Icon"
        case firstURL = "FirstURL"
       
    }
    
    init(result: String, text: String, icon: Icon, firstURL: String) {
        self.result = result
        self.text = text
        self.icon = icon
        self.firstURL = firstURL
    }

}

class Icon: Codable {
    let width: String
    let height: String
    let url: String
    
    enum CodingKeys : String, CodingKey {
        case width = "Width"
        case height = "Height"
        case url = "URL"
    }
    
    init(width: String, height: String, url: String) {
        self.width = width
        self.height = height
        self.url = url
    }

}


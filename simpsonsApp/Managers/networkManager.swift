//
//  networkManager.swift
//  simpsonsApp
//
//  Created by C02PX1DFFVH5 on 12/3/18.
//  Copyright © 2018 C02PX1DFFVH5. All rights reserved.
//

import Foundation

typealias SimpsonsReturnClosure = (([SimpModel]) -> ())


class networkManager {
    
   
    private let imageCache = NSCache<NSString, NSData>()
    
    
    static let shared = networkManager()
    let someURL = URL(string: "https://api.duckduckgo.com/?q=simpsons+characters&format=json")
    
    func downloadJSON(_ completion: @escaping SimpsonsReturnClosure) {
        guard let useURL = someURL else {return}
        URLSession.shared.dataTask(with: useURL) { Data, URLResponse, Error in
            guard let data = Data, URLResponse != nil, Error == nil else {
                print("Going wrong somewhere")
                return
                
            }
            print("Downloaded")
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data,
                                                                options: .mutableLeaves) as! [String:Any]
                let relatedTopics = jsonData["RelatedTopics"] as! [[String:Any]]
                
                let relatedTopicsData = try JSONSerialization.data(withJSONObject: relatedTopics,
                                                                   options: JSONSerialization.WritingOptions.prettyPrinted)
                
                let decoder = JSONDecoder()
                let simpData = try decoder.decode([SimpModel].self, from: relatedTopicsData)
                completion(simpData)
               
                
            
            }
            catch { print(error) }
            }.resume()
        
    }
    
    func downloadSimpImage(_ Simpson: SimpModel, _ completion: @escaping (Data?) -> ()) {
        let URLString = Simpson.icon.url
        
        if let data = self.imageCache.object(forKey: NSString(string: URLString)) {
            completion(Data(referencing: data))
            return
        }
       
        guard let newURL = URL(string: URLString) else { return }
        URLSession.shared.dataTask(with: newURL,
                                   completionHandler: { (data, response, error) in
                                    guard let safeData = data else {
                                        completion(nil)
                                        return
                                    }
                                    self.imageCache.setObject(NSData(data: safeData),
                                                              forKey: NSString(string: URLString))
                                    Simpson.image = safeData
                                    completion(safeData)
        }).resume()
    }
    
    func getSimpImage(_ Simpson: SimpModel,
                      _ completion: @escaping (Data?) -> ()) {
        let URLString = Simpson.icon.url
        if (URLString == "") {
            completion(nil)
            return
        }
        if let data = self.imageCache.object(forKey: NSString(string: URLString)) {
            completion(Data(referencing: data))
        }
        else {
            self.downloadSimpImage(Simpson, completion)
        }
    }
}

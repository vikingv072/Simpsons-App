//
//  simpViewModel.swift
//  simpsonsApp
//
//  Created by C02PX1DFFVH5 on 12/3/18.
//  Copyright © 2018 C02PX1DFFVH5. All rights reserved.
//

import Foundation

class SimpViewModel {
    
    var imgData : Data? = Data()
    var updateViews: (() -> ())?
    var chars = [SimpModel]() {
        didSet {
            self.updateViews?()
        }
    }
    
    func loadChar() {
        networkManager.shared.downloadJSON() { [unowned self] (downloadedSimpsons) in
            self.chars.append(contentsOf: downloadedSimpsons)
        }
    }
    
    var numberOfChar: Int {
        return self.chars.count
    }
    
    func inputText(_ index : Int) -> String {
        let SimpChar = self.chars[index]
        let simpText = SimpChar.text
        return simpText
        
    }
    
    func simImDown(_ index : Int) ->  Data? {
        let simCh =  self.chars[index]
        networkManager.shared.getSimpImage(simCh) {[weak self] (imagedata) in
            DispatchQueue.main.async {
                self?.imgData = imagedata
            }
            
        }
        return self.imgData
    
    }
    
}




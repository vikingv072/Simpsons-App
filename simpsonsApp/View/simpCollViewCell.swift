//
//  simpCollViewCell.swift
//  simpsonsApp
//
//  Created by C02PX1DFFVH5 on 12/5/18.
//  Copyright © 2018 C02PX1DFFVH5. All rights reserved.
//

import UIKit

class simpCollViewCell: UICollectionViewCell {
    
    @IBOutlet weak var simpImage: UIImageView!
    var imageD : Data? = Data()
 
    func configure(with character: SimpModel) {
        networkManager.shared.getSimpImage(character) { [weak self] (imageData) in
            DispatchQueue.main.async {
                self?.simpImage.contentMode = .scaleAspectFit
                self?.imageD = imageData
                
                if imageData != nil {
                    self?.simpImage.image = UIImage(data: imageData!)
                    
                }
                else {
                    self?.simpImage.image = UIImage(named: "Qmark??")
                }
            }
        }
        
    }
    
}
    


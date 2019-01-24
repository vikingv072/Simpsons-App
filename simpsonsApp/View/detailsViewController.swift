//
//  detailsViewController.swift
//  simpsonsApp
//
//  Created by C02PX1DFFVH5 on 11/30/18.
//  Copyright © 2018 C02PX1DFFVH5. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {

    @IBOutlet weak var detlbl: UILabel!
    @IBOutlet weak var detImage: UIImageView!
    @IBOutlet weak var detLabel: UILabel!
    
    private var detViewModel : SimpViewModel!
    var detImgD : Data? = Data()
    var detText = ""
    var detText2 = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.detImage.contentMode = .scaleAspectFit
        self.detLabel.numberOfLines = 0
        self.setupSimpsonDetails()
        
    }
    
    func setupSimpsonDetails() {
        self.detViewModel = SimpViewModel()
        detLabel.text = detText2
        detlbl.text = detText
        DispatchQueue.main.async {
            if self.detImgD != nil  {
                self.detImage.image = UIImage(data: self.detImgD!)
            } else {
                self.detImage.image = UIImage(named: "Qmark??")
                
            }
        }
        
        
        
    }

}





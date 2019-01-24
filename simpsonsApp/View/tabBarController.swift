//
//  tabBarController.swift
//  simpsonsApp
//
//  Created by C02PX1DFFVH5 on 12/4/18.
//  Copyright © 2018 C02PX1DFFVH5. All rights reserved.
//

import UIKit

class tabBarController: UITabBarController {
    
    private var viewModel: SimpViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        
    }
    
    private func setupViewModel() {
        self.viewModel = SimpViewModel()
        self.viewModel.loadChar()
    }

   

}

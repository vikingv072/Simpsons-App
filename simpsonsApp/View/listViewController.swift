//
//  listViewController.swift
//  simpsonsApp
//
//  Created by C02PX1DFFVH5 on 11/30/18.
//  Copyright © 2018 C02PX1DFFVH5. All rights reserved.
//

import UIKit

class listViewController: UIViewController {

    @IBOutlet weak var listTable: UITableView!
    
    private let cellgames = "simpCell"
    private var listViewModel : SimpViewModel!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupListViewModel()
        self.setupTableView()
    }
    
    private func setupListViewModel() {
        self.listViewModel = SimpViewModel()
        self.listViewModel.loadChar()
        self.listViewModel.updateViews = {
            DispatchQueue.main.async {
                self.listTable.reloadData()
            }
            
        }
    }
    
    
    private func setupTableView() {
        self.listTable.delegate = self
        self.listTable.dataSource = self
        self.listTable.register(UITableViewCell.self,
                                forCellReuseIdentifier: cellgames)
        
    }
}
    
    

extension listViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listViewModel.numberOfChar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellgames,
                                                 for: indexPath)
        
        var xs = self.listViewModel.inputText(indexPath.row).components(separatedBy: "-")
        cell.textLabel?.text = xs[0]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewCont = storyboard?.instantiateViewController(withIdentifier: "detailsViewController" ) as? detailsViewController
        
        var xImd = self.listViewModel.simImDown(indexPath.row)
        DispatchQueue.main.async {
            viewCont?.detImgD = xImd
        }
        
        
        var dummy = self.listViewModel.inputText(indexPath.row).components(separatedBy: "-")
        viewCont?.detText = dummy[0]
        
        if dummy.count > 2 {
            for i in 0..<dummy.count {
                viewCont?.detText2 = (viewCont?.detText2)! + dummy[i]
            }
        } else {
            viewCont?.detText2 = dummy[1]
            }
            self.navigationController?.pushViewController(viewCont!, animated: true)
        
    }
}

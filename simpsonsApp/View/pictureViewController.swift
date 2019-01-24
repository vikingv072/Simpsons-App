//
//  pictureViewController.swift
//  simpsonsApp
//
//  Created by C02PX1DFFVH5 on 11/30/18.
//  Copyright © 2018 C02PX1DFFVH5. All rights reserved.
//

import UIKit

class pictureViewController: UIViewController {

    @IBOutlet weak var collTable: UICollectionView!
    
    private let cellgames = "Simpcell2"
    private var collViewModel : SimpViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupColView()
        self.setupColViewModel()
    }
    
    private func setupColViewModel() {
        self.collViewModel = SimpViewModel()
        self.collViewModel.updateViews = {
            DispatchQueue.main.async {
                self.collTable.reloadData()
            }
        }
        self.collViewModel.loadChar()
    }
    
    private func setupColView() {
        self.collTable.delegate = self
        self.collTable.dataSource = self
    }
    
}

extension pictureViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collViewModel.numberOfChar
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellgames, for: indexPath) as! simpCollViewCell
        
        cell.tag = indexPath.row
        cell.configure(with: collViewModel.chars[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewCont1 = storyboard?.instantiateViewController(withIdentifier: "detailsViewController") as? detailsViewController
        
        let dummyCell = collectionView.cellForItem(at: indexPath) as? simpCollViewCell
        dummyCell?.configure(with: collViewModel.chars[indexPath.item])
        
        viewCont1?.detImgD = dummyCell?.imageD
        
        var dummy = self.collViewModel.inputText(indexPath.item).components(separatedBy: "-")
        viewCont1?.detText = dummy[0]
        
        if dummy.count > 2 {
            for i in 0..<dummy.count {
                viewCont1?.detText2 = (viewCont1?.detText2)! + dummy[i]
            }
        } else {
            viewCont1?.detText2 = dummy[1]
        }
        self.navigationController?.pushViewController(viewCont1!, animated: true)
    }
}

extension pictureViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100.0, height: 150.0)
    }
    
}

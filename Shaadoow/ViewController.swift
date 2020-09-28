//
//  ViewController.swift
//  Shaadoow
//
//  Created by AdaptME on 28/09/2020.
//  Copyright © 2020 AdaptME. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var artistCollection:UICollectionView!
    
    var artistModels = [ArtistViewModel]()
    
    var categoryEstimateWidth = 180.0
    var cellMarginSize = 20.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        artistCollection.delegate = self
        artistCollection.dataSource = self
        setupGridView()
        fetchArtist()
        
        artistCollection.register(UINib(nibName: "ArtistCollectionCell", bundle: nil), forCellWithReuseIdentifier: "artistcell")
    
    }
    func setupGridView() {
        let flow = artistCollection?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    func fetchArtist(){
        Service.shared.fetchArtist { datas in
            self.artistModels = datas?.map({return ArtistViewModel(artist: $0)}) ?? []
            self.artistCollection.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "artistcell", for: indexPath) as! ArtistCollectionCell
        
        cell.artistViewModel = artistModels[indexPath.row]
        return cell
    }


}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith(view: collectionView)
        return CGSize(width: width, height: width)
        
    
    }

    func calculateWith(view:UICollectionView) -> CGFloat {
        var estimatedWidth = CGFloat(categoryEstimateWidth)

        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))

        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount

        return width
    }
    
}



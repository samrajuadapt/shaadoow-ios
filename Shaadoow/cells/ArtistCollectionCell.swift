//
//  ArtistCollectionCell.swift
//  Shaadoow
//
//  Created by AdaptME on 28/09/2020.
//  Copyright © 2020 AdaptME. All rights reserved.
//

import UIKit
import Alamofire

class ArtistCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFollow: UILabel!
    
    
    var artistViewModel:ArtistViewModel!{
        didSet{
            loadImage(imgUrl: artistViewModel.profileImgURL,image: imgProfile)
            lblName.text = artistViewModel.name
            lblFollow.text = "\(artistViewModel.followers ?? 0)"
        }
    }
    
    func loadImage(imgUrl:String!,image:UIImageView){
       if(imgUrl != nil){
            let url = SC.ASSET_URL+imgUrl
            AF.request(url,method: .get).responseData { data in
                image.image = UIImage(data: data.data!)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

//
//  FeedTableCell.swift
//  Shaadoow
//
//  Created by AdaptME on 28/09/2020.
//  Copyright © 2020 AdaptME. All rights reserved.
//

import UIKit
import Alamofire

class FeedTableCell: UITableViewCell {
    
    @IBOutlet weak var imgProfile:UIImageView!
    @IBOutlet weak var imgContent:UIImageView!
    
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblDesc:UILabel!
    @IBOutlet weak var lblLike:UILabel!
    @IBOutlet weak var lblComment:UILabel!
    @IBOutlet weak var lblTime:UILabel!
    
    
    var feedViewModel:FeedsViewModel!{
        didSet{
            loadImage(imgUrl: feedViewModel.createdBy?.profileImageURL, image: imgProfile)
            loadImage(imgUrl: feedViewModel.songDetails?.coverImgURL, image: imgContent)
            lblDesc.text = feedViewModel.recordingDetails?.recordingDetailsDescription
            lblName.text = feedViewModel.createdBy?.name
            lblLike.text = feedViewModel.like
            lblComment.text = feedViewModel.comments
            lblTime.text = feedViewModel.time
        }
    }
    
    func loadImage(imgUrl:String!,image:UIImageView){
       if(imgUrl != nil){
        AF.request(SC.ASSET_URL+imgUrl,method: .get).responseData { data in
                image.image = UIImage(data: data.data!)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

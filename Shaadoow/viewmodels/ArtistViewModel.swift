//
//  ArtistViewModel.swift
//  Shaadoow
//
//  Created by AdaptME on 28/09/2020.
//  Copyright © 2020 AdaptME. All rights reserved.
//

import Foundation
import Alamofire

struct ArtistViewModel {
    let artistID: Int?
    let name, names: String?
    let category: Int?
    let welcomeDescription, regionID:String?
    let coverImgURL, profileImgURL: String?
    let published, rank: Int?
    let createdAt, updatedAt: String?
    let deletedAt: String?
    let profileID: Int?
    let slug: String?
    let followers: Int?
    
    init(artist:Artist) {
        self.artistID = artist.artistID
        self.name = artist.name
        self.names = artist.names
        self.category = artist.category
        self.welcomeDescription = artist.welcomeDescription
        self.regionID = artist.regionID
        self.coverImgURL = SC.ASSET_URL+artist.coverImgURL!
        self.profileImgURL = SC.ASSET_URL+artist.profileImgURL!
        self.published = artist.published
        self.rank = artist.rank
        self.createdAt = artist.createdAt
        self.updatedAt = artist.updatedAt
        self.deletedAt = artist.deletedAt
        self.profileID = artist.profileID
        self.slug = artist.slug
        self.followers = artist.followers
        
    }
    
    
}

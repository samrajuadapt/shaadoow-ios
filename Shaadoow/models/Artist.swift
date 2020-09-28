//
//  Artist.swift
//  Shaadoow
//
//  Created by AdaptME on 28/09/2020.
//  Copyright © 2020 AdaptME. All rights reserved.
//

import Foundation

struct Artist:Decodable {
    let artistID: Int?
    let name, names: String?
    let category: Int?
    let welcomeDescription, regionID, coverImgURL, profileImgURL: String?
    let published, rank: Int?
    let createdAt, updatedAt: String?
    let deletedAt: String?
    let profileID: Int?
    let slug: String?
    let followers: Int?

    enum CodingKeys: String, CodingKey {
        case artistID = "artist_id"
        case name, names, category
        case welcomeDescription = "description"
        case regionID = "region_id"
        case coverImgURL = "cover_img_url"
        case profileImgURL = "profile_img_url"
        case published, rank
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case profileID = "profile_id"
        case slug, followers
    }
}

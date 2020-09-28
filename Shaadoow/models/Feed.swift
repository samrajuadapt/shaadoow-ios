//
//  Feed.swift
//  Shaadoow
//
//  Created by AdaptME on 28/09/2020.
//  Copyright © 2020 AdaptME. All rights reserved.
//

import Foundation

struct Feed:Decodable {
    let id: String?
    let parent: Int?
    let createdBy: CreatedBy?
    let recordingDetails: RecordingDetails?
    let songDetails: SongDetails?
    let artistDetails: Artist?
    let interactionsCounter: InteractionsCounter?
    let status, weight, published, views: Int?
    let updatedAt, createdAt: String?
    let isLiked: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case parent
        case createdBy = "created_by"
        case recordingDetails = "recording_details"
        case songDetails = "song_details"
        case artistDetails = "artist_details"
        case interactionsCounter = "interactions_counter"
        case status, weight, published, views
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case isLiked = "is_liked"
    }
}

struct CreatedBy:Decodable {
    let id: Int?
    let name, slug, profileImageURL: String?
    let artistID, verified: Int?
    let vip: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case profileImageURL = "profile_image_url"
        case artistID = "artist_id"
        case verified, vip
    }
}

struct InteractionsCounter: Decodable {
    let comments, likes, points: Int?
}

struct RecordingDetails: Decodable {
    let duration: Double?
    let type, recordingDetailsDescription, coverImgURL, recordingURL: String?
    let status, recordingID: Int?

    enum CodingKeys: String, CodingKey {
        case duration, type
        case recordingDetailsDescription = "description"
        case coverImgURL = "cover_img_url"
        case recordingURL = "recording_url"
        case status
        case recordingID = "recording_id"
    }
}

struct SongDetails: Decodable {
    let id: Int?
    let title: String?
    let published: Int?
    let coverImgURL: String?

    enum CodingKeys: String, CodingKey {
        case id, title, published
        case coverImgURL = "cover_img_url"
    }
}

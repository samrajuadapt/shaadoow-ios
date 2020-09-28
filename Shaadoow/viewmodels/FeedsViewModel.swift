//
//  FeedsViewModel.swift
//  Shaadoow
//
//  Created by AdaptME on 28/09/2020.
//  Copyright © 2020 AdaptME. All rights reserved.
//

import Foundation

struct FeedsViewModel {
    let createdBy: CreatedBy?
    let recordingDetails: RecordingDetails?
    let songDetails: SongDetails?
    let createdAt: String?
    let isLiked: Bool?
    
    let comments:String?
    let like:String?
    let time:String?
    
    init(feed:Feed) {
        self.createdBy = feed.createdBy
        self.recordingDetails = feed.recordingDetails
        self.songDetails  = feed.songDetails
        self.createdAt = feed.createdAt
        self.isLiked = feed.isLiked
        
        self.comments = "\(feed.interactionsCounter?.comments ?? 0) Comments"
        self.like = "\(feed.interactionsCounter?.likes ?? 0) Likes"
        self.time = feed.createdAt?.getElapsedInterval()
        
    }
    
    
}

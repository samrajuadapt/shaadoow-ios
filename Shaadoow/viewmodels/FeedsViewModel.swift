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
    let interactionsCounter: InteractionsCounter?
    let createdAt: String?
    let isLiked: Bool?
    
    init(feed:Feed) {
        self.createdBy = feed.createdBy
        self.recordingDetails = feed.recordingDetails
        self.songDetails  = feed.songDetails
        self.interactionsCounter = feed.interactionsCounter
        self.createdAt = feed.createdAt
        self.isLiked = feed.isLiked
    }
    
    
}

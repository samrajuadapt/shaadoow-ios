//
//  ArtistRepo.swift
//  Shaadoow
//
//  Created by AdaptME on 28/09/2020.
//  Copyright © 2020 AdaptME. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    
    private init(){}
   
    let manager:Session = {
        let manager = ServerTrustManager(evaluators: ["15.185.64.176": DisabledTrustEvaluator()])
        let session = Session(serverTrustManager: manager)
        return session
    }()
   
    
    static let shared = Service();
    
    func fetchArtist(completion:@escaping([Artist]?)->Void){
        let url  = SC.SERVER_URL+"artists/auth-less/list?"
        let param:Parameters = ["page":SC.DEFAULT_PAGE,"limit":SC.DEFAULT_LIMIT]
        
        manager.request(url,parameters: param,encoding: URLEncoding(destination: .queryString)).responseDecodable(of:ResHandler<[Artist]>.self){ res in
            if let value = res.value{
                switch value.status {
                case .success:
                    guard let artist:[Artist] = value.data else{
                        completion([])
                        return
                    }
                    completion(artist)
                case .failed:
                    print("Artist fetch Fail")
                
                }
            }
        }
    }
    func fetchFeeds(completion:@escaping([Feed]?)->Void){
        let url  = SC.SERVER_URL+"posts/recommended_for_you?"
        let param:Parameters = ["page":SC.DEFAULT_PAGE,"limit":SC.DEFAULT_FEED_LIMIT]
        
        manager.request(url,parameters: param,encoding: URLEncoding(destination: .queryString)).responseDecodable(of:ResHandler<[Feed]>.self){ res in

            if let value = res.value{
                switch value.status {
                case .success:
                    guard let feeds:[Feed] = value.data else{
                        completion([])
                        return
                    }
                    completion(feeds)
                case .failed:
                    print("Artist fetch Fail")
                
                }
            }
        }
    }
    
}




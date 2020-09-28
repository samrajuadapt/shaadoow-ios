//
//  ResponseHandler.swift
//  Shaadoow
//
//  Created by AdaptME on 28/09/2020.
//  Copyright © 2020 AdaptME. All rights reserved.
//

import Foundation

struct ResHandler<T>:Decodable where T:Decodable {
    
    private var isSuccess:Bool?
    var status:Status{
        if(isSuccess!){
            return .success
        }
        return .failed
    }
    
    private(set) var message:[String]?
    private(set) var data:T?
    
    enum CodingKeys:String,CodingKey {
        case isSuccess = "success"
        case data = "data"
        case message = "message"
    }
    
    init() {
        self.isSuccess = false
        self.data = nil
        self.message = nil
    }
    
    enum Status{
        case success
        case failed
    }
}


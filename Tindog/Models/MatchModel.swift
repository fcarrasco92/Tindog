//
//  MatchModel.swift
//  Tindog
//
//  Created by Felipe on 09-09-18.
//  Copyright © 2018 Platzi. All rights reserved.
//

import Foundation
import Firebase

struct MatchModel{
    let uid: String
    let uid2: String
    let matchIsAccepted: Bool
    
    init?(snapshot: DataSnapshot){
        let uid = snapshot.key
        guard let dic = snapshot.value as? [String:Any],
            let uid2 = dic["uid2"] as? String,
            let matchIsAccepted = dic["matchIsAccepted"] as? Bool else {
                return nil
        }
        self.uid = uid
        self.uid2 = uid2
        self.matchIsAccepted = matchIsAccepted
        
    }
}

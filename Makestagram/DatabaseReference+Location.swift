//
//  DatabaseReference+Location.swift
//  Makestagram
//
//  Created by Shannon Ding on 7/3/17.
//  Copyright © 2017 Shannon Ding. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DatabaseReference {
    enum MGLocation {
        case root
        case posts(uid: String)
        case showPost(uid: String, postKey: String)
        case likes(key: String, currentUID: String)
        case isLiked(postKey: String)
        case newPost(currentUID: String)
        case users()
        case showUser(uid: String)
        case followers(uid: String)
        case likesCount(posterUID: String, postKey: String)
        case timeline(uid: String)
        
        func asDatabaseReference() -> DatabaseReference {
            let root = Database.database().reference()
            
            switch self {
            case .root:
                return root
                
            case .posts(let uid):
                return root.child("posts").child(uid)
                
            case let .showPost(uid, postKey):
                return root.child("posts").child(uid).child(postKey)
                
            case let .likes(key, currentUID):
                return root.child("postLikes").child(key).child(currentUID)
                
            case .isLiked(let postKey):
                return root.child("postLikes").child(postKey)
                
            case .newPost(let currentUID):
                return root.child("posts").child(currentUID).childByAutoId()
                
            case .users():
                return root.child("users")
                
            case .showUser(let uid):
                return root.child("users").child(uid)
                
            case .followers(let uid):
                return root.child("followers").child(uid)
                
            case let .likesCount(posterUID, postKey):
                return root.child("posts").child(posterUID).child(postKey).child("like_count")
                
            case .timeline(let uid):
                return root.child("timeline").child(uid)
            }
            
        }
            
            
    }


    static func toLocation(_ location: MGLocation) -> DatabaseReference {
        return location.asDatabaseReference()
    }
    
}

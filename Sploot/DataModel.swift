//
//  DataModel.swift
//  Sploot
//
//  Created by Abhay singh on 05/09/24.
//

import Foundation

struct PostModel : Identifiable{
    var id = UUID()
    let profilePic : String
    let userName : String
    let timePosted : String
    let postBody : String
    let postTitle : String
    let NumberOfComments : String
}

let postsList : [PostModel] = [
    PostModel(profilePic: "Abhay",
              userName: "Abhay Singh",
              timePosted: "23hr",
              postBody: "My Golden, Bailey, is a year old and still chews everything! Any advice on curbing the habit?",
              postTitle: "Chewing Advice Needed!",
              NumberOfComments: "22"),
    PostModel(profilePic: "Abhay",
              userName: "Abhay Singh",
              timePosted: "23hr",
              postBody: "My Golden, Bailey, is a year old and still chews everything! Any advice on curbing the habit?",
              postTitle: "Chewing Advice Needed!",
              NumberOfComments: "22"),
    PostModel(profilePic: "Abhay",
              userName: "Abhay Singh",
              timePosted: "23hr",
              postBody: "My Golden, Bailey, is a year old and still chews everything! Any advice on curbing the habit?",
              postTitle: "Chewing Advice Needed!",
              NumberOfComments: "22"),
]

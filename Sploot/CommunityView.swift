//
//  FamilyView.swift
//  Sploot
//
//  Created by Abhay singh on 05/09/24.
//

import SwiftUI


struct CommunityView: View {
    
    let familyImages : [String] = ["cookie", "Coffee","cookie", "Coffee"]
    
    let BadgesList : [String] = ["dog.fill", "cat.fill", "star.fill"]
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color.green.opacity(0.3), Color.white,Color.white],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            ScrollView{
                VStack(alignment : .leading){
                    VStack(alignment: .leading){
                        HStack(alignment: .top, spacing: 0){
                            ProfileImage()
                            Spacer()
                            chatButton()
                            FollowButton()
                        }
                        userName()
                        userBio()
                    }
                    customTitle(title: "Family")
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 4){
                            ForEach(familyImages, id: \.self){index in
                                familyImage(imageName: index)
                            }
                        }
                    }
                    customTitle(title: "Badges")
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 4){
                            ForEach(BadgesList, id: \.self){ badge in
                                badgeView(badgeName: badge, width: 100, height: 100)
                            }
                        }
                    }
                    segmentedControl()
                        .padding([.top, .bottom], 16)
                    

                    Spacer()
                }
                .padding(.leading, 8)
            }
        }
        
    }
}
#Preview {
    CommunityView()
}

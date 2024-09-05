//
//  viewModel.swift
//  Sploot
//
//  Created by Abhay singh on 05/09/24.
//

import SwiftUI

struct CommentsPage : View {
    
    var title : String
    
    var body: some View {
        VStack(alignment : .center){
            Text(title)
                .font(.title)
                .padding()
        }
    }
}

struct chatButton : View {
    var body: some View {
        Image(systemName: "ellipsis.message")
            .foregroundStyle(Color.gray)
            .padding(.all, 16)
            .padding(.horizontal, 0)
            .background(
                Circle()
                    .fill(Color.white.opacity(0.5))
                    .shadow(color: .gray.opacity(0.3), radius: 10)
    
            )
        
    }
}

struct FollowButton : View {
    
    @State var isPressed = false
    
    var body: some View {
        Button(action: {
            withAnimation(.linear){
                isPressed.toggle()
            }
        }, label: {
            Text(isPressed ? "Followed" : "Follow")
                .foregroundStyle(isPressed ? Color.black : Color.gray)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(isPressed ? Color.green.opacity(0.7) : Color.white.opacity(0.5))
                        .shadow(color: .gray.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        
                ).padding(.trailing)
        })
       
    }
}

struct PostPage : View {
 
    var body: some View {
        ForEach(postsList){ post in
            VStack(spacing: 8){
                HStack(alignment: .top){
                    Image(post.profilePic)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment : .leading){
                        HStack{
                            Text(post.userName)
                                .font(.body)
                            Text(". \(post.timePosted)")
                                .font(.caption)
                            Spacer()
                            Image(systemName: "ellipsis")
                        }
                        Text(post.postTitle)
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(post.postBody)
                            .font(.body)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 4)
                            
                        HStack{
                            Image(systemName: "message")
                            Text(post.NumberOfComments)
                                .font(.caption)
                                .foregroundStyle(Color.black)
                            Spacer()
                            Image(systemName: "square.and.arrow.up")
                            Image(systemName: "bookmark")
                        }
                    }
                    Spacer()
                }
            }
            .padding([.top, .bottom], 16)
        }
        
    }
}

struct segmentedControl: View {
    @State private var selectedSegment = 0
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    withAnimation(.snappy){
                        selectedSegment = 0
                    }
                }) {
                    Text("Posts")
                        .padding()
                        .frame(width: 100, height: 30)
                        .background(selectedSegment == 0 ? Color.orange : Color.white)
                        .foregroundColor(selectedSegment == 0 ? Color.white : Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                
                Button(action: {
                    withAnimation(.linear){
                        selectedSegment = 1
                    }                }, label: {
                    Text("Comments")
                        .padding()
                        .frame(width: .infinity, height: 30)
                        .background(selectedSegment == 1 ? Color.orange : Color.white)
                        .foregroundColor(selectedSegment == 1 ? Color.white : Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                })
                
                Button(action: {
                    withAnimation(.linear){
                        selectedSegment = 2
                    }                }, label: {
                    Text("Memories")
                        .padding()
                        .frame(width: .infinity, height: 30)
                        .background(selectedSegment == 2 ? Color.orange : Color.white)
                        .foregroundColor(selectedSegment == 2 ? Color.white : Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                })
            }
            .background(Color.clear
            )
            
            // Conditional view based on selected segment
            switch selectedSegment {
            case 0:
                PostPage()
            case 1:
                CommentsPage(title: "No Comments yet")
            case 2:
                Text("No Memories")
                    .font(.largeTitle)
            default:
                Text("")
                    .font(.largeTitle)
            }
        }
        .padding()
    }
}

struct familyImage: View {
    
    let imageName : String
    
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(Circle())
            Text(imageName)
                .foregroundStyle(Color.gray)
        }
        .padding(.bottom)
    }
}
struct ProfileImage: View {
    var body: some View {
        VStack{
            Image("Abhay")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(Circle())
        }
    }
}
struct userName: View {
    var body: some View {
        VStack(alignment: .center){
            Text("Abhay Singh")
                .foregroundColor(Color.black)
        }
    }
}

struct userBio: View {
    var body: some View {
        VStack{
            Text("Dedicated to dogs, their love, and their Adventures. 🐶❤️")
                .foregroundColor(Color.black)
                .font(.system(size: 14))
                .padding(.top, 4)
                .padding(.bottom, 12)
        }
    }
}

struct customTitle: View {
    let title : String
    var body: some View {
        Text(title)
            .foregroundStyle(Color.gray)
            .font(.title3)
            .padding([.top, .bottom], 8)
    }
}

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.size.width
        let height = rect.size.height
        let h = height / 2
        let w = width / 2
        let r = min(w, h)
        
        path.move(to: CGPoint(x: w, y: 0))
        path.addLine(to: CGPoint(x: w + r * cos(.pi / 6), y: r * sin(.pi / 6)))
        path.addLine(to: CGPoint(x: w + r * cos(.pi / 6), y: height - r * sin(.pi / 6)))
        path.addLine(to: CGPoint(x: w, y: height))
        path.addLine(to: CGPoint(x: w - r * cos(.pi / 6), y: height - r * sin(.pi / 6)))
        path.addLine(to: CGPoint(x: w - r * cos(.pi / 6), y: r * sin(.pi / 6)))
        path.closeSubpath()
        
        return path
    }
}

struct badgeView: View {
    
    let badgeName : String
    let width : Double
    let height : Double
    var body: some View {
        Hexagon()
            .fill(LinearGradient(
                colors: [.blue.opacity(0.7), .white, .yellow.opacity(0.7)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing))
            .frame(width: width, height: height)
            .overlay(alignment: .center) {
                Image(systemName: badgeName)
                    .font(.title)
            }
    }
}

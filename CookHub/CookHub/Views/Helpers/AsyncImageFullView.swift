//
//  AsyncImageFullView.swift
//  CookHub
//
//  Created by Xhulia Uni on 17.10.23.
//

import SwiftUI

struct AsyncImageFullView: View {
    var url: String
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: url)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(maxHeight: 200)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 4)
                        .cornerRadius(25)
                case .failure:
                    Image("no_image")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(maxHeight: 200)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 4)
                        .cornerRadius(25)
                @unknown default:
                    EmptyView()
                }
            }
        }.padding()
    }
}

 #Preview {
     AsyncImageFullView(url: "https://en.wikipedia.org/wiki/Chocolate_brownie#/media/File:Chocolatebrownie.JPG")
 }

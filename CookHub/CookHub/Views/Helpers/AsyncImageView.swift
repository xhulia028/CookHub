//
//  AsyncImageView.swift
//  CookHub
//
//  Created by Xhulia Uni on 17.10.23.
//

import SwiftUI

struct AsyncImageView: View {
    var string: String
    var body: some View {
        AsyncImage(url: URL(string: string)) { phase in
            switch phase {
            case .empty:
                Image("no_image")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(height: 150)
                    .clipped()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(height: 150)
                    .clipped()
            case .failure:
                Image("no_image")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(height: 150)
                    .clipped()
            @unknown default:
                EmptyView()
            }
        }
    }
}

 #Preview {
     AsyncImageView(url:"https://en.wikipedia.org/wiki/Chocolate_brownie#/media/File:Chocolatebrownie.JPG")
 }

//
//  URLImage.swift
//  List
//
//  Created by Anshad R on 25/04/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import SwiftUI
struct URLImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image: UIImage = UIImage()
    var size: CGSize
    
    init(withURL url: String, size: CGSize) {
        imageLoader = ImageLoader(urlString: url)
        self.size = size
    }
    
    var body: some View {
        VStack {
            Image(uiImage: imageLoader.data != nil ? UIImage(data: imageLoader.data!)! : UIImage(named: "placeholder")!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
        }
    }
}

struct URLCircularImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    var size: CGSize
    
    init(withURL url: String, size: CGSize) {
        imageLoader = ImageLoader(urlString:url)
        self.size = size
    }
    
    var body: some View {
        VStack {
            Image(uiImage: (imageLoader.data != nil ? UIImage(data: imageLoader.data!)! : UIImage(named: "placeholder"))!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(Color.gray, lineWidth: 2))
                .shadow(radius: 10)
                .frame(width: size.width, height: size.height)
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var dataIsValid = false
    var data: Data?
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.dataIsValid = true
                self.data = data
            }
        }
        task.resume()
    }
}

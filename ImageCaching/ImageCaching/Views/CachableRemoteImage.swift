//
//  CachableRemoteImage.swift
//  ImageCaching
//
//  Created by Minh Pham on 23/11/2023.
//

import SwiftUI

struct CachableRemoteImage: View {

    @ObservedObject var imageLoader: ImageLoader

    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }

    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
        }
    }
}

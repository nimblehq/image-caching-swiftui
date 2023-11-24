//
//  ImageLoader.swift
//  ImageCaching
//
//  Created by Minh Pham on 23/11/2023.
//

import SwiftUI

class ImageLoader: ObservableObject {

    @Published var image: UIImage?

    private var url: String
    private var task: URLSessionDataTask?

    init(url: String) {
        self.url = url
        loadImage()
    }

    private func loadImage() {
        if let cachedImage = ImageCache.shared.get(forKey: url) {
            self.image = cachedImage
            print("show cache image: \(url)")
            return
        }

        guard let url = URL(string: url) else { return }

        task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.image = image
                // Test case #1: without cost param
//                print("show remote image: \(url)")
//                ImageCache.shared.set(image!, forKey: self.url)

                // Test case #2: with cost param
                let bytes = data.count
                print("show remote image: \(url), bytes: \(bytes)")
                ImageCache.shared.set(image!, forKey: self.url, cost: bytes)
            }
        }
        task?.resume()
    }
}

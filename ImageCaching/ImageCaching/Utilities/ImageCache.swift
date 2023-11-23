//
//  ImageCache.swift
//  ImageCaching
//
//  Created by Minh Pham on 23/11/2023.
//

import UIKit

class ImageCache {

    static let shared = ImageCache()

    private let cache = NSCache<NSString, UIImage>()

    private init() {
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 5
//        cache.countLimit = 2
//        cache.totalCostLimit = 1024 * 1024 * 1
    }

    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }

    func set(_ image: UIImage, forKey key: String, cost: Int) {
        cache.setObject(image, forKey: key as NSString, cost: cost)
    }

    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }

    func clearAllCache() {
        cache.removeAllObjects()
    }
}

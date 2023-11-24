//
//  DictionaryVsCache.swift
//  ImageCaching
//
//  Created by Minh Pham on 23/11/2023.
//

import Foundation

class DictionaryVsCache {
    
    // MARK: - DICTIONARY
    private func dictionary() {
        let mutableDict = NSMutableDictionary()

        // dicKey points to an object K₁ whose value is "key"
        var dicKey: NSString = "key" // K₁
        
        // mutableDict.setObject("one", forKey: dicKey) copies dicKey into a new key object K₂; K₁ is left alone
        mutableDict.setObject("one", forKey: dicKey) // K₂

        // dicKey = "changedKey" creates a new object K₃ with the value "changedKey", and assigns dicKey to point to it.
        // Since nothing points to K₁ anymore, its retain count goes to 0 and the object is deallocated
        dicKey = "changedKey" // K₃

        // mutableDict.setObject("two", forKey: dicKey) copies dicKey into a new key object K₄; K₂ is left alone
        mutableDict.setObject("two", forKey: dicKey) // K₄

        // => The dictionary contains K₂ and K₄, while dicKey points to K₃. K₁ is deallocated
    }

    // MARK: - CACHE
    private func cache() {
        let cache = NSCache<NSString, NSString>()

        // cacheKey points to an object K₁ whose value is "key"
        var cacheKey: NSString = "key" // K₁

        // cache.setObject("one", forKey: cacheKey) retains K₁ for insertion into the cache
        cache.setObject("one", forKey: cacheKey) // still K₁!

        // cacheKey = "changedKey" creates a new object K₂ with a value "changedKey" and assigns cacheKey to point to it.
        // Since the cache is still retaining K₁, it remains alive and in memory, even if dicKey no longer points to it
        cacheKey = "changedKey" // K₂

        // cache.setObject("two", forKey: cacheKey) retains K₂ for insertion into the cache
        cache.setObject("two", forKey: cacheKey) // still K₂!

        // => The cache contains K₁ and K₂, and cacheKey points to K₂.
    }
}

//
//  MemoryCache.swift
//  Networking-Layer-iOS
//
//  Created by Mohamed Atallah on 07/12/2025.
//
// SwiftBySundell: https://www.swiftbysundell.com/articles/caching-in-swift/

import Foundation

actor MemoryCache<Key: Hashable, Value> {
    private let wrapped = NSCache<WrappedKey, Entry>()

    func insert(value: Value, forKey key: Key) async {
        let entry = Entry(value: value)
        wrapped.setObject(entry, forKey: WrappedKey(key))
    }
    
    func value(forKey key: Key) -> Value? {
        let entry = wrapped.object(forKey: WrappedKey(key))
        return entry?.value
    }
    
    func removeValue(forKey key: Key) async {
        wrapped.removeObject(forKey: WrappedKey(key))
    }
}


extension MemoryCache {
    class WrappedKey: NSObject {
        let key: Key
        init(_ key: Key) {
            self.key = key
        }
        
        override var hash: Int { key.hashValue }
        
        override func isEqual(_ object: Any?) -> Bool {
            guard let value = object as? WrappedKey else {
                return false
            }
            return value.key == key
        }
    }
}

extension MemoryCache {
    class Entry {
        let value: Value
        init(value: Value) {
            self.value = value
        }
    }
}

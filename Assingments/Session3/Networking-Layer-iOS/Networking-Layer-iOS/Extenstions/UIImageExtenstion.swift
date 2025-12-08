//
//  UIImageExtenstion.swift
//  Networking-Layer-iOS
//
//  Created by Mohamed Atallah on 08/12/2025.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func load(from urlString: String, placeholder: UIImage? = nil) {
        // Set placeholder if provided
        if let placeholder = placeholder {
            self.image = placeholder
        } else {
            self.image = nil
        }
        
        // Cache key
        let cacheKey = NSString(string: urlString)
        
        // Return cached image if exists
        if let cached = imageCache.object(forKey: cacheKey) {
            self.image = cached
            return
        }
        
        // Validate URL
        guard let url = URL(string: urlString) else {
            print("❌ Invalid URL: \(urlString)")
            return
        }
        
        // Fetch image
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                print("❌ Image load error:", error.localizedDescription)
                return
            }
            
            guard let data = data, let downloaded = UIImage(data: data) else {
                print("❌ Failed to decode image")
                return
            }
            
            // Cache the image
            imageCache.setObject(downloaded, forKey: cacheKey)
            
            // Update UI on main thread
            DispatchQueue.main.async {
                self?.image = downloaded
            }
            
        }.resume()
    }
}


//
//  PhotoStore.swift
//  PhotoFrame
//
//  Created by Cara on 3/26/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import Foundation
import UIKit

// every app has its own storage directory

class PhotoStore {
    
    // file paths in iOS are urls
    let imageURL: URL = {
        let imageFileName = "hello_camera"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectory.first!
        return documentDirectory.appendingPathComponent(imageFileName)
    }()
    
    func savePhoto(image: UIImage) {
        if let data = image.jpegData(compressionQuality: 1) {
            try? data.write(to: imageURL, options: [.atomic])
        }
    }
    
    func getPhoto() -> UIImage? {
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path) else {
            return nil
        }
        return imageFromDisk
    }
}

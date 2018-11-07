//
//  Album.swift
//  Adrea_Test
//
//  Created by Fly on 11/5/18.
//  Copyright © 2018 Fly. All rights reserved.
//

import Foundation

struct Album {
    var id: String
    var name: String
    var count: Int
    var imageUrl: String

    init(id: String, name: String, count: Int, imageUrl: String) {
        self.id = id
        self.name = name
        self.count = count
        self.imageUrl = imageUrl
    }
}

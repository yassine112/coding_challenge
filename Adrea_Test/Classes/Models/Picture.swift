//
//  Pictue.swift
//  Adrea_Test
//
//  Created by Yassine EL HALAOUI on 11/8/18.
//  Copyright © 2018 YEL. All rights reserved.
//

import Foundation

struct Picture {
    var id: String
    var name: String?
    var source: String

    init(id: String, name: String?, source: String) {
        self.id = id
        self.name = name
        self.source = source
    }
}

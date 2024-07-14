//
//  Student.swift
//  Bookworm
//
//  Created by Görkem Güray on 13.07.2024.
//

import SwiftUI
import SwiftData


@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

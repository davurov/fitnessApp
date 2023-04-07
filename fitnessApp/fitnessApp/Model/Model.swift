//
//  Model.swift
//  fitnessApp
//
//  Created by Abduraxmon on 06/04/23.
//

import Foundation

// MARK: - ModelElement
struct ModelElement: Codable {
    let bodyPart, equipment: String?
    let gifURL: String?
    let id, name, target: String?

    enum CodingKeys: String, CodingKey {
        case bodyPart, equipment
        case gifURL = "gifUrl"
        case id, name, target
    }
}

typealias Model = [ModelElement]

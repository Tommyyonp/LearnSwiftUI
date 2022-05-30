//
//  Car.swift
//  learnSwift
//
//  Created by Tommy Yon Prakoso on 07/05/22.
//

import Foundation

struct CarData: Codable {
    let id: Int?
    let name: String?
    let category: String?
    let price: Int?
    let status: Bool?
    let startRentAt, finishRentAt: String?
    let image: String?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, category, price, status
        case startRentAt = "start_rent_at"
        case finishRentAt = "finish_rent_at"
        case image, createdAt, updatedAt
    }
}

typealias CarResponse = [CarData]

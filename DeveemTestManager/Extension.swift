//
//  Extension.swift
//  DeveemTestManager
//
//  Created by User on 10/29/20.
//

import Foundation

extension Decodable {
    init(from data: Data) throws {
        self = try JSONDecoder().decode(Self.self, from: data)
    }
}

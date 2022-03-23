//
//  NasaPicture.swift
//  iOS_APOD
//
//  Created by Christos Papantonis on 23/3/22.
//

import Foundation

struct NasaPicture: Decodable {
    let date: String
    let title: String
    let explanation: String
    let url: String
}

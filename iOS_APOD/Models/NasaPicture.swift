//
//  NasaPicture.swift
//  iOS_APOD
//
//  Created by Christos Papantonis on 23/3/22.
//

import Foundation

struct NasaPicture: Decodable {
    let date: String?
    let title: String?
    let explanation: String?
    let copyright: String?
    let media_type: String?
    let service_version: String?
    let url: String?
    let hdurl: String?
}

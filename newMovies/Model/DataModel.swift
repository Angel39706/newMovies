//
//  DataModel.swift
//  newMovies
//
//  Created by Angel Martinez on 8/2/23.
//

import Foundation

struct Results: Decodable {
    let results: [Movies]
}

struct Movies: Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String
    let release_date: String
}

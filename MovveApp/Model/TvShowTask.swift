//
//  TvShowTask.swift
//  MovieApp
//
//  Created by Артем Орлов on 18.07.2022.
//

import Foundation


struct TvTask: Decodable {
    let results: [ResultsTv]
}

struct ResultsTv: Decodable {
    let title: String?
    let name: String?
    let release_date: String?
    let first_air_date: String?
    let poster_path: String?
}

//
//  ContentModel.swift
//  MovveApp
//
//  Created by Артем Орлов on 29.08.2022.
//

import Foundation

struct ContentTask: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let id: Int?
    let vote_average: Double?
    let overview: String?
    let title: String?
    let name: String?
    let release_date: String?
    let first_air_date: String?
    let poster_path: String?
}

enum Link: String {
    case movieUrlApi = "https://api.themoviedb.org/3/discover/movie?api_key=90c9174a2889a3d107e7ad700a2a3d38&language=ru-RU&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
    case tvUrlApi = "https://api.themoviedb.org/3/trending/tv/week?api_key=90c9174a2889a3d107e7ad700a2a3d38"
}

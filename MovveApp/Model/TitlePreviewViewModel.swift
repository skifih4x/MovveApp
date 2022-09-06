//
//  TitlePreviewViewModel.swift
//  Netflix Clone
//
//  Created by Amr Hossam on 07/01/2022.
//

import Foundation

struct TitlePreviewViewModel {
    let title: String
    let image: String
    let titleOverview: String
    let genre_ids: [Int]
    let release : String
    let rating: Double
    let id: Int
    var genres: String {
        var genresArray: [String] = []
        for genre_id in genre_ids {
            switch genre_id {
            case 12: genresArray.append("Adventure")
            case 14: genresArray.append("Fantasy")
            case 16: genresArray.append("Animation")
            case 18: genresArray.append("Drama")
            case 27: genresArray.append("Horror")
            case 28: genresArray.append("Action")
            case 35: genresArray.append("Comedy")
            case 36: genresArray.append("History")
            case 37: genresArray.append("Western")
            case 53: genresArray.append("Thriller")
            case 80: genresArray.append("Crime")
            case 99: genresArray.append("Documentary")
            case 878: genresArray.append("Science Fiction")
            case 9648: genresArray.append("Mystery")
            case 10402: genresArray.append("Music")
            case 10749: genresArray.append("Romance")
            case 10751: genresArray.append("Family")
            case 10752: genresArray.append("War")
            case 10759: genresArray.append("Action & Adventure")
            case 10762: genresArray.append("Kids")
            case 10763: genresArray.append("News")
            case 10764: genresArray.append("Reality")
            case 10765: genresArray.append("Sci-Fi & Fantasy")
            case 10766: genresArray.append("Soap")
            case 10767: genresArray.append("Talk")
            case 10768: genresArray.append("War & Politics")
            case 10770: genresArray.append("TV Movie")
            default: genresArray.append("Not declared ID")
            }
        }
        return genresArray.joined(separator: ", ")
    }
}

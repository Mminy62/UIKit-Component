//
//  Movie.swift
//  CodeBasedUI
//
//  Created by 이민영 on 1/14/25.
//

import Foundation

struct Movie: Decodable {
    let boxOfficeResult: MovieList
}

struct MovieList: Decodable {
    let showRange: String
    let dailyBoxOfficeList: [MovieInfo]
}

struct MovieInfo: Decodable {
    let rank: String
    let movieNm: String
    let openDt: String
}

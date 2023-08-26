//
//  Covid.swift
//  covid
//
//  Created by dani prayogi on 12/03/22.
//

import Foundation
import SwiftUI

struct Penambahan : Codable, Identifiable {
    let id = UUID()
    let jumlah_positif : Int
    let jumlah_meninggal : Int
    let jumlah_sembuh : Int
    let jumlah_dirawat : Int
    let tanggal : String
    let created : String
}

struct Update : Codable {
    let penambahan : Penambahan
}

struct DataCovid : Codable {
    var update : Update
}

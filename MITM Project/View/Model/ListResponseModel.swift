//
//  ListResponseModel.swift
//  MITM Project
//
//  Created by Vibhash Kumar on 28/08/23.
//

import Foundation


struct ListResponseModel : Codable {
   let data : [PopulationResponseModel]?
}

struct PopulationResponseModel : Codable {
    var id_Nation : String?
    var nation : String?
    var id_Year : Int?
    var year : String?
    var population : Int?
    var slug_Nation : String?
    
    enum CodingKeys: String, CodingKey {
        case id_Nation = "ID Nation"
        case nation = "Nation"
        case id_Year = "ID Year"
        case year = "Year"
        case population = "Population"
        case slug_Nation = "Slug Nation"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id_Nation = try container.decodeIfPresent(String.self, forKey: .id_Nation)
        self.nation = try container.decodeIfPresent(String.self, forKey: .nation)
        self.id_Year = try container.decodeIfPresent(Int.self, forKey: .id_Year)
        self.population = try container.decodeIfPresent(Int.self, forKey: .population)
        self.slug_Nation = try container.decodeIfPresent(String.self, forKey: .slug_Nation)
        
    }
}


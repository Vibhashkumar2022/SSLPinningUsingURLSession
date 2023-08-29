//
//  ListViewModel.swift
//  MITM Project
//
//  Created by Vibhash Kumar on 28/08/23.
//

import Foundation

class ListViewModel {
    var dataSource : [ListDetailsCellViewModel] = []
    func getResponseFromApi(completion:@escaping((_ response : ListResponseModel?,_ error :Error?)->Void)){
        NetworkManager.shared.request(url: URL(string: openurl), expecting: ListResponseModel.self) { data, error in
            print("URL : ",URL(string: openurl))
            print("Response : ",data)
            if let arr = data {
                completion(arr, error)
            }
            return
        }
    }
    
    func convertListResponseCellViewModel(dataModel : ListResponseModel?){
        self.dataSource = dataModel?.data?.map({ item in
            ListDetailsCellViewModel(id_Nation: item.id_Nation, nation: item.nation, id_Year: item.id_Year, year: item.year, population: item.population, slug_Nation: item.slug_Nation)
        }) ?? []
    }
}

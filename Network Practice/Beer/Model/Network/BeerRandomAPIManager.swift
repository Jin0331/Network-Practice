//
//  BeerRandomAPIManager.swift
//  Network Practice
//
//  Created by JinwooLee on 1/16/24.
//

import UIKit
import Alamofire

struct BeerRandomAPIManager {
    func callRequestBeerRandom(completionHandler : @escaping (BeerRandoms) -> Void ){ ///아ㅏㅏㅏㅏㅏㅏ.. 내 1시간.
        let url : String = "https://api.punkapi.com/v2/beers/random"
        
        AF.request(url, method: .get)
            .responseDecodable(of: BeerRandoms.self) { response in
                switch response.result {
                case .success(let success) :
                    completionHandler(success)
                case .failure(let failure) :
                    print("\(failure) - error")
                }
            }
    }
}

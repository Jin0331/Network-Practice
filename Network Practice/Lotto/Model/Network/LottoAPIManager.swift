//
//  LottoAPIManager.swift
//  Network Practice
//
//  Created by JinwooLee on 1/16/24.
//

import Alamofire
import UIKit

struct LottoAPIManager {
    func callRequestNumber(number : String, completionHandler : @escaping (Lotto) -> Void){
        let url : String = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        
        //Alamorfier
        AF.request(url, method: .get)
            .responseDecodable(of: Lotto.self) { response in
                switch response.result {
                case .success(let success) :
//                    print(#function, success)
                    completionHandler(success)
                    
                case .failure(let failure) :
                    print("error")
                }
            }
    }
    
//    func
}

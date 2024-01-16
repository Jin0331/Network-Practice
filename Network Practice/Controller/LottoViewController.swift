//
//  ViewController.swift
//  Network Practice
//
//  Created by JinwooLee on 1/16/24.
//

import UIKit

class LottoViewController: UIViewController {
    
    @IBOutlet var lottoLabelSet: [UILabel]!
    @IBOutlet var numberPickerView: UIPickerView!
    
    var lottoRequest : Lotto?
    var allLottoNumber = (1...1024).map{return String($0)}
    let apiManager = LottoAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureProtocol()
        numberPickerView.selectRow(Int(allLottoNumber[0])! - 1, inComponent: 0, animated: true)
        
    }
    
}


extension LottoViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func configureProtocol() {
        numberPickerView.delegate = self
        numberPickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(allLottoNumber[row])회"
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allLottoNumber.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(#function)
        
        // 특정회차 값 가져오기
        apiManager.callRequestNumber(number: allLottoNumber[row]) { value in
            self.lottoRequest = value
            print(self.lottoRequest)
            guard let t = self.lottoRequest else {return}
            self.setLottoNumber(request: t)
        }
    }
}

extension LottoViewController {
    func setLottoNumber(request : Lotto) {
        for index in 0..<lottoLabelSet.count {
            lottoLabelSet[index].text = String(request.lottoNumberList[index])
        }
    }
}

//
//  BeerViewController.swift
//  Network Practice
//
//  Created by JinwooLee on 1/16/24.
//

import UIKit

class BeerViewController: UIViewController {

    @IBOutlet var beerImageView: UIImageView!
    @IBOutlet var beerTitle: UILabel!
    @IBOutlet var beerDescription: UILabel!
    @IBOutlet var beerButton: UIButton!
    
    var beerRandomList : BeerRandom?
    var beerRandomManager = BeerRandomAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beerRandomManager.callRequestBeerRandom()

    }

}

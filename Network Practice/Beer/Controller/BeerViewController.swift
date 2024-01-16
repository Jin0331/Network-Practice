//
//  BeerViewController.swift
//  Network Practice
//
//  Created by JinwooLee on 1/16/24.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {

    @IBOutlet var beerImageView: UIImageView!
    @IBOutlet var beerTitle: UILabel!
    @IBOutlet var beerDescription: UILabel!
    @IBOutlet var beerButton: UIButton!
    
    var beerRandomList : BeerRandoms?
    var beerRandomManager = BeerRandomAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beerRandomManager.callRequestBeerRandom { value in
            self.beerRandomList = value
            guard let t = self.beerRandomList else { return }
            self.configureViewDesign(item: t)
        }


    }
    @IBAction func refreshButton(_ sender: UIButton) {
        beerRandomManager.callRequestBeerRandom { value in
            self.beerRandomList = value
            guard let t = self.beerRandomList else { return }
            self.configureViewDesign(item: t)
        }
    }
    
}

extension BeerViewController {
    func configureViewDesign(item : BeerRandoms) {
        
//        print(item[0].imageURL!)
        
        if let imageUrl = item[0].imageURL {
            let url = URL(string: imageUrl)
            beerImageView.kf.setImage(with: url)
        } else {
            beerImageView.image = UIImage(systemName: "xmark.square.fill")
        }
        
        
        beerTitle.text = item[0].name
        beerDescription.text = item[0].description
        
    }
}

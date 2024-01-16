// quickType
import Foundation

// MARK: - Temperature
struct BeerRandom : Codable {
    let id: Int
    let name, description: String
    let imageURL: String?
//    let ibu, srm, abv: Double

    enum CodingKeys: String, CodingKey { // 카멜케이스로 강제변환.. 필요한듯???
        case id, name
//        case firstBrewed = "first_brewed"
        case description
        case imageURL = "image_url"
//        case abv, ibu, srm
    }
}

typealias BeerRandoms = [BeerRandom]

// quickType
import Foundation

// MARK: - Temperature
struct BeerRandom : Codable {
    let id: Int
    let name, firstBrewed, description: String
    let imageURL: String
    let abv: Double
    let ibu, srm: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case firstBrewed = "first_brewed"
        case description
        case imageURL = "image_url"
        case abv, ibu, srm
    }
}

typealias BeerRandoms = [BeerRandom]


import Foundation
import CoreLocation

struct Coordinates: Codable,Identifiable {
    let id = UUID()

    var latitude: String? = nil
    var longitude: String? = nil

    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
    }

    init() {}

    var coordinate: CLLocationCoordinate2D? {
        guard let latString = latitude,
              let lonString = longitude,
              let latitude = Double(latString),
              let longitude = Double(lonString) else {
            return nil
        }
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

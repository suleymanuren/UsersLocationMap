
import Foundation

struct Id: Codable {

  var name  : String? = nil
  var value : String? = nil

  enum CodingKeys: String, CodingKey {

    case name  = "name"
    case value = "value"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    name  = try values.decodeIfPresent(String.self , forKey: .name  )
    value = try values.decodeIfPresent(String.self , forKey: .value )
 
  }

  init() {

  }

}
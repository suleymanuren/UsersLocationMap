
import Foundation

struct Name: Codable {

  var title : String? = nil
  var first : String? = nil
  var last  : String? = nil

  enum CodingKeys: String, CodingKey {

    case title = "title"
    case first = "first"
    case last  = "last"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    title = try values.decodeIfPresent(String.self , forKey: .title )
    first = try values.decodeIfPresent(String.self , forKey: .first )
    last  = try values.decodeIfPresent(String.self , forKey: .last  )
 
  }

  init() {

  }

}
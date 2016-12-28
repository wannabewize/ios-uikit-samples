//
//

import Foundation

class Product {
  var code : String!
  var name : String!
  var price : String!
  var image : String!
  
  
  // Designated Initalizer
  init(code : String, name : String, price : String, image : String) {
    self.code = code
    self.name = name
    self.price = price
    self.image = image
  }
}

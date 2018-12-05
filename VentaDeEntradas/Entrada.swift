

import Foundation
import UIKit

class Entrada
{
    var name:String
    var date:String
    var city:String
    var image: UIImage
    var code = Int(arc4random_uniform(10000))
    
    
    init(name: String, date: String, city: String, image: UIImage, code: Int)
    {
        self.name = name
        self.date = date
        self.city = city
        self.image = image
        self.code = code
    }
    
}

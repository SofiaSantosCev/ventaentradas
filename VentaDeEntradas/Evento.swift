

import Foundation
import UIKit

class Evento
{
    var name:String
    var date:String
    var city:String
    var price: Int
    var code: String
    var image: UIImage
    

    init(name: String, date: String, city: String, price: Int, code: String, image: UIImage)
    {
        self.name = name
        self.date = date
        self.city = city
        self.price = price
        self.code = code
        self.image = image
    }
    
    
}


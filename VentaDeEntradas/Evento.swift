

import Foundation
import UIKit

class Evento
{
    //Datos de cada celda de eventos nombre, fecha, imagen, ciudad y precio
    var name:String
    var date:String
    var city:String
    var price: Int
    var image: UIImage
    
    
    init(name: String, date: String, city: String, price: Int, image: UIImage)
    {
        self.name = name
        self.date = date
        self.city = city
        self.price = price
        self.image = image
    }
}


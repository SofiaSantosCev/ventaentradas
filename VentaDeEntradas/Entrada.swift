

import Foundation
import UIKit

class Entrada: NSObject, NSCoding
{
    var name:String
    var date:String
    var city:String
    var image: UIImage
    var code:Int
    var cantidad: String
    
    init(name: String, date: String, city: String, image: UIImage, cantidad: String)
    {
        self.name = name
        self.date = date
        self.city = city
        self.image = image
        self.code = Int(arc4random_uniform(1000000000))
        self.cantidad = cantidad
    }
    
    /*
     Este método sobreescribe el init 
     */
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let image = aDecoder.decodeObject(forKey: "image") as! UIImage
        let date = aDecoder.decodeObject(forKey: "date") as! String
        let city = aDecoder.decodeObject(forKey: "city") as! String
        let cantidad = aDecoder.decodeObject(forKey: "cantidad") as! String
        
        self.init(name: name, date: date, city: city, image: image, cantidad: cantidad)
    }
    
    /*
     Este metodo asigna una clave a cada dato para guardarlo
     */
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(image, forKey: "image")
        aCoder.encode(city, forKey: "city")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(code, forKey: "code")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(cantidad, forKey: "cantidad")
    }
    
}

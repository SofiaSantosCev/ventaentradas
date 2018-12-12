

import UIKit

class EntradasTVCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    var code: Int = Int(arc4random_uniform(1000000000))
    
    @IBOutlet weak var imageEntrada: UIImageView?
}

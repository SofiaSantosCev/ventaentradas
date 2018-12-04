

import UIKit

class EntradasTVCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    var code: String = ""
    
    @IBOutlet weak var imageEntrada: UIImageView?
}

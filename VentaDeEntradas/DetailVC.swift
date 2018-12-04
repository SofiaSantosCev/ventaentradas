
import UIKit

class DetailVC: UIViewController {
  //esta clase no
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    
    var textCode: String = ""
    var textName: String = ""
    var imagePrueba: UIImage = #imageLiteral(resourceName: "vina")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        code.text = textCode
        name.text = textName
        imageDetail.image = imagePrueba
    }
}


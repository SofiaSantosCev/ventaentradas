
import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    
    var textCode:Int?
    var textName: String?
    var imagePrueba: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        code.text = String(textCode!)
        name.text = textName
        imageDetail.image = imagePrueba
    }
}


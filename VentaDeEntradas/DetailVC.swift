
import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var entradas: UILabel!
    
    var textCode: Int?
    var textName: String?
    var imagePrueba: UIImage?
    var numerodeentradas: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        code.text = String(textCode!)
        name.text = textName
        imageDetail.image = imagePrueba
        entradas.text = numerodeentradas!
        
    }
}



import UIKit

class CompraVC: UIViewController {

    @IBOutlet weak var EventName: UILabel!
    @IBOutlet weak var numPrecio: UILabel!
    @IBOutlet weak var numEntradas: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var price: Int = 0
    var text: String?
    var date: String?
    var city: String?
    var image: UIImage?
    var entradasNum:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
        EventName.text = text
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        entradasNum = Int(sender.value)
        numEntradas.text = (entradasNum?.description)! + " entradas"
        numPrecio.text = String(Int(sender.value) * price) + " €"
    }
    
    @IBAction func button(_ sender: Any) {
        if(entradasNum == 0){
            print("Tienes que comprar almenos una entrada")
        } else {
            MisEntradasTVC.SaveTicket(name: text!, city: city!, date: date!, image: image!)
            saveData()
        }
    }
}
    


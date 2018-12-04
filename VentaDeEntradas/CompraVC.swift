
import UIKit

class CompraVC: UIViewController {

    @IBOutlet weak var EventName: UILabel!
    @IBOutlet weak var numPrecio: UILabel!
    @IBOutlet weak var numEntradas: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var price: Int = 0
    var texto: String = ""
    var date: String = ""
    var city: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
        EventName.text = texto
    }

    @IBAction func stepper(_ sender: UIStepper) {
        numEntradas.text = Int(sender.value).description
        numPrecio.text = String(Int(sender.value) * price)
    }
    
    @IBAction func button(_ sender: Any) {
        
        MisEntradasTVC.SaveTicket(name: texto, city: city, date: date)
    }
}

import UIKit

class CompraVC: UIViewController {

    @IBOutlet weak var EventName: UILabel!
    @IBOutlet weak var numPrecio: UILabel!
    @IBOutlet weak var numEntradas: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var ciudad: UILabel!
    @IBOutlet weak var DATE: UILabel!
    
    var price: Int = 0
    var textname: String?
    var date: String?
    var city: String?
    var image: UIImage?
    var entradasNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
        EventName.text = textname
        DATE.text = date
        ciudad.text = city
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        entradasNum = Int(sender.value)
        numEntradas.text = entradasNum.description + " entradas"
        numPrecio.text = String(Int(sender.value) * price) + " €"
    }
    
    @IBAction func button(_ sender: Any) {
        if(entradasNum == 0){
            let alert = UIAlertController(title: "Atención", message: "Tienes que comprar al menos una entrada", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            MisEntradasTVC.SaveTicket(name: textname!, city: city!, date: date!, image: image!)
            saveData()
            let alert = UIAlertController(title: "Enhorabuena", message: "La compra se ha realizado satisfactoriamente", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            /*self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)*/
            
        }
    }
}
    


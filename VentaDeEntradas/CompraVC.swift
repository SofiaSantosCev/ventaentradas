
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
    
    //Este metodo se llama al inicar la aplicación
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.maximumValue = 10
        EventName.text = textname
        DATE.text = date
        ciudad.text = city
        numEntradas.text = String(entradasNum)
        
    }
    
    /*
     El stepper incrementa el numero de entradas y el precio final. El mínimo de entradas es 0 y el máximo 10
     */
    @IBAction func stepper(_ sender: UIStepper) {
        entradasNum = Int(sender.value)
        numEntradas.text = entradasNum.description + " entradas"
        numPrecio.text = String(Int(sender.value) * price) + " €"
    }
    
    /*
     Al pulsar el boton de comprar, si has seleccionado al menos una entrada, aparece un alert avisando de que la compra se ha realizado correctamente y te enviará a la pantalla anterior. En caso de que no hayas comprado ninguna entrada, el alert te avisará de que no se ha podido procesar la compra.
     */
    @IBAction func button(_ sender: Any) {
        if(entradasNum == 0){
            let alert = UIAlertController(title: "Atención", message: "Tienes que comprar al menos una entrada", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            MisEntradasTVC.SaveTicket(name: textname!, city: city!, date: date!, image: image!, cantidad: numEntradas.text!)
            
            saveData()
            
            let alert = UIAlertController(title: "Enhorabuena", message: "La compra se ha realizado satisfactoriamente", preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (a) in
                self.navigationController?.popViewController(animated: true)
            }))
            
            self.present(alert, animated: true)
            
        }
    }
}
    



import UIKit

var entradas = [Entrada]()

//Método que guarda los datos en userDefaults. Este método se llama al comprar una entrada.
func saveData(){
    let userDefaults = UserDefaults.standard
    let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: entradas)
    userDefaults.set(encodedData, forKey: "mis entradas")
    userDefaults.synchronize()
}

class MisEntradasTVC: UITableViewController {
    
    //Este método se ejecuta al iniciar la aplicación. Recarga los datos almacenados en userDefaults.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        uploadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //Asigna el tamaño de la lista al tamaño del array entradas
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entradas.count
    }
    
    //Este método se ejecuta cada ves que se muestra la pantalla.
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EntradasTVCell
        cell.name.text = entradas[indexPath.row].name
        cell.city.text = entradas[indexPath.row].city
        cell.date.text = entradas[indexPath.row].date
        cell.imageEntrada?.image = entradas[indexPath.row].image
        cell.code = entradas[indexPath.row].code
        cell.cantidad = entradas[indexPath.row].cantidad
        
        return cell
    }
    
    //Crea un nuevo objeto entrada y lo añade al array de entradas.
    static func SaveTicket(name: String, city: String, date: String, image: UIImage, cantidad: String){
        entradas.append(Entrada(name: name, date: date, city: city, image: image, cantidad: cantidad))
    }
    
    //Se asigna los datos de la entrada clicada para enviarselos a la clase DetailVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DetailVC {
            let destination = segue.destination as! DetailVC
            let entrada = sender as! EntradasTVCell
            
            destination.textCode = entrada.code
            destination.textName = entrada.name.text!
            destination.imagePrueba = (entrada.imageEntrada?.image!)!
            destination.numerodeentradas = entrada.cantidad
        }
    }
    
    /*
     Este método recarga los datos guardados en userDefaults.
     */
    func uploadData() {
        let userDefaults = UserDefaults.standard
        if(userDefaults.object(forKey: "mis entradas") != nil){
            let decoded = userDefaults.object(forKey: "mis entradas") as! Data
            entradas = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Entrada]
        }
    }
}

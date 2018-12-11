
import UIKit

var entradas = [Entrada]()

func saveData(){
    let userDefaults = UserDefaults.standard
    let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: entradas)
    userDefaults.set(encodedData, forKey: "mis entradas")
    userDefaults.synchronize()
}

class MisEntradasTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
           uploadData()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entradas.count
    }
    
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
    
        return cell
    }
    
    static func SaveTicket(name: String, city: String, date: String, image: UIImage){
        entradas.append(Entrada(name: name, date: date, city: city, image: image))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DetailVC {
            let destination = segue.destination as! DetailVC
            let entrada = sender as! EntradasTVCell
            
            destination.textCode = entrada.code
            destination.textName = entrada.name.text!
            destination.imagePrueba = (entrada.imageEntrada?.image!)!
        }
    }
    
    func uploadData() {
        let userDefaults = UserDefaults.standard
        if(userDefaults.object(forKey: "mis entradas") != nil){
            let decoded = userDefaults.object(forKey: "mis entradas") as! Data
            entradas = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Entrada]
        }
    }
}

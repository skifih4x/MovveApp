
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MyCellDelegate {
    func cellWasPressed() {
        performSegue(withIdentifier: "cellid", sender: nil)
    }
    
    //
    @IBOutlet var table : UITableView!
    
    var characters: ContentTask? {
        didSet {
            table.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        
        NetworkManager.shared.fetchMovie(urlString: Link.movieUrlApi.rawValue) { result in
            switch result {
            case .success(let result1):
                self.characters = result1
            case .failure(let error):
                print("хер", error)
            }
        }
    }
    
    //Tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        if let movie = characters?.results {
        cell.configure(with: movie)
            cell.delegate = self
        }
        
        switch indexPath.section {
        case 0: cell.setLabel(text: "Popular Movie")
        case 1: cell.setLabel(text: "TV Shows")
        case 2: cell.setLabel(text: "Continue Watching")
        default: break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    

}



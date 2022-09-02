
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MyCellDelegate {
    func cellWasPressed() {
    }
    let sectionTitles = ["Popular movie", "Popular tvshow", "Popular upcomming"]
    
    @IBOutlet var table : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }

    //Tableview
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.delegate = self
        cell.delegateDetail = self
        switch indexPath.section {
        case 0:
            NetworkManager.shared.fetchMovie(urlString: Link.movieUrlApi.rawValue) { result in
                switch result {
                    
                case .success(let movie):
                    cell.configuremovie(with: movie)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case 1:
            NetworkManager.shared.fetchMovie(urlString: Link.tvUrlApi.rawValue) { result in
                switch result {
                    
                case .success(let movie):
                    cell.configuremovie(with: movie)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 30, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .red
        
    }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         30
    }
    
}

extension ViewController: CollectionViewTableViewCellDelegate {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionTableViewCell, viewModel: TitlePreviewViewModel) {
        performSegue(withIdentifier: "cellid", sender: nil)
        DispatchQueue.main.async  {
            let vc = TitlePreviewViewController()
            vc.configure(with: viewModel)
//            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

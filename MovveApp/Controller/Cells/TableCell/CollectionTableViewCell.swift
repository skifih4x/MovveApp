//
//  CollectionTableViewCell.swift
//  MovveApp
//
//  Created by Podgainy Sergei on 31.08.2022.
//

import UIKit

protocol CollectionViewTableViewCellDelegate: AnyObject {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionTableViewCell, viewModel: TitlePreviewViewModel)
}

protocol MyCellDelegate {
    func cellWasPressed()
}

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var delegate: MyCellDelegate?
    var delegateDetail: CollectionViewTableViewCellDelegate?
    
    static let identifier = "CollectionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionTableViewCell", bundle: nil)
    }
    
    var models = [Results]()
    
    
    func configuremovie(with models1: [Results]) {
        models = models1
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var collectionView: UICollectionView!
    
    func setLabel(text: String) {
        label.text = text
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
        print(models.count)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.configure(with: models[indexPath.row])
        cell.myLabelTv.text = models[indexPath.row].name
        cell.myLabelReliseTv.text = models[indexPath.row].first_air_date
        
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        collectionView.deselectItem(at: indexPath, animated: true)
        let modelmovie = models[indexPath.row]
        guard let titleName = modelmovie.name ?? modelmovie.title else {
            return
        }
        
        NetworkManager.shared.fetchMovie(urlString: Link.movieUrlApi.rawValue) { [weak self] result in
            switch result {
            case .success(_):
                
                let mode = self?.models[indexPath.row]
                guard let titleOverview = mode?.overview else {
                    return
                }
                guard let strongSelf = self else {
                    return
                }
                let viewModel = TitlePreviewViewModel(
                    title: titleName,
                    image: mode?.poster_path ?? "",
                    titleOverview: titleOverview,
                    genre_ids: mode!.genre_ids,
                    release: (mode?.release_date ?? mode?.first_air_date)!,
                    rating: (mode?.vote_average)!,
                    id: (mode?.id)!
                )
                self?.delegateDetail?.collectionViewTableViewCellDidTapCell(strongSelf, viewModel: viewModel)
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
}

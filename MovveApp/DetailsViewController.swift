//
//  DetailsViewController.swift
//  MovveApp
//
//  Created by Артем Орлов on 01.09.2022.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    @IBOutlet var imagePoster: UIImageView!
    
    @IBOutlet var nameContent: UILabel!
    @IBOutlet var ageRealiceLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    
    @IBOutlet var overviewTextField: UITextView!
    
    @IBOutlet var actionCollectionCell: UICollectionViewCell!
    
    var nameVar: String?
    var overrideVar: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public func configure(with model: TitlePreviewViewModel) {
        nameContent?.text = model.title
        overviewTextField?.text = model.titleOverview
        genreLabel?.text = model.image
        
        print(model.title)
        print(model.titleOverview)
        print(model.image)
        print(nameContent?.text)
    }
}

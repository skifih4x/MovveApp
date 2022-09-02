//
//  MyCollectionViewCell.swift
//  MovveApp
//
//  Created by Podgainy Sergei on 31.08.2022.
//

import UIKit
import Kingfisher



class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var myImageView: UIImageView!
    
    @IBOutlet var myLabelMovie: UILabel!
    @IBOutlet var myLabelReliseMovie: UILabel!
    
    @IBOutlet var myLabelTv: UILabel!
    @IBOutlet var myLabelReliseTv: UILabel!

    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        myImageView.layer.cornerRadius = 20
    
    }
    
    public func configure(with model: Results) {
        myLabelMovie.text = model.title
        myLabelReliseMovie.text = model.release_date
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/original\(model.poster_path)" ) else {return}
        DispatchQueue.global().async {
            guard let url = URL(string: "https://image.tmdb.org/t/p/original\(url)" ) else {return}
            guard let imageData = try? Data(contentsOf: url) else {return}
            DispatchQueue.main.async {
                self.myImageView.image = UIImage(data: imageData)
            }
        }

    }

}

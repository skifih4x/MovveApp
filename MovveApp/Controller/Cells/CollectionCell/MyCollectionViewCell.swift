//
//  MyCollectionViewCell.swift
//  MovveApp
//
//  Created by Podgainy Sergei on 31.08.2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        myImageView.layer.cornerRadius = 20
    
    }
    
    public func configure(with model: Results) {
        self.myLabel.text = model.title
        DispatchQueue.global().async {
            guard let url = URL(string: "https://image.tmdb.org/t/p/original\(model.poster_path ?? "")" ) else {return}
            guard let imageData = try? Data(contentsOf: url) else {return}
            DispatchQueue.main.async {
                self.myImageView.image = UIImage(data: imageData)
            }
            print(model.id!)
        }
    }

}

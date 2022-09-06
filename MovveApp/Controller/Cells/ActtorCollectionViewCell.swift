//
//  ActtorCollectionViewCell.swift
//  MovveApp
//
//  Created by Артем Орлов on 04.09.2022.
//

import UIKit
import Kingfisher

class ActtorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var photoActorImage: UIImageView!
    
    @IBOutlet var nameActorLabel: UILabel!
    @IBOutlet var nameCharacterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

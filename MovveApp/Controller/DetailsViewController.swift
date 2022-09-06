//
//  DetailsViewController.swift
//  MovveApp
//
//  Created by Артем Орлов on 01.09.2022.
//

import UIKit
import Kingfisher
import SafariServices

class DetailsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var imagePoster: UIImageView!
    @IBOutlet var nameContent: UILabel!
    @IBOutlet var ageRealiceLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var overviewTextField: UITextView!
    @IBOutlet var averigeLabel: UILabel!
    
    @IBOutlet weak var actorCollectionView: UICollectionView!
    
    private var gradient: CAGradientLayer!
    
    var string: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        imagePoster.layer.cornerRadius = 10
        setGradient()
        dismiss(animated: false)
        
        
        
    }
    
    @IBAction func button(_ sender: Any) {
        
        if let url = URL(string: "https://www.themoviedb.org/movie/") {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true)
        }
    }
    
    
    func setGradient() {
        gradient = CAGradientLayer()
        gradient.frame = imagePoster.bounds
        gradient.colors = [UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0.0, 0.4, 0.8, 0.9, 1.0]
        imagePoster.layer.mask = gradient
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.frame = imagePoster.bounds
        print(string)
    }
    
    public func configure(with model: TitlePreviewViewModel?) {
        string = "\(model?.id ?? 0)"
        nameContent.text = model?.title
        overviewTextField.text = model?.titleOverview
        genreLabel.text = model?.genres
        ageRealiceLabel.text = model?.release
        averigeLabel.text = "Average rating: " + String(format: "%.1f", model?.rating ?? "")
        guard let url = URL(string: "https://image.tmdb.org/t/p/original\(model!.image)") else {
            return
        }
        imagePoster?.kf.setImage(with: url)
    }
}


extension DetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        imagePoster.alpha = scrollView.contentOffset.y / -95.0
        
    }
}

//
//  MovieCell.swift
//  MoviePlayer
//
//  Created by Karin Prater on 06.08.21.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var movie: Movie?  {
        didSet {
            if let movie = movie, let url = URL(string: movie.posterImageURL) {
                
                ImageCache.publicCache.load(url: url as NSURL) { [weak self] url, image in
                    let url = url as URL
                    
                    //checking if the returned image corresponse to current movie
                    if let  image = image, self?.movie?.posterImageURL == url.absoluteString {
                        self?.cardImage.image = image
                    }
                }
            }
        }
    }
    
    let imageLoader = ImageLoader()
    
    static let identifier = "movieCell"
    let titleLabel = UILabel()
    
    let cardImage = CardImageUIView()
    
    var heightConstraint: NSLayoutConstraint?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func configure() {
//        self.titleLabel.backgroundColor = UIColor.lightGray
        self.contentView.layer.shadowColor = UIColor.gray.cgColor
        self.contentView.layer.shadowRadius = 10
        
      //TODO: - when to call configure?
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
       
        contentView.addSubview(cardImage)
        contentView.addSubview(titleLabel)

        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
       
        //TODO: fix unable to satisfy all constraints
        NSLayoutConstraint.activate([
            cardImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            cardImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            cardImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: spacing),
//            cardImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -2 * spacing),
//            cardImage.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.55),
            
            
            titleLabel.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: spacing),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,  constant: spacing),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,  constant: -spacing),
           titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,  constant: -spacing)
            ])
        
        
    }
    let spacing = CGFloat(15)
    

}

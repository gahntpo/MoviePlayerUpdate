//
//  CardImageUIView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 07.08.21.
//

import UIKit

class CardImageUIView: UIView {
    
   private let imageView = UIImageView()
    
    var image: UIImage? {
        didSet {
            if let image = image {
                self.imageView.image = image
                updateAspectRatioConstraint()
            }
        }
    }
    
    let inset: CGFloat = 0
    
      override init(frame: CGRect) {
          super.init(frame: frame)
        setup()
      }

      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
      }

      convenience init() {
        self.init(frame: .zero)
      }

      func setup() {

        //Styling
        imageView.image = UIImage(named: "MovieDisabled")
        imageView.layer.cornerRadius = 20
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor.systemBackground
        
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor(white: 0, alpha: 0.65).cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: inset),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -inset)
        ])
       updateAspectRatioConstraint()
      }
    

    private var aspectRatioConstraint:NSLayoutConstraint? = nil

    
    func updateAspectRatioConstraint() {
        // remove any existing aspect ratio constraint
        if let c = self.aspectRatioConstraint {
          self.removeConstraint(c)
        }
        
        if let size = imageView.image?.size, size.height != 0 {
            
            let aspectRatio = size.width / size.height
            let c = NSLayoutConstraint(item: imageView, attribute: .width,
                                       relatedBy: .equal,
                                       toItem: imageView, attribute: .height,
                                       multiplier: aspectRatio, constant: 0)
            
           self.addConstraint(c)
            self.aspectRatioConstraint = c
            
        }
    }

}

//
//  AlbumCollectionViewCell.swift
//  Adrea_Test
//
//  Created by Yassine EL HALAOUI on 11/6/18.
//  Copyright © 2018 YEL. All rights reserved.
//

import UIKit
import Kingfisher

class AlbumCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    var album: Album? {
        didSet {
            if let imgUrlString = album?.imageUrl,
                let imgUrl = URL(string: imgUrlString),
                let count = album?.count,
                let name = album?.name {


                imageView.kf.setImage(with: imgUrl)
                titleLabel.text = "\(name)  ( \(String(count)) )"
            }


        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

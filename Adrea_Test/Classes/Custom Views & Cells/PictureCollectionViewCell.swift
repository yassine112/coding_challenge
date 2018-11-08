//
//  PictureCollectionViewCell.swift
//  Adrea_Test
//
//  Created by Yassine EL HALAOUI on 11/8/18.
//  Copyright © 2018 YEL. All rights reserved.
//

import UIKit
import Kingfisher

class PictureCollectionViewCell: UICollectionViewCell {



    // MARK: - Outlets
    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var titleLab: UILabel!

    var picture: Picture? {
        didSet {
            if let source = picture?.source {
                self.picImageView.kf.setImage(with: URL(string: source))
                self.titleLab.text = picture?.name ?? "This pic hase no name"
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

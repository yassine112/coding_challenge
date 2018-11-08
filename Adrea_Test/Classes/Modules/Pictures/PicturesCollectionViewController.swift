//
//  PicturesCollectionViewController.swift
//  Adrea_Test
//
//  Created by Yassine EL HALAOUI on 11/7/18.
//  Copyright © 2018 YEL. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PicturesCollectionViewController: UICollectionViewController {

    var presenter: PicturesPresenter!

    private var pictures = [Picture]()
    var albumId: String!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UINib(nibName: "PictureCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        presenter.attach(self)
        presenter.getPictures()

        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        let cellWidth = (self.collectionView.frame.width / 2) - 8
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth + 100)
        // Do any additional setup after loading the view.
    }

    // MARK: - Delegate & Datasource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return pictures.count

    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PictureCollectionViewCell {
    
            // Configure the cell
            cell.picture = pictures[indexPath.row]
            return cell

        }
        return UICollectionViewCell()
    }

}

extension PicturesCollectionViewController: PicturesView {

    func setPictures(pictures: [Picture]) {
        self.pictures = pictures
        self.collectionView.reloadData()
    }

    func getAlbumId() -> String {
        return albumId
    }

    func faild(error: String) {
        print(error)
    }

}

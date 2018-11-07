//
//  AlbumPicturesViewController.swift
//  Adrea_Test
//
//  Created by Fly on 11/5/18.
//  Copyright © 2018 Fly. All rights reserved.
//

import UIKit
import FBSDKLoginKit

protocol AlbumPicturesView: class {
    func setAlbums(albums: [Album])
    func showLoginPage()
    func faild(error: String)
}

class AlbumPicturesViewController: UICollectionViewController {

    var presenter: AlbumPicturesPresenter!
    private var albums = [Album]()

    let cellId = "albumCell"

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
         self.collectionView.register(UINib(nibName: "AlbumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)

        presenter.attach(view: self)
        presenter.getAlbums()

        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        let cellWidth = (self.collectionView.frame.width / 2) - 8
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)

    }

    deinit {
        presenter.detachView()
    }

    // MARK: - Delegate & Data Source
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? AlbumCollectionViewCell {
            cell.album = albums[indexPath.row]
            return cell
        }

        return UICollectionViewCell()
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}

extension AlbumPicturesViewController: AlbumPicturesView {

    func setAlbums(albums: [Album]) {
        self.albums = albums
        self.collectionView.reloadData()
    }

    func faild(error: String) {
        print(error)
    }

    // MARK: - Navigation
    func showLoginPage() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let fbConnectVC = storyboard.instantiateViewController(withIdentifier: "facebookConnectViewController") as! FacebookConnectViewController
        present(fbConnectVC, animated: true, completion: nil)
    }

}

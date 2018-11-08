//
//  AlbumPicturesViewController.swift
//  Adrea_Test
//
//  Created by Yassine EL HALAOUI on 11/5/18.
//  Copyright © 2018 YEL. All rights reserved.
//

import UIKit
import FBSDKLoginKit

protocol AlbumPicturesView: class {
    func setAlbums(albums: [Album])
    func showLoginPage()
    func faild(error: String)
}

private let cellId = "cell"

class AlbumPicturesViewController: UICollectionViewController {

    var presenter: AlbumPicturesPresenter!
    private var albums = [Album]()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
         self.collectionView.register(UINib(nibName: "AlbumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)

        presenter.attach(view: self)

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logout))

        // Set up the cell size
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidth = (self.collectionView.frame.width / 2) - 8
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth + 100)

    }

    @objc func logout() {
       presenter.logout()
    }

    override func viewWillAppear(_ animated: Bool) {
        presenter.getAlbums()
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

        // Push the next Poctures View Controller
        // We pass the album id
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let picturesVC = storyboard.instantiateViewController(withIdentifier: "picturesCollectionViewController") as! PicturesCollectionViewController
        picturesVC.albumId = albums[indexPath.row].id
        picturesVC.presenter = PicturesPresenter()
        self.navigationController?.pushViewController(picturesVC, animated: true)
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

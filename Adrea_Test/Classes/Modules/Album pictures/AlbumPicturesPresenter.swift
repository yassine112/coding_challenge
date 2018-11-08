//
//  AlbumPicturesPresenter.swift
//  Adrea_Test
//
//  Created by Yassine EL HALAOUI on 11/5/18.
//  Copyright © 2018 YEL. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class AlbumPicturesPresenter {

    weak var view: AlbumPicturesView?
    let manager = FBSDKLoginManager()

    /// Connect the presenter to the view to use here functions
    func attach(view: AlbumPicturesView) {
        self.view = view
    }

    func detachView() {
        self.view = nil
    }

    /// Get user albums from Facebook SDK
    /// Before we check if the user if connected
    /// Success : we fire setAlbum from the view
    /// Failure : we fire Faild from the view
    func getAlbums() {

        if !FBSDKAccessToken.currentAccessTokenIsActive() {
            view?.showLoginPage()
        } else {
            FBSDKGraphRequest(graphPath: "/me/albums?fields=picture,name,count", parameters: [:], httpMethod: "GET").start(completionHandler: {  (connection, result, error) in
                if error != nil {
                    self.view?.faild(error: error.debugDescription)
                    return
                }

                let albums = self.extractAlbumList(result)
                self.view?.setAlbums(albums: albums)

            })
        }

    }

    /// Extract Albums from sdk albums call and return an array of albums
    /// @Param data: Any?
    /// @Return [Album]
    private func extractAlbumList(_ data: Any?) -> [Album] {

        var albums = [Album]()
        if let res = data as? [String: Any] {
            if let data = res["data"] as? NSArray {
                for item in data {
                    if let itemD = item as? [String: Any] {
                        if let id = itemD["id"] as? String ,
                            let count = itemD["count"] as? Int,
                            let name = itemD["name"] as? String,
                            let picture = itemD["picture"] as? [String: [String: Any]],
                            let data = picture["data"],
                            let url = data["url"] as? String {

                            // Add the album to the  list that we going to return
                            albums.append(Album(id: id, name: name, count: count, imageUrl: url))

                        }
                    }
                }
            }
        }
        return albums
    }

    func logout() {
        manager.logOut()
        view?.showLoginPage()
    }
    
}

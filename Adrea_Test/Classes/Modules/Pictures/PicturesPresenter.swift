//
//  PicturesPresenter.swift
//  Adrea_Test
//
//  Created by Yassine EL HALAOUI on 11/8/18.
//  Copyright © 2018 YEL. All rights reserved.
//

import Foundation
import FBSDKLoginKit

protocol PicturesView: class {
    func setPictures(pictures: [Picture])
    func getAlbumId() -> String
    func faild(error: String)
}

class PicturesPresenter {

    private weak var view: PicturesView?

    /// Connect the presenter to the view to use here functions
    func attach(_ View: PicturesView) {
        self.view = View
    }

    /// Deconnect the presenter from the view
    func dettachView() {
        self.view = nil
    }

    /// Get Pictures by album
    /// Success : we fire setPictures from the view
    /// Failure : we fire Faild from the view
    func getPictures() {

        if let id = view?.getAlbumId() {
            FBSDKGraphRequest(graphPath: "/\(id)/photos?fields=picture,images,name", parameters: [:], httpMethod: "GET")?.start(completionHandler: { (connection, result, error) in
                if error != nil {
                    self.view?.faild(error: error.debugDescription)
                    return
                }

                let pictures = self.extractImageList(result)
                self.view?.setPictures(pictures: pictures)
            })

        }
    }

    /// Extract Pictures from sdk albums call and return an array of picturs
    /// @Param data: Any?
    /// @Return [Picture]
    func extractImageList(_ Data: Any?) -> [Picture] {

        var pictures = [Picture]()

        if let result = Data as? [String: Any] {
            if let data = result["data"] as? NSArray {
                for item in data {
                    if let itemD = item as? [String: Any] {
                        if let id = itemD["id"] as? String, let images = itemD["images"] as? NSArray, let image = images[0] as? [String: Any], let source = image["source"] {

                            let pic = Picture(id: id, name: itemD["name"] as? String, source: source as! String)
                            pictures.append(pic)

                        }
                    }
                }
            }
        }

        return pictures
    }
    
}

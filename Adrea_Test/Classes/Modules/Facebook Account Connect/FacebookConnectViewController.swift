//
//  FacebookConnectViewController.swift
//  Adrea_Test
//
//  Created by Fly on 11/4/18.
//  Copyright © 2018 Fly. All rights reserved.
//

import UIKit
import FacebookCore

class FacebookConnectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let connection = GraphRequestConnection()
        connection.add(GraphRequest(graphPath: "/me")) { httpResponse, result in

            print(result)

        }

        // Do any additional setup after loading the view.
    }

}

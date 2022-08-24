//
//  ViewController.swift
//  Network-Layer
//
//  Created by Obaid on 15/07/2022.
//

import UIKit
class TodoRequest: Encodable {
    var userId: Int = 0
}

class Todo: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nework: Networking = NetworkManager.shared
        let endPoint:URLRequestable = Request(_endPoint: TodoAPI.getTodoById("7"))
        nework.execute(request: endPoint, type: [Todo].self) { result in
            switch result {
            case .success(let data):
            print(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}


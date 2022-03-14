//
//  ViewController.swift
//  Concurrency_DispatchQueues
//
//  Created by Aaryaman Saini on 14/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getData()
        
        backgroundWork()
    }
    
    func backgroundWork() {
        DispatchQueue.global(qos: .unspecified).async {
            // do stuff here
        }
    }
    
    func getData() {
        
        guard let url = URL(string: "") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {[weak self] data, response, error in
            guard data != nil else {
                return
            }
            
            // self.view.backgroundColor = .red
            // as of now this will cause memory retain cycle; so we can use self here
            
            DispatchQueue.main.async {
                self?.view.backgroundColor = .red
            }
        })
        
        task.resume()
    }


}


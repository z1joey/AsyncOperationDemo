//
//  ViewController.swift
//  AsyncOperationDemo
//
//  Created by Yi Zhang on 2019/4/16.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let input = [(1,5),(5,8),(6,1),(3,9),(6,12),(1,0)]
        for (lhs, rhs) in input {
            let operation = SumOperation(lhs: lhs, rhs: rhs)
            operation.completionBlock = {
                guard let result = operation.result else { return }
                print("\(lhs) + \(rhs) = \(result)")
            }
            additionQueue.addOperation(operation)
        }
        
        sleep(5)
        print("done")
    }
    
}


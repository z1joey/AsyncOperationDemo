//
//  SumOperation.swift
//  AsyncOperationDemo
//
//  Created by Yi Zhang on 2019/4/16.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

import UIKit

let additionQueue = OperationQueue()
func asyncAdd_OpQ(lhs: Int, rhs: Int, callback: @escaping (Int) -> ()) {
    additionQueue.addOperation {
        sleep(1) // the delay here should be less than the delay before Playground.current.finishedExecution() kicks in
        callback(lhs + rhs)
    }
}

class SumOperation: AsyncOperation {
    let lhs: Int
    let rhs: Int
    var result: Int?
    
    init(lhs: Int, rhs: Int) {
        self.lhs = lhs
        self.rhs = rhs
        super.init()
    }
    
    override func main() {
        asyncAdd_OpQ(lhs: lhs, rhs: rhs) { result in
            self.result = result
            self.state = .Finished
        }
    }
}

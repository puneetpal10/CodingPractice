//
//  ViewController.swift
//  CodingPractice
//
//  Created by puneet pal on 14/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var input = [12,1,0,12,0,3]
        moveZeroes(&input)
        
        let output = addTwoSum([8,5,3,4], target: 12)
        print(output)
        
    }
    
    func addTwoSum(_ nums: [Int], target: Int) -> [Int]{
        
        for i in 0 ... nums.count - 1 {
            for j in i+1 ... nums.count - 1 {
                
                if nums[i] == target - nums[j]{
                    return [i,j]
                }
            }
        }
        return[2]
    }
    
    func moveZeroes(_ nums: inout [Int]) {
        
        if nums.count < 2 {
            return
        }
        
        var j = 0
        
        while j < nums.count, nums[j] != 0 {
            j += 1
        }
        
        if j < nums.count - 1{
            for i in j+1..<nums.count {
                if nums[i] != 0 {
                    nums.swapAt(i, j)
                    j += 1
                }
            }
        }
        print(nums)
    }
}


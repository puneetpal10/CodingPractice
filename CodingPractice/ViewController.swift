//
//  ViewController.swift
//  CodingPractice
//
//  Created by puneet pal on 14/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    let array = [1,4,6,7,10,12,18,19,23,23]
    let str = "puneet"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        var input = [12,1,0,12,0,3]
//        moveZeroes(&input)
//
//        let output = addTwoSum([8,5,3,4], target: 12)
//        print(output)
        
//       let count = lengthOfLongestSubstring("pwwkew")
//        print(count)
//
//        _ = binarySearch(array: array, key: -23)
//
        
        
       //let value =  checkBalancedBrackets(string: "[[]")
//        print(value)
        
//        print(reverseString(str))
        
     //   floyedTraingle(length: 5)


    }
    
    
    func checkBalancedBrackets(string: String) -> Bool {
        
        var stack = [Character]()
        let mapBrackets : [Character: Character] = ["}":"{", ")":"(", "]":"["]
        let openingBrackets = "([{"
        for char in string {
            if openingBrackets.contains(char){
                stack.append(char)
            }
            else {
                if stack.isEmpty {
                    return false
                }
                else
                if let last = stack.last, last == mapBrackets[char] {
                   _ = stack.popLast()
                }
                else {
                    return false
                }
            }
        }
        return stack.isEmpty
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
    
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
               var characterDict = [Character:Int]()
               var maxLength = 0
               var lastRepeatPos = -1
               var i = 0
               
               for c in s {
                   if (characterDict[c] != nil) && (characterDict[c]! > lastRepeatPos) {
                       lastRepeatPos = characterDict[c]!
                   }
                   
                   maxLength = max(i - lastRepeatPos, maxLength)
                   characterDict[c] = i
                   i += 1
               }
               
               return maxLength
    }
    
    
    func binarySearch(array: [Int], key: Int) -> Bool {
        if array.count == 0 {return false}
        
        
        let minIndex = 0
        let maxIndex = array.count - 1
        let midIndex = maxIndex/2
        let midValue = array[midIndex]
        
        
        if key < array[minIndex] || key > array[maxIndex]{
            print("\(key) is not found in array")
            return false
        }
        
        if key > midValue {
            let slice = Array(array[midIndex + 1...maxIndex])
            return binarySearch(array: slice, key: key)
        }
        
        if key < midValue {
            let slice = Array(array[minIndex...midIndex - 1])
            return binarySearch(array: slice, key: key)
        }
        
        if key == midValue{
            print("\(key) found in array")
            return true
        }
        return false
    }
    
    
    func reverseString(_ originalStr: String) -> String {
        var word = [Character]()
        for char in originalStr {
            word.insert(char, at: 0)
        }
        return String(word)
    }
    
    func floyedTraingle(length: Int) {
        var k = 0
        
        for i in 0 ..< length {
            for j in 0 ..< i {
                k += 1
                
                print("\(k)  ")
            }
            print(" ")
        }
    }
}




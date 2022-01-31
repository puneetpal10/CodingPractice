//
//  LinkList.swift
//  CodingPractice
//
//  Created by puneet pal on 23/01/22.
//

import Foundation

class LinkListVC: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        let node1 = Node(data: 1)
//        let node2 = Node(data: 2, node1)
//        let node3 = Node(data: 3, node2)
//
//        printLinkListSimple(node3)
        
        
        let linkList = LinkList()
        linkList.addFront(3)
        linkList.addFront(2)
        linkList.addFront(1)
        
        linkList.printLinkListVal()
//
//        let val = linkList.getFrist()
//        print("First value is \(val ?? 0)")
        
        linkList.addLast(10)
        linkList.addLast(20)
        linkList.printLinkListVal()

        
        
        //[1, 2, 3, 10, 20]
        //[1, 2,25, 3, 10, 20]

        
        
//        linkList.insert(data: 25, position: 2)
//
        linkList.printLinkListVal()

        
//        linkList.deleteFirst()
//        linkList.printLinkListVal()
        
//        linkList.deleteLast()
//        linkList.printLinkListVal()
        
        linkList.deleteAtPosition(position: 2)
        linkList.printLinkListVal()
//        linkList.addFront(5)
//        linkList.printLinkListVal()
        
        
//                let val = linkList.getLast()
//                print("Last value is \(val ?? 0)")

    }
    


    func printLinkListSimple(_ head: Node?) {
        if head == nil {return}
        
        var node = head
        print(node!.data)

        while(node?.next != nil){
            print(node!.next!.data)
            node = node?.next
        }
        
    }
    
    


}


class Node {
    var data: Int
    var next: Node?
    
    init(data: Int,_ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}


class LinkList {
    private var head: Node?
    
    func addFront(_ data: Int){
        let newNode = Node(data: data)
        newNode.next = head
        head = newNode
    }
    
    
    func getFrist() -> Int? {
        if head == nil {return nil}
        return head?.data
    }
    
    
    func addLast(_ data: Int) {
        let nNode = Node(data: data)
        
        if head == nil {
            head = nNode
            return
        }
        
        var node = head!
        while (node.next != nil){
            node = node.next!
        }
        node.next = nNode
    }
    
    func getLast() -> Int? {  //My Self
        if head == nil {
            return nil
        }
        var node = head!
        while (node.next != nil){
            node = node.next!
        }
        
        return node.data
    }
    
    
    func insert(data: Int, position: Int){
        
        if position == 0 {
            addFront(data)
            return
        }
        
        let nNode = Node(data: data)
        var currenNode = head
        
        for _ in 0..<position - 1 {
            currenNode = currenNode?.next
        }
        nNode.next = currenNode?.next
        currenNode?.next = nNode
    }
    
    func deleteFirst() {
        head = head?.next
    }
    
    
    func deleteLast() {
//        [1,2,3,4]
        var nextNode = head
        var previousNode: Node?
        
        while(nextNode?.next != nil){
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nil
    }
    
    
    func deleteAtPosition(position: Int) {  //Implemented self
        
        if position == 0 {
            deleteFirst()
            return
        }
        //        [1,2,3,4]
        var node = head
        var previousNode: Node?
        
        for _ in 0..<position {
            previousNode = node
            node = node?.next
        }
        
        previousNode?.next = node?.next
        
    }
    
    func isEmpty() -> Bool {
        
        if head == nil{
            return true
        }
        return false
    }
    
    func clear(){
        head = nil
    }
    
    func printLinkListVal()
    {
        if head == nil {return}
        
        var result = [Int]()
        var node = head
        
        result.append(node!.data)
        
        
        while (node?.next != nil) {
            result.append(node!.next!.data)
            node = node?.next
        }
        
        print(result)
    }
}



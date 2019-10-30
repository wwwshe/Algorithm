import UIKit
enum node{
    indirect case Node(id: Int?, next: node?)
    
}
struct linkedList {
    var numberOfData: Int
    var head: node
    var current: node
    var before: node
    init() {
        numberOfData = 0
        head = node.Node(id: nil, next: nil)
        current = node.Node(id: nil, next: nil)
        before = node.Node(id: nil, next: nil)
    }
}

extension linkedList {
    mutating func ListInsert(_ data: Int) {
        guard case let .Node(id, next) = self.head else {
            return
            }
        let newNode = node.Node(id: data, next: next)
        head = node.Node(id: id, next: newNode)
        numberOfData = numberOfData + 1
        }
    mutating func ListFirst(_ dataOut : inout Int) -> Bool {
        guard case let .Node(_, next) = self.head else { return false }
        if next == nil { return false }
        before = head
        guard case let .Node(data, next2) = next! else { return false }
        current = node.Node(id: data, next: next2)
        dataOut = data!
        return true
    }
    mutating func ListNext(_ dataOut: inout Int) -> Bool {
        guard case let .Node(_, next) = self.current else { return false }
        if next == nil { return false }
        before = current
        guard case let .Node(data2, next2) = next! else { return false }
        current = node.Node(id: data2, next: next2)
        dataOut = data2!
        return true
    }
    mutating func ListRemove() -> Int {
        guard case let .Node(data, next) = self.current else { return -1 }
        let removeData = data!
        guard case let .Node(id, _) = self.before else { return -1 }
        before = node.Node(id: id, next: next)
        current = before
        head = node.Node(id: nil, next: before)
        numberOfData = numberOfData - 1
        return removeData
    }
    func ListCount() -> Int {
        return numberOfData
        
    }
}
func main() {
    var list = linkedList()
    var data: Int = -1
    list.ListInsert(11)
    list.ListInsert(11)
    list.ListInsert(22)
    list.ListInsert(22)
    list.ListInsert(33)
    print("number of current data : \(list.ListCount())")
    if (list.ListFirst(&data)) {
        print("\(data) ")
        while (list.ListNext(&data)) {
            print("\(data) ")
        }
    }
    print("")
    if (list.ListFirst(&data)) {
        if (data == 22) {
            list.ListRemove()
        }
        while (list.ListNext(&data)) {
            if (data == 22) {
                list.ListRemove()
            }
        }
    }
    print("number of current data : \(list.ListCount())")
    if (list.ListFirst(&data)) {
        print("\(data) ")
        while (list.ListNext(&data)) {
            print("\(data) ")
            
        }
    }
}
main()


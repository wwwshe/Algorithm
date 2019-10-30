import UIKit

var A = [1, 2, 5, 4, 3, 7, 8, 9, 11, 12, 6, 10]




func searchBinary(values : [Int], searchVal : Int) -> Int {
    var middle = values.count / 2
    var leftIdx = 0

    while(middle != 1){
        for i in leftIdx..<middle{
            if A[i] == searchVal {
                print("idx : \(i)")
                return i
            }
        }
        leftIdx = middle
        middle = ((values.count - leftIdx) / 2) + leftIdx
    }
    return -1
}

searchBinary(values: A, searchVal: 7)

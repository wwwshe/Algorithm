import UIKit


var A = [1,2,3,4,3,4,1,2,3,4,6,2]

var idxArray = [Int]()

for i in 1..<A.count - 1{
    if A[i - 1] < A[i] && A[i]>A[i+1]{
        idxArray.append(i)
    }
}

for i in (1...A.count).reversed() {
    if A.count % i == 0 {
        let blockCount = (A.count / i)
        var ithOkBlock = 0
        for idx in idxArray{
            if idx / blockCount == ithOkBlock {
                ithOkBlock += 1
            }
        }
        if ithOkBlock == i {
            print(ithOkBlock)
            break
        }
    }
}



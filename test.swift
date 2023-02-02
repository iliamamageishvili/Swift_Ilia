func minSplit(amount: Int) -> Int {
    var d = Array(repeating: Int.max, count: amount + 1)
    d[0] = 0 
    let coinArray = [1, 5, 10, 20, 50]
    for i in 1...amount {
        for j in 0..<coinArray.count {
            if coinArray[j] <= i {
                d[i] = min(d[i], d[i - coinArray[j]] + 1)
            }
        }
    }
     return d[amount]
}
print(minSplit(amount:9))
print(minSplit(amount:26))
print(minSplit(amount:172))


func sumOfDigits(start: Int, end: Int) -> Int {
    var sum = 0
    for i in start...end {
        let digits = String(i).map { Int(String($0))! }
        sum += digits.reduce(0, +)
    }
    return sum
}
print(sumOfDigits(start:7,end:8))
print(sumOfDigits(start:17,end:20))
print(sumOfDigits(start:10,end:12))


func isProperly( sequence: String) -> Bool {
    var stack = [Character]()
    for char in sequence {
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.removeLast()
            }
        }
    }
    return stack.isEmpty
}
print(isProperly(sequence: "(()())"))
print(isProperly(sequence: ")(()"))
print(isProperly(sequence: "(()())("))


func countWays(n: Int, steps: [Int]) -> Int {
   if steps[0] == 0 && steps[1] == 0 {
      return 0
   }
   var dp = Array(repeating: 0, count: n + 1)
   if steps[0] != 0 {
      dp[1] = 1
   }
   if steps[1] != 0 {
      dp[2] = dp[1] + 1
   }
 
   for j in 3...n {
      if steps[j - 2] == 0 && steps[j - 1] == 0 {
         return 0
      }
      if steps[j - 1] == 1 {
         dp[j] = dp[j - 1] + dp[j - 2]
      }
   }
   return dp[n - 1] +  dp[n]
}
print(countWays(n: 3, steps: [0, 1, 0]))
print(countWays(n: 4, steps: [0, 1, 1, 0]))
print(countWays(n: 5, steps: [1, 1, 0, 1, 1]))


func zeros(N : Int) -> Int {
    var count = 0
    var i = 5
    while (i <= N) {
        count += N / i
        i *= 5
    }
    return count
}
print(zeros(N: 7))
print(zeros(N: 12))
print(zeros(N: 490))

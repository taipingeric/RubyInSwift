# RubyInSwift
## Some Ruby functions implemented in Swift

* **sample**: Return random element(s) from collection
```swift
[1,2,3].sample                          // 2
[1,2,3,4,5,6,7,8,10].sample(4)          // [4,3,7,1]
["1":"a", "2":"b", "3":"c"].sample()    // [(.0 "1", .1 "a")]        
let set = Set([1,2,3,4,5,6,7,8,10])
set.sample(3)                           // [10,4,2]
set.sample(100)                         // nil (out of range!)
```
* **include, size, length, fetch, take, drop, first, last, push, <<, unshift, insert**
```swift
var array = Array(0...9)

array.include(3)                        // true
array.size                              // 10
array.length                            // 10
array.fetch(2)                          // 2
array.fetch(11)                         // nil
array.fetch(12, defaultValue: 1000)     // 1000
array.fetch(-2)                         // 8
array.fetch(12) { print("\($0) is out of range!") } // 12 out of range!
array.take(3)                           // [0, 1, 2]
array.drop(2)                           // [8, 9]
array.first(2)                          // [0,1]
array.first(30)                         // nil
array.last(2)                           // [8, 9]
array.last(100)                         // nil
array.push(10, 11)                      // [0... 10, 11]
array << [12, 13]                       // [0...13]
array.unshift(-2, -1)                   // [-2, -1, 0...13]
array.insert(-2, newElements: -10, -9)  // [..., -10, -9, 13]
```
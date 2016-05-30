# RubyInSwift
## Some Ruby functions implemented in Swift

* inspired by [Ruby Doc](http://ruby-doc.org/core-2.2.0/Array.html)

### Collection
* **sample**: Return random N elements from collection
```swift
[1,2,3].sample                          // 2
[1,2,3,4,5,6,7,8,10].sample(4)          // [4,3,7,1]
["1":"a", "2":"b", "3":"c"].sample()    // [(.0 "1", .1 "a")]        
let set = Set([1,2,3,4,5,6,7,8,10])
set.sample(3)                           // [10,4,2]
set.sample(100)                         // nil (out of range!)
```
### Array
* **include**: if contains element
```swift
let array = [0, 1, 2, 3, 4]
array.include(1)                        // true
array.include(100)                      // false
```
* **size, length**: **Array.count**
```swift
var array = [0, 1, 2, 3]
array.size                              // 4
```
* **fetch**: get element at **index** elegantly
```swift
var array = [0, 1, 2, 3]
array.fetch(2)                          // 2
array.fetch(11)                         // nil
array.fetch(12, defaultValue: 1000)     // 1000
array.fetch(-2)                         // 8
array.fetch(12) { print("\($0) is out of range!") } // 12 out of range!
```
* **take, first**: first N elements (**prefix**)
```swift
var array = [0, 1, 2, 3]
array.take(3)                           // [0, 1, 2]
array.take(10)                          // nil
```
* **drop, last**: last N elements (**suffix**)
```swift
var array = [0, 1, 2, 3]
array.drop(2)                           // [2, 3]
array.drop(100)                         // nil
```
* **push, <<**: append N elements to the last (**appendContentsOf**)
```swift
var array = [0, 1, 2, 3]
array.push(4)                           // array = [0, 1, 2, 3, 4]
array.push(5, 6)                        // array = [0, 1, 2, 3, 4, 5, 6]
array << [7, 8]                         // array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
```
* **unshift**: insert N elements at the beginning
```swift
var array = [0, 1, 2, 3]
array.unshift([-2, -1])                 // [-2,-1,0,1,2,3]
```
* **insert**: insert elements at Index
```swift
var array = [0, 1, 2, 3]
array.insert(0, newElements: -4,-3)     // [-4,-3,-2,-1,0,1,2,3]
array.insert(-1, newElements: 10)       // [-4,-3,-2,-1,0,1,2,3,10]
```
* **pop**: pop out N elements
```swift
var array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
array.pop()                             // 9
array.pop(2)                            // [7, 8]
array.pop(100)                          // nil
```
* **shift**: return first N elements array
```swift
var array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
array.shift()                           // 0
array.shift(3)                          // [1, 2, 3]
array.shift(100)                        // nil
```
* **delete_at**: delete at index
```swift
var array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
array.delete_at(1)                      // 1
array.delete_at(100)                    // nil
```
* **delete**: delete element which is equal to input
```swift
var array = [0, 1, 0, 1, 0, 1]
array.delete(1)                         // 1, array = [0, 0 ,0]
array.delete(3)                         // nil
array.delete(10) {                      // 101
  return 101
}
```
* **compact**: remove nil elements
```swift
var array = [0, nil, 1, 2, nil]
array.compact                           // [0, 1, 2]
```
* **reverse_each**: reverse array
```swift
var array = [0, 1, 2, 3]
array.reverse_each()                    // array = [3, 2, 1, 0]
array.reverse_each { print("\($0)") }   // 3 2 1 0
```
* **uniq**: remove duplicate elements
```swift
let array = [0, 1, 0 ,2, 2 ,3]
array.uniq()                            // [0, 1, 2, 3]
```
* **each**: **forEach**
```swift
let array = [0, 1, 2]
array.each { element in                 // 0 1 2
  print(element)
}
```

### Int
* **times** : **for in**
```swift
let count = 3
count.times {                           // Hi! Hi! Hi!
  print("Hi!")
}
```

<!-- * ****
```swift
var array = [0, 1, 2, 3]
array
array
``` -->

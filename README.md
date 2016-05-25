# RubyInSwift
## Some Ruby function implemented by Swift

1. **sample**: return random element or array from input sequence
```swift
[1,2,3].sample                          // 2
[1,2,3,4,5,6,7,8,10].sample(4)          // [4,3,7,1]
["1":"a", "2":"b", "3":"c"].sample()    // [(.0 "1", .1 "a")]
let array = [1,2,3,4,5,6,7,8,10]        
let set = Set(array)
set.sample(3)                           // [10,4,2]
set.sample(100)                         // nil (out of range!)
```
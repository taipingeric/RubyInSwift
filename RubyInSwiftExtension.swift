extension CollectionType where Index.Distance == Int {
    ///  Return random element from collection, or nil if collection is empty or count out of range
    public var sample: Generator.Element?  {
        if isEmpty { return nil }
        let randomIndex = startIndex.advancedBy(Int(arc4random_uniform(UInt32(self.count))))
        return self[randomIndex]
    }
    
    ///  Return random elements from collection, or nil if collection is empty or count out of range
    public func sample(count: Int = 1) -> [Generator.Element]? {
        if isEmpty || count > self.count { return nil }
        var count = count
        var storedIndex: [Index] = []
        while count > 0 {
            let randomIndex = startIndex.advancedBy(Int(arc4random_uniform(UInt32(self.count))))
            if storedIndex.contains(randomIndex) == false {
                storedIndex.append(randomIndex)
                count -= 1
            }
        }
        var resultCollection: [Generator.Element] = []
        storedIndex.forEach { resultCollection.append(self[$0]) }
        return resultCollection
    }
}

extension Array {
    
    public func isIndexValid(index: Int) -> Bool { return self.indices.contains(index) }
    public func isCountValid(count: Int) -> Bool { return count < self.count }
    
    /// Unsigned Int index
    public func uIndex(index: Int) -> Int {
        return (index % count) + count
    }
    
    /// Return element at index, or nil if self is empty or out of range.
    public func fetch(index: Int, defaultValue: Element? = nil) -> Generator.Element?{
        guard self.count != 0 else {
            return nil
        }
        if index < 0 {
            return self[uIndex(index)]
        }
        if isIndexValid(index) {
            return self[index]
        } else {
            return defaultValue ?? nil
        }
    }
    /// Return element at index, or nil with exception closure executed if self is empty or out of range.
    public func fetch(index: Int, exception: (Int -> ())?) -> Element? {
        guard let element = fetch(index) else{
            exception?(index)
            return nil
        }
        return element
    }
    /// Returns the first N elements of self, or nil if self is empty or out of range.
    public func first(count: Int) -> [Element]? {
        return take(count)
    }
    /// Returns the last N elements of self, or nil if self is empty or out of range.
    public func last(count: Int) -> [Element]? {
        return drop(count)
    }
    
    /// Return first N elements in array, or nil if self is empty or out of range.
    public func take(count: Int) -> [Element]? {
        return isCountValid(count) ? Array(prefix(count)) : nil
    }
    
    /// Return last N elements in array, or nil if self is empty or out of range.
    public func drop(count: Int) -> [Element]? {
        return isCountValid(count) ? Array(suffix(count)) : nil
    }
    
    /// The number of elements the Array stores.
    public var length: Int {
        return count
    }
    public var size: Int {
        return count
    }
    
    /// Returns `true` iff `self` is empty.
    public var empty: Bool {
        return isEmpty
    }
    
    /// Append the elements of `newElements` to `self`.
    public mutating func push(newElements: Element...) {
        self.appendContentsOf(newElements)
    }
    
    /// Insert the elements of `newElements` to the beginning of `self` .
    public mutating func unshift(newElements: Element...) {
        self.insertContentsOf(newElements, at: 0)
    }
    
    /// Insert the elements of `newElements` at the index of `self` .
    public mutating func insert(index: Int, newElements: Element...) {
        uIndex(index)
        index < 0 ? self.insertContentsOf(newElements, at: uIndex(index) + 1) : self.insertContentsOf(newElements, at: index)
    }
}

infix operator << { associativity left precedence 160 }
/// << operator: push elements to array
public func << <T>(inout left: [T], right: [T]) {
    left.appendContentsOf(right)
}

extension SequenceType where Generator.Element : Equatable {
    /// Returns `true` iff `element` is in `self`.
    public func include(element: Generator.Element) -> Bool {
        return contains(element)
    }
}
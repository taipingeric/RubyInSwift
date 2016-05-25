extension CollectionType where Index.Distance == Int {

    var sample: Generator.Element?  {
        if isEmpty { return nil }
        let randomIndex = startIndex.advancedBy(Int(arc4random_uniform(UInt32(self.count))))
        return self[randomIndex]
    }

    func sample(count: Int = 1) -> [Generator.Element]? {
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

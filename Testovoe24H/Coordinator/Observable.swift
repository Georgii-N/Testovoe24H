import Foundation

@propertyWrapper
final class Observable<Value> {
    private var onChange: ((Value) -> Void)?
    
    var wrappedValue: Value {
        didSet {
            DispatchQueue.main.async {
                self.onChange?(self.wrappedValue)
            }
        }
    }
    
    var projectedValue: Observable<Value> {
        return self
    }
    
    init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
    
    func bind(action: @escaping (Value) -> Void) {
        self.onChange = action
    }
}

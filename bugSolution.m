To correct this, several strategies can be used.  The simplest might involve using `copy` instead of `strong` for the property, effectively eliminating the retain cycle.

```objectivec
@interface MyClass : NSObject
@property (copy, nonatomic) NSString *myString; // Changed to copy
@end

@implementation MyClass
- (void)someMethod {
    self.myString = [NSString stringWithString:@"Hello"]; // Use simpler init method
    // ... some code ...
}
@end
```

Alternatively, manual memory management with `retain` and `release` could be employed (though generally discouraged in modern Objective-C), but this requires careful handling to prevent both leaks and crashes.  A better approach is to use ARC (Automatic Reference Counting) correctly and favour simpler methods like `stringWithString:`.
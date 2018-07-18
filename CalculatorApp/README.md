### 첫 번째로 개발한  xcode 계산기 앱입니다. 

공부하며 배운 것
```
1. NSString *sample = [[NSString alloc] initWithString:@"Hello"];
와 같이 alloc을 하고나서 release를 해 주지 않아도 된다.
--> Build Settings에서 Objective-C Automatic Reference Counting이 자동으로 release를 해 줌  
  
2. 배열의 경우 Mutable로 선언하지 않으면 그 배열의 값을 바꿀 때, 접근할 수 없다.
```
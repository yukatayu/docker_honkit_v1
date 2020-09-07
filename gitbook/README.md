# Introduction

AAAa

日本語も使える？

文中に $$E=mc^2$$ みたいに入れられる。

{% hint style='info' %}
Important info: this note needs to be highlighted

種類は info, tip, danger, working があります
{% endhint %}

```cpp
#include <iostream>

int main(){
	using namespace std;
	std::cout << "Hello world!" << std::endl;
}
```


## Class Diagram

```uml
@startuml
  class 車 {
    車名
  }
  class タイヤ {
    大きさ
  }

  車 *-- タイヤ

@enduml
```

## Activity Diagram

```uml
@startuml

(*) --> "最初のやつ"
-->[ラベルをこういう風に付ける] "次のやつ"
--> (*)

@enduml
```


## State Diagram

```uml
@startuml
[*] --> State1
State1 --> [*]
State1 : 何かをする

State1 -> State2 : もふもふする
State2 --> [*]
@enduml
```



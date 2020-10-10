# Piece Notes

由不知道到知道，不论多简单的记录

## cmd控制台快速编辑模式

允许双击选中，拖动选中，右键复制黏贴，在属性中可设置

## Bat多字符分割

```bash
for /f "tokens=1,2-6 delims=/} " %%m in ("%%i") do (
        echo %%o
    )
```

1. 只能单个字符做分割符
2. 分割字符为多个并且包含空格时，空格要在最后一个

## AIDL 接口定义

```java
package com.lulingfeng.whtest.aidl;

import com.lulingfeng.whtest.aidl.IRemoteServiceCallback;
// Declare any non-default types here with import statements

interface IRemoteService {
    /**
     * Demonstrates some basic types that you can use as parameters
     * and return values in AIDL.
     */
    void basicTypes(int anInt, long aLong, boolean aBoolean, float aFloat,
            double aDouble, String aString) = 1;
    void registerRemoteCallback(in IRemoteServiceCallback remoteCallback) = 2;
}
```

1. AIDL 的接口对应关系，默认是按顺序一一对应的

2. 接口赋予id 之后，则不再以顺序来对应，改为以id 相对应

3. oneway 修饰，代表接口是异步调用，不用等待接口执行完成

4. 传递自定义类型的时候，自定义类型和类型的声明.aidl两者要保持在同一个package下

   
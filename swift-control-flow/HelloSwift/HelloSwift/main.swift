//
//  main.swift
//  HelloSwift
//
//  1. 是程式進入點
//
//  Created by Edward Chiang on 12/10/2016.
//  Copyright © 2016 TKU. All rights reserved.
//

// 2. 匯入需要的 Framework，提供基礎計算的程式
import Foundation

// 3. 利用 print 來輸出到資訊到 Console，透過 alt+左鍵 可以看到相關解釋
print("Hello, World!")

// 任務：輸出相加的結果

// 變數與常數 https://www.tibame.com/q?pg=courseplayer&courseId=30000002026&cx=22.20000-232.30000002026#30000005006

// let 常數：很多地方要用且不會改變，只指定一次。
// var 變數：後面可以再改值

let maxGrade = 100
var myGrade = 80
myGrade = 75

// Cannot assign to value to let constant.
// maxGrade = 200

// 資料型態指定 https://www.tibame.com/q?pg=courseplayer&courseId=30000002026&cx=22.20000-232.30000002026#30000005007
// Add a breakpoint here, click step over forth button.
var sum : Int = 0
var a : Int = 50
var b : Int = 25
sum = a + b

// 字串組合 1.
print("Sum 值為: \(sum)")
// 字串組合 2.
print("Sum 值為: " + String(sum))
// 字串組合 3.
print("Sum 值為: \(a+b)")

// 陣列與字典 https://www.tibame.com/q?pg=courseplayer&courseId=30000002026&cx=22.20000-232.30000002026#30000005008
var numbers = [50, 25]
print("The sum of 50 and 25 is \(numbers[0] + numbers[1])")

var numberArray:Array = [50, 25]
// 修改數字
numbers[0] = 100
print("第一個數字是 \(numbers[0])")

// Dictionary
var numberDic : Dictionary = ["Ryan" : 50, "John" : 25]

// 會拿到 Optional(50)，此變數可以有機會沒有值。
print("Rayn value is \(numberDic["Ryan"] ?? 0)")

// 轉型成 ! 強迫拿到裡面的值
print("Rayn value is \(numberDic["Ryan"]!)")

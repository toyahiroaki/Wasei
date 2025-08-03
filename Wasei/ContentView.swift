//
//  ContentView.swift
//  Wasei
//
//  Created by 外谷浩章 on 2025/08/01.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show: Bool = false
    
    let data: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
    let questionButton: [Int] = [0,1,2,3]
    let midiData: [String] = ["C3","B2","A2","G2","F2","E2","D2","C2","B1","A1","G1","F1","E1","D1","C1"]
    @State var column_color:[[Color]] = [
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream]
    ]
    
    @State var column_flag:[[Bool]] = [
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    ]
    
    @State var qNo = 0
    @State var nowPosition: Int = 0
    @State var isShowAlert = false
    @State var judgeResult = "判定結果の初期値"
    
    @State var arrayOfSATB:[[Int]] = [
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0]
    ]

    
    func coloring(i: Int, j: Int) {
        self.column_flag[i][j].toggle()
        if self.column_flag[i][j] {
            self.column_color[i][j] = col_pink
        } else {
            self.column_color[i][j] = col_cream
        }
    }
    
    func judge(i: Int) {
        var noteCount = 0
        var arrayOfSATBCount = 0
        for j in 0 ..< 15{
            if self.column_flag[i - 1][j] {
                noteCount += 1
                self.arrayOfSATB[i - 1][arrayOfSATBCount] = midiMap[j]
                arrayOfSATBCount += 1
            }
        }
        if noteCount != 4 {
            judgeResult = "四声にしてね"
            return
        }
        
        if i >= 2 {
            let diff_of_soprano = self.arrayOfSATB[i - 1][0] - self.arrayOfSATB[i - 2][0]
            let diff_of_alto = self.arrayOfSATB[i - 1][1] - self.arrayOfSATB[i - 2][1]
            let diff_of_tenor = self.arrayOfSATB[i - 1][2] - self.arrayOfSATB[i - 2][2]
            let diff_of_bass = self.arrayOfSATB[i - 1][3] - self.arrayOfSATB[i - 2][3]
            
            print("diff_of_soprano:" + String(diff_of_soprano))
            print("diff_of_alto:" + String(diff_of_alto))
            print("diff_of_tenor:" + String(diff_of_tenor))
            print("diff_of_bass:" + String(diff_of_bass))
            
            // ７度の跳躍チェック
            if abs(diff_of_soprano) == 10 {
                judgeResult = "ソプラノが短7度の跳躍になっているよ"
                return
            }
            if abs(diff_of_soprano) == 11  {
                judgeResult = "ソプラノが長7度の跳躍になっているよ"
                return
            }
            if abs(diff_of_alto) == 10 {
                judgeResult = "アルトが短7度の跳躍になっているよ"
                return
            }
            if abs(diff_of_alto) == 11  {
                judgeResult = "アルトが長7度の跳躍になっているよ"
                return
            }
            if abs(diff_of_tenor) == 10 {
                judgeResult = "テノールが短7度の跳躍になっているよ"
                return
            }
            if abs(diff_of_tenor) == 11  {
                judgeResult = "テノールが長7度の跳躍になっているよ"
                return
            }
            if abs(diff_of_bass) == 10 {
                judgeResult = "バスが短7度の跳躍になっているよ"
                return
            }
            if abs(diff_of_bass) == 11  {
                judgeResult = "バスが長7度の跳躍になっているよ"
                return
            }
            
            // 複音程のチェック
            if abs(diff_of_soprano) > 12 {
                judgeResult = "ソプラノが１オクターブを超える跳躍（複音程）になっているよ"
                return
            }
            if abs(diff_of_alto) > 12 {
                judgeResult = "アルトが１オクターブを超える跳躍（複音程）になっているよ"
                return
            }
            if abs(diff_of_tenor) > 12 {
                judgeResult = "テノールが１オクターブを超える跳躍（複音程）になっているよ"
                return
            }
            if abs(diff_of_bass) > 12 {
                judgeResult = "ソプラノが１オクターブを超える跳躍（複音程）になっているよ"
                return
            }
            
            // 増4度進行のチェック
            if abs(diff_of_soprano) == 6 {
                judgeResult = "ソプラノが増4度進行になっているよ"
                return
            }
            
            // 並行5度のチェック
            var parallelFifthCount = 0
            
            if abs(diff_of_soprano) == 7 {
                parallelFifthCount += 1
            }
            if abs(diff_of_alto) == 7 {
                parallelFifthCount += 1
            }
            if abs(diff_of_tenor) == 7 {
                parallelFifthCount += 1
            }
            if abs(diff_of_bass) == 7 {
                parallelFifthCount += 1
            }
            
            if parallelFifthCount >= 2 {
                judgeResult = "同じ2つの声部が連続して完全5度になっているよ"
                return
            }
            // 並行8度のチェック
            var parallelEighthCount = 0
            
            if abs(diff_of_soprano) == 12 {
                parallelEighthCount += 1
            }
            if abs(diff_of_alto) == 12 {
                parallelEighthCount += 1
            }
            if abs(diff_of_tenor) == 12 {
                parallelEighthCount += 1
            }
            if abs(diff_of_bass) == 12 {
                parallelEighthCount += 1
            }
            if parallelEighthCount >= 2 {
                judgeResult = "同じ2つの声部が連続して完全8度になっているよ"
                return
            }
            
            // 隠伏5度のチェック
            if diff_of_soprano * diff_of_bass > 0 {
                if (abs(self.arrayOfSATB[i - 1][0] - self.arrayOfSATB[i - 1][3])) % 12 == 7 {
                    judgeResult = "外声（ソプラノとバス）が同方向に進行し、結果として完全5度の関係（隠伏5度）になっているよ."
                    return
                }
            }
        }
        
        judgeResult = "OK"
        for j in 0 ..< 15{
            if self.column_flag[i - 1][j] {
            } else {
                self.column_color[i - 1][j] = Color.gray
            }
        }
        for j in 0 ..< 15{
            if self.column_flag[i][j] {
            } else {
                self.column_color[i][j] = col_cream
            }
        }
        self.nowPosition += 1
    }
    
    func initialaize() {
        nowPosition = 0
        for j in 0 ..< 15{
            self.column_color[0][j] = col_cream
        }
        for i in 1 ..< 10{
            for j in 0 ..< 15{
                self.column_color[i][j] = Color.gray
            }
        }
    }

    var body: some View {
            HStack {
                leftView
                centerView
                rightView
            }
        .padding()
    }
    
    var leftView: some View {
        VStack {
            ForEach(questionButton, id: \.self) { qb in
                Button(action: {
                    
                    initialaize()
                    
                    // アクション
                    for i in 0 ..< 10{
                        self.column_color[i][questions[qb][i]] = col_brown
                        self.column_flag[i][questions[qb][i]] = true
                    }
                    qNo = qb
                    nowPosition += 1
                }){
                    Text("問" + String(qb + 1))
                    // 枠線のフレームを作成
                        .frame(width: 50, height: 25, alignment: .center)
                    // フレームのコーナー設定と枠線の太さ設定
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                    // ボタンの背景色を設定
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .padding(20)
                }
            }
            Button(action: {
                self.show.toggle()
            }){
                Text("戻る")
                // 枠線のフレームを作成
                    .frame(width: 50, height: 25, alignment: .center)
                // フレームのコーナー設定と枠線の太さ設定
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.red, lineWidth: 2)
                    )
                    .foregroundColor(Color.red)
                // ボタンの背景色を設定
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .padding(20)
            }
            .sheet(isPresented: self.$show) {
                // trueになれば下からふわっと表示
                TopMenuView()
            }
        }
    }
    
    var centerView: some View {
        ScrollView(.horizontal) {
            HStack {
                // 1列目
                VStack {
                    Text("1").font(.caption).foregroundColor(Color.black)
                    ForEach(data, id: \.self) { index in
                        Button(" " + midiData[index] + "    ") {
                            coloring(i: 0, j: index)
                        }
                        .foregroundColor(Color.black)
                        .background(column_color[0][index])
                        .frame(width: 40, height: 5)
                        .alert("判定結果", isPresented: $isShowAlert) {Button("OK") {}} message: {Text(judgeResult)}
                        
                        Divider()
                    }
                }
                // 2列目
                VStack {
                    Text("2").font(.caption).foregroundColor(Color.black)
                    ForEach(data, id: \.self) { index in
                        Button(" " + midiData[index] + "    ") {
                            coloring(i: 1, j: index)
                        }
                        .foregroundColor(Color.black)
                        .background(column_color[1][index])
                        .frame(width: 40, height: 5)
                        .alert("判定結果", isPresented: $isShowAlert) {Button("OK") {}} message: {Text(judgeResult)}
                        Divider()
                    }
                }
                Divider()
                // 3列目
                VStack {
                    Text("3").font(.caption).foregroundColor(Color.black)
                    ForEach(data, id: \.self) { index in
                        Button(" " + midiData[index] + "    ") {
                            coloring(i: 2, j: index)
                        }
                        .foregroundColor(Color.black)
                        .background(column_color[2][index])
                        .frame(width: 40, height: 5)
                        .alert("判定結果", isPresented: $isShowAlert) {Button("OK") {}} message: {Text(judgeResult)}
                        Divider()
                    }
                }
                Divider()
                // 4列目
                VStack {
                    Text("4").font(.caption).foregroundColor(Color.black)
                    ForEach(data, id: \.self) { index in
                        Button(" " + midiData[index] + "    ") {
                            coloring(i: 3, j: index)
                        }
                        .foregroundColor(Color.black)
                        .background(column_color[3][index])
                        .frame(width: 40, height: 5)
                        .alert("判定結果", isPresented: $isShowAlert) {Button("OK") {}} message: {Text(judgeResult)}
                        Divider()
                    }
                }
            }
        }
    }
    
    var rightView: some View {
        Button(action: {
            judge(i: self.nowPosition)
            self.isShowAlert = true
        }){
            Text("Next")
            // 枠線のフレームを作成
                .frame(width: 50, height: 25, alignment: .center)
            // フレームのコーナー設定と枠線の太さ設定
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.red, lineWidth: 2)
                )
                .foregroundColor(Color.red)
            // ボタンの背景色を設定
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .padding(20)
        }
        .alert("判定結果", isPresented: $isShowAlert) {Button("OK") {}} message: {Text(judgeResult)}
    }
}

#Preview {
    ContentView()
}

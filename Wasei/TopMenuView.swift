//
//  TopMenuView.swift
//  Wasei
//
//  Created by 外谷浩章 on 2025/08/01.
//

import SwiftUI

struct TopMenuView: View {
    @State private var show1: Bool = false
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, col_cyan]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack(spacing: 0) {
                Text("和声トレーニング！").font(.largeTitle).padding(40).foregroundColor(Color.black)
                Spacer()
                Button(action: {
                    self.show1.toggle()
                }){
                    Text("バス課題")
                    // 枠線のフレームを作成
                        .frame(width: 200, height: 30, alignment: .center)
                    // フレームのコーナー設定と枠線の太さ設定
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                    // ボタンの背景色を設定
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .padding(5)
                }
                .sheet(isPresented: self.$show1) {
                    // trueになれば下からふわっと表示
                    ContentView()
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

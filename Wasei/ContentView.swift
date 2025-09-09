//
//  ContentView.swift
//  Wasei
//
//  Created by 外谷浩章 on 2025/08/01.
//

import SwiftUI
import AVFoundation
var player: AVAudioPlayer!

struct ContentView: View {
    
    let musicplayer_top = SoundPlayer()
    
    func playMusic(filename: String) {
            musicplayer_top.musicPlayer(filename: filename)
        }
    
    @State private var show: Bool = false
    
    //let data: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
    let data: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
    let questionButton: [Int] = [0,1,2]
    let midiData: [String] = ["A3","G3","F3","E3","D3","C3","B2","A2","G2","F2","E2","D2","C2","B1","A1","G1","F1","E1","D1","C1","B0","A0","G0","F0"]
    /*
    @State var column_color:[[Color]] = [
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],
        [col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream]
    ]
    */
    @State var column_color3:[[[Color]]] = [
        [[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream]],
        [[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream]],
        [[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream]],
        [[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream]],
        [[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream]],
        [[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream]],
        [[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream]],
        [[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream],[col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream,col_cream]]
    ]
    /*
    @State var column_flag:[[Bool]] = [
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
        [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    ]
    */
    
    @State var column_flag3:[[[Bool]]] = [
        [[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]],
        [[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]],
        [[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]],
        [[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]],
        [[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]],
        [[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]],
        [[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]],
        [[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]]
    ]
    
    let questions2:[[[Int]]] = [
        [[20, 20],[20, 17],[18, 17],[16, 16],[15, 17],[18, 19],[16, 16],[20, 20]],
        [[20, 21],[20, 16],[15, 17],[16, 16],[18, 17],[16, 16],[20, 17],[20, 20]],
        [[20, 16],[15, 17],[17, 18],[16, 16],[20, 18],[17, 17],[16, 23],[20, 20]]
    ]
    
    @State var qNo = 0
    @State var nowPosition: Int = 0
    
    // 0:１拍目　1:３拍目
    @State var nowBeat = 0
    
    @State var isShowAlert = false
    @State var judgeResult = "判定結果の初期値"
    @State var chordName: [[String]] = [["?","?"],["?","?"],["?","?"],["?","?"],["?","?"],["?","?"],["?","?"],["?","?"]]
    
    @State var arrayOfSATB3:[[[Int]]] = [
        [[0,0,0,0],[0,0,0,0]],
        [[0,0,0,0],[0,0,0,0]],
        [[0,0,0,0],[0,0,0,0]],
        [[0,0,0,0],[0,0,0,0]],
        [[0,0,0,0],[0,0,0,0]],
        [[0,0,0,0],[0,0,0,0]],
        [[0,0,0,0],[0,0,0,0]],
        [[0,0,0,0],[0,0,0,0]]
    ]
    
    //@State var chordJudge: [Int] = []

    
    func coloring(i: Int, j: Int, k: Int) {
        self.column_flag3[i][k][j].toggle()
        if self.column_flag3[i][k][j] {
            self.column_color3[i][k][j] = col_pink
        } else {
            self.column_color3[i][k][j] = col_cream
        }
    }
    
    func judgeChord(i: Int, k: Int) {
        var chordJudge: [Int] = []
        for j in 0 ..< midiMap.count{
            if self.column_flag3[i][k][j] {
                //self.chordJudge.append(midiMap[j] % 12)
                chordJudge.append(midiMap[j] % 12)
            }
        }
        let uniqueSorted = chordJudge.sorted().reduce(into: [Int]()) { result, value in
            if result.last != value {
                result.append(value)
            }
        }
        
        // ルートがCの場合
        if self.questions2[self.qNo][i][k]  == 20 {
            let targets = [0, 4, 7]
            if (targets.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "C"
                return
            }
            
            let targetsFonC = [0, 5, 9]
            if (targetsFonC.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "F/C"
                return
            }
            
            let targetsAmonC = [0, 4, 9]
            if (targetsAmonC.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "Am/C"
                return
            }
        }
        
        // ルートがDの場合
        if self.questions2[self.qNo][i][k]  == 19 {
            let targetsDm = [2, 5, 9]
            if (targetsDm.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "Dm"
                return
            }
            
            let targetsGonD = [2, 7, 11]
            if (targetsGonD.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "G/D"
                return
            }
        }
        
        // ルートがEの場合
        if self.questions2[self.qNo][i][k]  == 18 {
            let targetsEm = [4, 7, 11]
            if (targetsEm.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "Em"
                return
            }
            
            let targetsConE = [0, 4, 7]
            if (targetsConE.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "C/E"
                return
            }
            
            let targetsAmonC = [0, 4, 9]
            if (targetsAmonC.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "Am/E"
                return
            }
        }
        
        // ルートがFの場合
        if self.questions2[self.qNo][i][k]  == 17 {
            let targetsF = [0, 5, 9]
            if (targetsF.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "F"
                return
            }
            
            let targetsDmonF = [2, 5, 9]
            if (targetsDmonF.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "Dm/F"
                return
            }
        }
        
        // ルートがGの場合
        if self.questions2[self.qNo][i][k]  == 16 {
            let targetsG = [2, 7, 11]
            if (targetsG.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "G"
                return
            }
            
            let targetsConG = [0, 4, 7]
            if (targetsConG.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "C/G"
                return
            }
            
            let targetsEmonG = [4, 7, 11]
            if (targetsEmonG.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "Em/G"
                return
            }
        }
        
        // ルートがAの場合
        if self.questions2[self.qNo][i][k]  == 15 {
            let targetsA = [0, 4, 9]
            if (targetsA.allSatisfy{ uniqueSorted.contains($0) }){
                self.chordName[i][k] = "Am"
                return
            }
        }
        
        self.chordName[i][k] = "?"
        return
    }
    
    func judge(i: Int) {
        var noteCount = 0
        var arrayOfSATBCount = 0
        for j in 0 ..< midiMap.count{
            if self.column_flag3[i - 1][nowBeat][j] {
                noteCount += 1
                if noteCount > 4 {
                    judgeResult = "四声にしてね"
                    return
                }
                self.arrayOfSATB3[i - 1][self.nowBeat][arrayOfSATBCount] = midiMap[j]

                arrayOfSATBCount += 1
            }
        }
        if noteCount != 4 {
            judgeResult = "四声にしてね"
            return
        }
        
        // 音域チェック
        if self.arrayOfSATB3[i - 1][self.nowBeat][0] > 57 || self.arrayOfSATB3[i - 1][self.nowBeat][0] < 36 {
            judgeResult = "ソプラノの音域はC2〜A3にしてね"
            return
        }
        if self.arrayOfSATB3[i - 1][self.nowBeat][1] > 50 || self.arrayOfSATB3[i - 1][self.nowBeat][1] < 31 {
            judgeResult = "アルトの音域はG1〜D3にしてね"
            return
        }
        if self.arrayOfSATB3[i - 1][self.nowBeat][2] > 45 || self.arrayOfSATB3[i - 1][self.nowBeat][2] < 24 {
            judgeResult = "テノールの音域はC1〜A2にしてね"
            return
        }
        
        // 導音重複不良のチェック
        var array:[Int] = []
        for l in 0 ..< 4{
            array.append(self.arrayOfSATB3[i - 1][self.nowBeat][l] % 12)
        }

        let duplicates = Dictionary(grouping: array, by: { $0 })
            .filter { $1.count > 1 }
            .map { $0.key }
        if duplicates.contains(11) {
            judgeResult = "導音が重複しているよ"
            return
        }
        
        
        if !(i == 1 && self.nowBeat == 0) {
            var diff_of_soprano = 0
            var diff_of_alto = 0
            var diff_of_tenor = 0
            var diff_of_bass = 0
            if self.nowBeat == 0 {
                diff_of_soprano = self.arrayOfSATB3[i - 1][0][0] - self.arrayOfSATB3[i - 2][1][0]
                diff_of_alto    = self.arrayOfSATB3[i - 1][0][1] - self.arrayOfSATB3[i - 2][1][1]
                diff_of_tenor   = self.arrayOfSATB3[i - 1][0][2] - self.arrayOfSATB3[i - 2][1][2]
                diff_of_bass    = self.arrayOfSATB3[i - 1][0][3] - self.arrayOfSATB3[i - 2][1][3]
            } else {
                diff_of_soprano = self.arrayOfSATB3[i - 1][1][0] - self.arrayOfSATB3[i - 1][0][0]
                diff_of_alto    = self.arrayOfSATB3[i - 1][1][1] - self.arrayOfSATB3[i - 1][0][1]
                diff_of_tenor   = self.arrayOfSATB3[i - 1][1][2] - self.arrayOfSATB3[i - 1][0][2]
                diff_of_bass    = self.arrayOfSATB3[i - 1][1][3] - self.arrayOfSATB3[i - 1][0][3]
            }
            
            print("diff_of_soprano:" + String(diff_of_soprano))
            print("diff_of_alto:" + String(diff_of_alto))
            print("diff_of_tenor:" + String(diff_of_tenor))
            print("diff_of_bass:" + String(diff_of_bass))
            
            // 同方向への三段跳躍チェック
            if i >= 2 {
                var diff_of_soprano_1_before = 0
                var diff_of_soprano_2_before = 0
                var diff_of_soprano_3_before = 0
                if self.nowBeat == 1 {
                    diff_of_soprano_1_before = self.arrayOfSATB3[i - 1][1][0] - self.arrayOfSATB3[i - 1][0][0]
                    diff_of_soprano_2_before = self.arrayOfSATB3[i - 1][0][0] - self.arrayOfSATB3[i - 2][1][0]
                    diff_of_soprano_3_before = self.arrayOfSATB3[i - 2][1][0] - self.arrayOfSATB3[i - 2][0][0]
                } else if i >= 3 {
                    diff_of_soprano_1_before = self.arrayOfSATB3[i - 1][0][0] - self.arrayOfSATB3[i - 2][1][0]
                    diff_of_soprano_2_before = self.arrayOfSATB3[i - 2][1][0] - self.arrayOfSATB3[i - 2][0][0]
                    diff_of_soprano_3_before = self.arrayOfSATB3[i - 2][0][0] - self.arrayOfSATB3[i - 3][1][0]
                }
                
                if diff_of_soprano_1_before >= 3 && diff_of_soprano_2_before >= 3 && diff_of_soprano_3_before >= 3 {
                    judgeResult = "ソプラノが同方向への三段跳躍しているよ"
                    return
                }

            }
            // 同じ音を2声部が連続（連続ユニゾン）のチェック
            if diff_of_soprano == 0 && diff_of_alto == 0 {
                judgeResult = "同じ音を2声部（ソプラノとアルト）が連続（連続ユニゾン）しているよ"
                return
            }
            if diff_of_soprano == 0 && diff_of_tenor == 0 {
                judgeResult = "同じ音を2声部（ソプラノとテノール）が連続（連続ユニゾン）しているよ"
                return
            }
            if diff_of_alto == 0 && diff_of_tenor == 0 {
                judgeResult = "同じ音を2声部（アルトとテノール）が連続（連続ユニゾン）しているよ"
                return
            }
            
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
            if diff_of_soprano == 6 {
                judgeResult = "ソプラノが増4度進行になっているよ"
                return
            }
            if diff_of_alto == 6 {
                judgeResult = "アルトが増4度進行になっているよ"
                return
            }
            if diff_of_tenor == 6 {
                judgeResult = "テノールが増4度進行になっているよ"
                return
            }
            if diff_of_bass == 6 {
                judgeResult = "バスが増4度進行になっているよ"
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
                if (abs(self.arrayOfSATB3[i - 1][self.nowBeat][0] - self.arrayOfSATB3[i - 1][self.nowBeat][3])) % 12 == 7 {
                    judgeResult = "外声（ソプラノとバス）が同方向に進行し、結果として完全5度の関係（隠伏5度）になっているよ."
                    return
                }
            }
        }
        
        for j in 0 ..< midiMap.count{
            if self.column_flag3[i - 1][self.nowBeat][j] {
            } else {
                self.column_color3[i - 1][self.nowBeat][j] = Color.gray
            }
        }
        
        if self.nowPosition == 8 && self.nowBeat == 1 {
            self.judgeResult = "クリア"
        } else {
            self.judgeResult = "OK"
            if self.nowBeat == 1  {
                self.nowPosition += 1
            }
            self.nowBeat = (self.nowBeat + 1) % 2
            for j in 0 ..< midiMap.count{
                if self.column_flag3[self.nowPosition - 1][self.nowBeat][j] {
                } else {
                    self.column_color3[self.nowPosition - 1][self.nowBeat][j] = col_cream
                }
            }
        }
        
        
        return
    }
    
    func initialaize() {
        nowPosition = 0
        for j in 0 ..< midiMap.count{
            self.column_color3[0][0][j] = col_cream
            self.column_color3[0][1][j] = Color.gray
        }
        for i in 1 ..< 8{
            for j in 0 ..< midiMap.count{
                self.column_color3[i][0][j] = Color.gray
                self.column_color3[i][1][j] = Color.gray
            }
        }
    }

    var body: some View {
        VStack {
            headerView
            centerView
            footerView
        }.background(col_cyan)
    }
    
    var headerView: some View {
        HStack {
            ForEach(questionButton, id: \.self) { qb in
                Button(action: {
                    
                    initialaize()
                    
                    // アクション
                    for i in 0 ..< 8 {
                        self.column_color3[i][0][questions2[qb][i][0] - 1] = col_brown
                        self.column_color3[i][1][questions2[qb][i][1] - 1] = col_brown
                        self.column_flag3[i][0][questions2[qb][i][0] - 1] = true
                        self.column_flag3[i][1][questions2[qb][i][1] - 1] = true
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
                ForEach(0..<8, id: \.self) { column in
                    VStack {
                        Text(String(column + 1)).font(.caption).foregroundColor(Color.black)
                        ForEach(data, id: \.self) { row in
                            HStack(spacing: 0) {
                                Button(" " + midiData[row] + "    ") {
                                    playMusic(filename: midiData[row])
                                    coloring(i: column, j: row, k: 0)
                                    judgeChord(i: column, k: 0)
                                }
                                .foregroundColor(Color.black)
                                .background(column_color3[column][0][row])
                                .frame(width: 38, height: 5)
                                .alert("判定結果", isPresented: $isShowAlert) {Button("OK") {}} message: {Text(judgeResult)}
                                Button(" " + midiData[row] + "    ") {
                                    coloring(i: column, j: row, k: 1)
                                    judgeChord(i: column, k: 1)
                                }
                                .foregroundColor(Color.black)
                                .background(column_color3[column][1][row])
                                .frame(width: 38, height: 5)
                                .alert("判定結果", isPresented: $isShowAlert) {Button("OK") {}} message: {Text(judgeResult)}
                            }
                            Divider()
                        }
                        HStack(spacing: 30) {
                            Text(self.chordName[column][0]).font(.caption).foregroundColor(Color.black)
                            Text(self.chordName[column][1]).font(.caption).foregroundColor(Color.black)
                        }
                    }
                    Divider()
                }
            }
        }
    }
    
    var footerView: some View {
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

//
//  ContentView.swift
//  Janken
//
//  Created by 大川　明日香 on 2024/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var playerHand = 0
    @State private var computerHand = 0
    @State private var resultText = " "
    var body: some View {
        VStack {
            Text("じゃんけん")
                .font(.largeTitle)
            
            HStack{
                //相手の顔
                Image("ai_character01_smile")
                    .resizable()
                    .scaledToFit()
                //相手の手
                if(computerHand == 0) {
                    Image("janken_gu")
                        .resizable()
                        .scaledToFit()
                } else if(computerHand == 1) {
                    Image("janken_choki")
                        .resizable()
                        .scaledToFit()
                } else if(computerHand == 2) {
                    Image("janken_pa")
                        .resizable()
                        .scaledToFit()
                }
            }
            
            //勝敗
            Text(resultText)
                .font(.title)
            
            HStack{
                //自分の顔
                if (resultText == "win") {
                    Image("computer_man4_laugh")
                        .resizable()
                        .scaledToFit()
                } else if (resultText == "lose") {
                    Image("computer_man3_cry")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("computer_man1_smile")
                        .resizable()
                        .scaledToFit()
                }
                
                //自分の手
                if(playerHand == 0) {
                    Image("jankenplate_gu")
                        .resizable()
                        .scaledToFit()
                } else if(playerHand == 1) {
                    Image("jankenplate_choki")
                        .resizable()
                        .scaledToFit()
                } else if(playerHand == 2) {
                    Image("jankenplate_pa")
                        .resizable()
                        .scaledToFit()
                }
            }
            //出す手を選択
            HStack{
                //グー
                Button(action: {
                    print("グー")
                    self.playerHand = 0;
                    self.computerHand = chooseComputerHand();
                    self.resultText = determineVictoryOrDefeat(playerHand: self.playerHand, computerHand: computerHand)
                }) {
                    Image("jankenplate_gu")
                        .resizable()
                        .frame(width:128, height: 102.4)
                        .scaledToFit()
                }
                //チョキ
                Button(action: {
                    print("チョキ")
                    self.playerHand = 1;
                    self.computerHand = chooseComputerHand();
                    self.resultText = determineVictoryOrDefeat(playerHand: self.playerHand, computerHand: computerHand)
                }) {
                    Image("jankenplate_choki")
                        .resizable()
                        .frame(width:128, height: 102.4)
                        .scaledToFit()
                }
                //パー
                Button(action: {
                    print("パー")
                    self.playerHand = 2;
                    self.computerHand = chooseComputerHand();
                    self.resultText = determineVictoryOrDefeat(playerHand: self.playerHand, computerHand: computerHand)
                }) {
                    Image("jankenplate_pa")
                        .resizable()
                        .frame(width:128, height: 102.4)
                        .scaledToFit()
                }
            }
        }
        .padding()
        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
    }
}

//相手の手の乱数
func chooseComputerHand() -> Int {
    let random = Int.random(in: 0..<3)
    let computerHand = random
    return computerHand
}

//勝敗判定
func determineVictoryOrDefeat(playerHand:Int, computerHand:Int) -> String {
    var result = ""
    
    if (playerHand == computerHand) {
        result = "draw";
    } else if ((playerHand == 0 && computerHand == 1) || (playerHand == 1 && computerHand == 2) || (playerHand == 2 && computerHand == 0)) {
        result = "win";
    } else {
        result = "lose";
    }
    return result
}

#Preview {
    ContentView()
}

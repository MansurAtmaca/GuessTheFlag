//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mansurcan ATMACA on 25.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia","France", "Germany", "Nigeria","Ireland", "Italy", "Monaco", "Poland","Spain","UK","Ukraine","US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    @State var showingScore = false
    @State var score = 0
    @State var scoreTitle = ""
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack (spacing: 30) {
                VStack {
                    Text("Guess the Flag")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy))
                    Text("- \(countries[correctAnswer]) -")
                        .foregroundStyle(.white)
                        .font(.largeTitle.weight(.semibold))
                    
                    ForEach(0..<3){ number in
                            Button{
                               flagTapped(number)
                                askQuestion()
                    
                            }label: {
                                Image(countries[number])
                                    .clipShape(.capsule)
                                    .shadow(radius: 5)
                                    
                            }
                    }
                    
                    Text("Score: \(score)")
                        .foregroundStyle(.black)
                        .font(.largeTitle.weight(.heavy))
                        .padding(.top,50)
                }
            }

            }
       /* .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        }message: {
            Text("Score: \(score)")
        }
        */
    }
    func flagTapped (_ number: Int){
        if number == correctAnswer{
            score += 1
            scoreTitle = "Correct"
        
        }else{
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}

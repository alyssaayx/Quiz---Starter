//
//  ContentView.swift
//  Quiz
//
//  Created by JiaChen(: on 1/6/21.
//

import SwiftUI

struct ContentView: View {
    
    var questions = [Question(title: "How many Nutellas does YJ eat a day?",
                              option1: "One",
                              option2: "Unlimited",
                              option3: "Nine",
                              option4: "Eight",
                              correctOption: 4),
                     
                     Question(title: "Does Jia Chen need sleep?",
                              option1: "Maybe",
                              option2: "Good question",
                              option3: "No",
                              option4: "Yes",
                              correctOption: 2),
                     
                     Question(title: "Will we meet Tim Cook one day",
                              option1: "In your dreams",
                              option2: "YJ",
                              option3: "Nutella",
                              option4: "Soon 🔜",
                              correctOption: 1)]
    
    @State var currentQuestion = 0
    @State var correctAnswers = 0
    
    @State var isAlertPresented = false
    @State var isCorrect = false
    
    @State var isModalPresented = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ProgressView(value: Double(currentQuestion),
                             total: Double(questions.count))
                    .padding()
                
                Text(questions[currentQuestion].title)
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .foregroundColor(Color.pink)
                    .underline(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, color: Color.white)
                    .bold()
                    .padding()
                
                HStack{
                    VStack {
                        Button{
                            didTapOption(optionNumber: 1)
                        }label: {
                            Image(systemName: "triangle.fill")
                            Text(questions[currentQuestion].option1)
                        }
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .cornerRadius(10)
                        
                        
                        
                        Button{
                            didTapOption(optionNumber: 2)
                        }label: {
                            Image(systemName: "circle.fill")
                            Text(questions[currentQuestion].option2)                    }
                    }
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                    
                    
                    
                    VStack{
                        Button{
                            didTapOption(optionNumber: 3)
                        }label: {
                            Image(systemName: "diamond.fill")
                            Text(questions[currentQuestion].option3)
                        }
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10)
                        
                        Button{
                            didTapOption(optionNumber: 4)
                        }label: {
                            Image(systemName: "square.fill")
                            Text(questions[currentQuestion].option4)
                        }
                    }
                    .foregroundColor(Color.white)
                    .background(Color.yellow)
                    
                    .cornerRadius(10)
                    .padding()
                }
                .padding()
            }
            .alert(isPresented: $isAlertPresented) {
                
                Alert(title: Text(isCorrect ? "Correct" : "Wrong"),
                      message: Text(isCorrect ? "Congrats, you are smart." : "This is outrageous, with such easy questions, how can you be getting this wrong?!"),
                      dismissButton: .default(Text("OK")) {
                        currentQuestion += 1
                        
                        if currentQuestion == questions.count {
                            isModalPresented = true
                            currentQuestion = 0
                        }
                      })
            }.sheet(isPresented: $isModalPresented) {
                ResultsScreen(score: correctAnswers, totalQuestions: questions.count)
            }
        }
        
    }
    
    func didTapOption(optionNumber: Int) {
        if optionNumber == questions[currentQuestion].correctOption {
            print("Correct!")
            isCorrect = true
            correctAnswers += 1
        } else {
            print("Wrong!")
            isCorrect = false
        }
        isAlertPresented = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

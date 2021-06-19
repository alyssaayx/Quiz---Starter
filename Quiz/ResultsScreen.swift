//
//  ResultsScreen.swift
//  Quiz
//
//  Created by JiaChen(: on 1/6/21.
//

import SwiftUI

struct ResultsScreen: View {
    
    var score: Int
    var totalQuestions: Int
    
    var body: some View {
        VStack {
            
            CircularProgressView(progress: CGFloat(score) /
                         CGFloat(totalQuestions))
                           .frame(width: 150, height: 150)
                        
            Text("You got")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .underline(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, color: Color.blue)
                .bold()
            
            Text("\(score)/\(totalQuestions)")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .foregroundColor(Color.purple)
                .underline(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, color: Color.purple)
                .bold()
                .padding()
            
        }
    }
}

struct ResultsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResultsScreen(score: 2, totalQuestions: 3)
    }
}

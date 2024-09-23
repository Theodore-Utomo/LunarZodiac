//
//  ContentView.swift
//  LunarZodiac
//
//  Created by Theodore Utomo on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentYear = Calendar.current.component(.year, from: Date.now)
    @State private var currentImageIndex = (Calendar.current.component(.year, from: Date.now) % 12 - 4 < 0 ? 12 - (Calendar.current.component(.year, from: Date.now) % 12 - 4) : Calendar.current.component(.year, from: Date.now) % 12 - 4)
    //Modified to make currentYear based off of real time data
    
    private let animalNames = ["RAT", "OX", "TIGER", "RABBIT", "DRAGON", "SNAKE", "HORSE", "GOAT", "MONKEY", "ROOSTER", "DOG", "PIG"]
    var body: some View {
        VStack {
            
            Text(String(currentYear))
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
            
            Spacer()
            
            Image(animalNames[currentImageIndex])
                .resizable()
                .scaledToFit()
            Text(animalNames[currentImageIndex])
                .font(.largeTitle)
                .fontWeight(.black)
            Spacer()
            
            HStack {
                Button() {
                    currentYear -= 1
                    if currentImageIndex == 0 {
                        currentImageIndex = 11
                    } else {
                        currentImageIndex -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                }
                
                Spacer()
                
                Button() {
                    currentYear += 1
                    if currentImageIndex == 11 {
                        currentImageIndex = 0
                    } else {
                        currentImageIndex += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        
                }
            }
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundStyle(.white)
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

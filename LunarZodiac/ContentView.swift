//
//  ContentView.swift
//  LunarZodiac
//
//  Created by Theodore Utomo on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentYear = Calendar.current.component(.year, from: Date.now)
    @State private var currentImage = (Calendar.current.component(.year, from: Date.now) % 12 - 4 < 0 ? 12 - (Calendar.current.component(.year, from: Date.now) % 12 - 4) : Calendar.current.component(.year, from: Date.now) % 12 - 4)
    //Modified to make currentYear based off of real time data
    var body: some View {
        VStack {
            
            Text(String(currentYear))
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
            Spacer()
            Image("image\(currentImage)")
                .resizable()
                .scaledToFit()
            Spacer()
            HStack {
                Button() {
                    currentYear -= 1
                    if currentImage == 0 {
                        currentImage = 11
                    } else {
                        currentImage -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Button() {
                    currentYear += 1
                    if currentImage == 11 {
                        currentImage = 0
                    } else {
                        currentImage += 1
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

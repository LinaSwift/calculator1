//
//  ContentView.swift
//  calculator1
//
//  Created by Galina Klinskikh on 22.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State var inputValue = "0"
    @State var savedValue: Double = 0
    @State var lastOperation = ""
    
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Text(inputValue)
                        .font(.system(size: 80))
                        .foregroundStyle(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
                
                HStack(spacing: 16) {
                    Button {
                        inputValue = "0"
                        lastOperation = ""
                        savedValue = 0.0
                    } label: {
                        buttonText("AC", color: .gray)
                    }
                    
                    Button {
                        let value = Double(inputValue) ?? 0.0
                        lastOperation = ""
                        show(value: -value)
                    } label: {
                        buttonText("-/+", color: .gray)
                    }
                    
                    Button {
                        let value = Double(inputValue) ?? 0.0
                        lastOperation = ""
                        show(value: value/100)
                    } label: {
                        buttonText("%", color: .gray)
                    }
                    
                    Button {
                        savedValue = Double(inputValue) ?? 0.0
                        lastOperation = "/"
                        inputValue = "0"
                    } label: {
                        buttonText("/", color: .orange)
                    }
                }
                
                HStack(spacing: 16) {
                    Button {
                        append(symbol: "7")
                    } label: {
                       buttonText("7")
                    }
                    
                    Button {
                        append(symbol: "8")
                    } label: {
                       buttonText("8")
                    }
                    
                    Button {
                        append(symbol: "9")
                    } label: {
                       buttonText("9")
                    }
                    
                    Button {
                        savedValue = Double(inputValue) ?? 0.0
                        lastOperation = "x"
                        inputValue = "0"
                    } label: {
                        buttonText("x", color: .orange)
                    }
                }
                
                
                HStack(spacing: 16) {
                    Button {
                        append(symbol: "4")
                    } label: {
                       buttonText("4")
                    }
                    
                    Button {
                        append(symbol: "5")
                    } label: {
                       buttonText("5")
                    }
                    
                    Button {
                        append(symbol: "6")
                    } label: {
                       buttonText("6")
                    }
                    
                    Button {
                        savedValue = Double(inputValue) ?? 0.0
                        lastOperation = "-"
                        inputValue = "0"
                    } label: {
                        buttonText("-", color: .orange)
                    }
                }
                
                HStack(spacing: 16) {
                    Button {
                        append(symbol: "1")
                    } label: {
                       buttonText("1")
                    }
                    
                    Button {
                        append(symbol: "2")
                    } label: {
                       buttonText("2")
                    }
                    
                    Button {
                        append(symbol: "3")
                    } label: {
                       buttonText("3")
                    }
                    
                    Button {
                        savedValue = Double(inputValue) ?? 0.0
                        lastOperation = "+"
                        inputValue = "0"
                    } label: {
                        buttonText("+", color: .orange)
                    }
                }
                
                HStack(spacing: 16) {
                    Spacer()
                    
                    Button {
                        append(symbol: "0")
                    } label: {
                       buttonText("0")
                    }
                    
                    Button {
                        guard inputValue.contains(".") == false
                        else {
                            return
                        }
                        inputValue.append(".")
                    } label: {
                       buttonText(".")
                    }
    
                    
                    Button {
                        guard let input = Double(inputValue) else {
                            savedValue = 0.0
                            lastOperation = ""
                            inputValue = "0"
                            return
                        }
                        
                        if lastOperation == "/" {
                            show(value: savedValue / input)
                        }
                        else if lastOperation == "x" {
                            show(value: savedValue * input)
                        }
                        else if lastOperation == "-" {
                            show(value: savedValue - input)
                        }
                        else if lastOperation == "+" {
                            show(value: savedValue + input)
                        }
                        
                    } label: {
                        buttonText("=", color: .orange)
                    }
                }
                
                
            }
        }
    }
    
    private func show(value: Double) {
        inputValue = String(format: "%g", value)
    }
    
    private func append(symbol: String) {
        guard inputValue.count <= 8 else {
            return
        }
        
        if inputValue == "0" {
            inputValue = ""
        }
        inputValue.append(symbol)
    }
    
    private func buttonText (_ text: String, color: Color? = .gray.opacity(0.3)) -> some View {
        Text(text)
            .font(.system(size: 40))
            .foregroundStyle(.white)
            .frame(width: getButtonWidth(), height: getButtonWidth())
            .background(color)
            .cornerRadius(getButtonWidth()/2)
    }
    private func getButtonWidth() -> CGFloat {
        return (UIScreen.main.bounds.size.width - 16*3)/4
    }
}

#Preview {
    ContentView()
}

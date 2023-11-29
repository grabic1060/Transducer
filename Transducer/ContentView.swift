//
//  ContentView.swift
//  Transducer
//

import SwiftUI

struct ContentView: View {
    @State var source = ""
    @State var destination = ""
    @State var inputNumber = ""
    @State var outputNumber = ""
    var selections = ["인치","야드","마일","피트","미터","킬로미터","센티미터"]
    
    var calculation:Double {
        
    }
    
    var body: some View {
        VStack (alignment: .center){
            Text("영미 단위 변환기")
                .font(.title)
                .padding()
            
            TextField("변환할 숫자를 입력하세요", text: $inputNumber)
                .padding(.leading ,55)
                .keyboardType(.decimalPad)
            
            HStack{
                Picker("입력 단위", selection: $source) {
                    ForEach(selections, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                .padding()
                
                Text("➞")
                    .font(.title2)
                    .padding()
                
                Picker("입력 단위", selection: $destination) {
                    ForEach(selections, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                .padding()
            }
            
            Text(outputNumber)
                .font(.largeTitle)
                .padding()
            
            .padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

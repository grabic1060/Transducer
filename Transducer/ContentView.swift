//
//  ContentView.swift
//  Transducer
//

import SwiftUI

struct ContentView: View {
    @State var source = "인치"
    @State var destination = "인치"
    @State var inputNumber = 0.0
    @State var outputNumber = 0.0
    @State var meter = 0.0
    var selections = ["인치","야드","마일","피트","미터","킬로미터","센티미터"]
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
    }()
    
    func calculation1(inputnumber: Double) -> Double {
        switch source {
        case "인치":
            calculation2(meter:inputNumber * 0.0254)
        case "야드":
            calculation2(meter:inputNumber * 0.9144)
        case "마일":
            calculation2(meter:inputNumber * 1609.34)
        case "피트":
            calculation2(meter:inputNumber * 0.3048)
        case "센티미터":
            calculation2(meter:inputNumber * 0.01)
        case "킬로미터":
            calculation2(meter:inputNumber * 1000)
        default:
            calculation2(meter:inputNumber)
        }
    }
    
    func calculation2(meter: Double) -> Double {
        if source == destination{
            return inputNumber
        }
        switch destination {
        case "인치":
            return(meter * 39.3701)
        case "야드":
            return(meter * 1.09361)
        case "마일":
            return(meter * 0.000621371)
        case "피트":
            return(meter * 3.28084)
        case "센티미터":
            return(meter * 100)
        case "킬로미터":
            return(meter * 0.001)
        default:
            return meter
        }
    }
    
    var body: some View {
        VStack (alignment: .center){
            Text("영미 단위 변환기")
                .font(.title)
                .padding()
            
            TextField("변환할 숫자를 입력하세요", value: $inputNumber, formatter: formatter)
                .padding(.leading ,55)
                .keyboardType(.decimalPad)
            
            HStack{
                Picker("입력 단위", selection: $source) {
                    ForEach(selections, id: \.self){
                        Text($0)
                    }
                    .font(.title3)
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
                    .font(.title3)
                }
                .pickerStyle(.menu)
                .padding()
            }
            
            Text(String(format: "%.2f", calculation1(inputnumber: inputNumber)))
                .font(.largeTitle)
                .padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

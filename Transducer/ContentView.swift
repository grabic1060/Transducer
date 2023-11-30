//
//  ContentView.swift
//  Transducer
//

import SwiftUI

struct ContentView: View {
    @State var source = "피트" //입력 단위
    @State var destination = "미터" //출력 단위
    @State var inputNumber = 0.0 //입력 숫자
    @State var outputNumber = 0.0 //출력 숫자
    @State var meter = 0.0 //미터값
    var selections = ["인치","야드","마일","피트","미터","킬로미터","센티미터"] //단위 선택지
    
    let formatter: NumberFormatter = { //텍스트필드 형식 지정 (Double)
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
    }()
    
    func calculation1(inputnumber: Double) -> Double { //모든 단위를 미터로 변환
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
    
    func calculation2(meter: Double) -> Double { //미터에서 목적 단위로 변환
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
    
    var body: some View { //UI 영역
        VStack (alignment: .center){
            Text("영미 단위 변환기") //타이틀
                .font(.title)
                .padding()
            
            TextField("변환할 숫자를 입력하세요", value: $inputNumber, formatter: formatter) //숫자 입력 필드
                .background(Color(uiColor: .secondarySystemBackground))
                .padding()
                .keyboardType(.decimalPad)
            
            HStack{
                Picker("입력 단위", selection: $source) { //입력 단위 선택
                    ForEach(selections, id: \.self){
                        Text($0)
                    }
                    .font(.title3)
                }
                .pickerStyle(.menu)
                .padding()
                
                Text("➞") //화살표
                    .font(.title2)
                    .padding()
                
                Picker("출력 단위", selection: $destination) { //출력 단위 선택
                    ForEach(selections, id: \.self){
                        Text($0)
                    }
                    .font(.title3)
                }
                .pickerStyle(.menu)
                .padding()
            }
            
            Text(String(format: "%.2f", calculation1(inputnumber: inputNumber))) //결과 필드
                .font(.largeTitle)
                .padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider { //SwiftUI 기본 구문 (수정X)
        static var previews: some View {
            ContentView()
        }
    }
}

//
//  ContentView.swift
//  HowHot?-v1.0
//
//  Created by Emrullah Demir on 3.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = 0.0
    @State private var sourceUnit = "Celcius"
    @State private var targetUnit = "Fahrenheit"
    @FocusState private var isFocused:Bool
    let units = ["Celcius","Fahrenheit","Kelvin"]
    
    func calculation(source:String, target:String, amount:Double) -> Double{
        let val = inputValue
        if(!source.elementsEqual(target)){
            //
            if(source == "Celcius" && target == "Fahrenheit"){
                return Double((val * 1.8) + 32.0)
            }else if(source == "Celcius" && target == "Kelvin"){
                return Double(val + 274.0)
            }else if(source == "Fahrenheit" && target == "Celcius"){
                return Double((val-32.0)*5/9)
            }else if(source == "Fahrenheit" && target == "Kelvin"){
                return Double(val + 274.0)
            }else if(source == "Kelvin" && target == "Fahrenheit"){
                return Double(val + 274.0)
            }else if(source == "Kelvin" && target == "Celcius"){
                return Double(val + 274.0)
            }
            
        }
        return val;
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Değer", value: $inputValue,format:.number).keyboardType(.decimalPad).focused($isFocused)
                }header: {
                    Text("Değer giriniz").textCase(.none)
                }
                Section{
                    Picker("Hangi değerden", selection:$sourceUnit ){
                        ForEach(units, id:\.self){unit in
                            Text("\(unit)")
                        }
                    }.pickerStyle(.segmented)
                }header: {
                    Text("Hangi cinsten?").textCase(.none)
                }
                Section{
                    Picker("Hangi değere", selection:$targetUnit ){
                        ForEach(units, id:\.self){unit in
                            Text("\(unit)")
                        }
                    }.pickerStyle(.segmented)
                }header: {
                    Text("Hangi cinse?").textCase(.none)
                }
                Section{
                    Text("Sonuç : \(calculation(source: sourceUnit, target: targetUnit, amount: inputValue)) \(targetUnit)")
                }
            }.navigationTitle("WhatTheTemp?")
                
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard){
                        Spacer()
                        Button("Tamam"){
                            isFocused = false
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

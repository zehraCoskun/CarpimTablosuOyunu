//
//  ContentView.swift
//  CarpimTablosuOyunu
//
//  Created by Zehra Coşkun on 15.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var secilenSayi = 2
    @State private var digerSayi = 1
    var body: some View {
        ZStack {
            Image("arkaplan")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer(minLength: 60)
                VStack{
                    Text("Çarpım Tablosu")
                        .padding()
                        .font(.largeTitle)
                        .foregroundColor(.teal)
                        .background(.yellow)
                        .cornerRadius(200)
                }.shadow(radius: 5)
                
                HStack {
                    Text("Beraber çarpım tablosu öğrenelim mi? Önce bir sayı, sonra da bir zorluk seç.")
                        .padding(20)
                        .background(.teal)
                        .cornerRadius(20)
                        .font(.caption)
                    
                    Spacer()
                    VStack {
                        Image("dinozor")
                            .resizable()
                            .padding(10)
                            .frame(width: 160, height: 170, alignment: .center)
                            .shadow(radius: 10)
                    }
                    
                }
                Spacer(minLength: 10)
                HStack {
                    Stepper("Öğrenmek istediğim sayi : \(secilenSayi)", value: $secilenSayi, in: 2...10)
                        .padding()
                        .background(.yellow)
                        .cornerRadius(20)
                        .font(.title2)
                }.shadow(radius: 10)
                
                HStack {
                    Button("Kolay"){kolaySeviye()}
                        .padding()
                        .frame(width: 100, height: 60, alignment: .center)
                        .background(.yellow)
                        .cornerRadius(20)
                    
                    Button("Zor"){zorSeviye()}
                        .padding()
                        .frame(width: 100, height: 60, alignment: .center)
                        .background(.yellow)
                        .cornerRadius(20)
                }.shadow(radius: 10)
                Spacer()
                VStack {
                    VStack{
                        Text("\(secilenSayi) x \(digerSayi)")
                            .font(.largeTitle)
                    }
                    HStack{
                        Button("\(cevaplar(number: 0))"){}
                            .padding()
                            .background(.white)
                            .clipShape(Circle())
                        Button("\(cevaplar(number: 1))"){}
                            .padding()
                            .background(.white)
                            .clipShape(Circle())
                        Button("\(cevaplar(number: 2))"){}
                            .padding()
                            .background(.white)
                            .clipShape(Circle())
                    }
                }
                .frame(width: 200, height: 100, alignment: .center)
                .padding(20)
                .shadow(radius: 10)
                .background(.teal)
                .cornerRadius(200)
                
                HStack {
                    Text("SKOR : 200")
                        .padding()
                        .background(.white)
                        .cornerRadius(200)
                        .frame(width: 200, height: 200, alignment: .center)
                        .foregroundColor(.mint)
                    Button("Tekrar Başla"){}
                        .padding()
                        .background(.white)
                        .cornerRadius(200)
                        .font(.footnote)
                        .frame(width: 200, height: 10, alignment: .center)
                        .foregroundColor(.red)
                }.shadow(radius: 10)
                
            }
            
            
        }
        .padding()
    }
    func kolaySeviye () -> Int{
        digerSayi = Int.random(in: 1...5)
        return digerSayi
    }
    func zorSeviye () -> Int{
        digerSayi = Int.random(in: 6...10)
        return digerSayi
    }
    func cevaplar(number: Int) -> Int{
        var secenekler = [(secilenSayi*digerSayi), ((secilenSayi-1)*digerSayi), (secilenSayi*(digerSayi+1))]
        secenekler.shuffle()
        let cevap = secenekler[number]
        return cevap
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

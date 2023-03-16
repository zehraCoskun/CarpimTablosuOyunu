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
    @State private var zorluk = false
    @State private var soru = "??"
    @State public var cevaplar = [2,4,6]
    @State private var skor = 0
    
    
    var body: some View {
        ZStack {
            Image("arkaplan")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer(minLength: 40)
                VStack{
                    Text("Çarpım Tablosu")
                        .padding()
                        .font(.largeTitle)
                        .foregroundColor(Color("Tas"))
                        .background(Color("Mavi"))
                        .cornerRadius(200)
                        .overlay(Capsule()
                            .stroke(AngularGradient(gradient: Gradient(colors: [Color("Kahve")]), center: .bottomTrailing), lineWidth: 5))
                }.shadow(radius: 5)
                Spacer(minLength: 40)
                HStack {
                    Text("Beraber çarpım tablosu öğrenelim mi?")
                        .padding(20)
                        .background(Color("Mavi"))
                        .foregroundColor(Color("Krem"))
                        .cornerRadius(20)
                        .font(.system(size: 20))
                    
                }
                Spacer(minLength: 10)
                HStack {
                    Stepper("Öğrenmek istediğim sayi : \(secilenSayi)", value: $secilenSayi, in: 2...10)
                        .padding()
                        .background(Color("Tas"))
                        .cornerRadius(20)
                        .foregroundColor(Color("Mavi"))
                        .font(.title2)
                }.shadow(radius: 10)
                
                HStack {
                    Toggle("Zorlaşsın mı?", isOn: $zorluk)
                    .foregroundColor(Color("Mavi"))
                    Button ("BAŞLA", action: soruSor)
                }.shadow(radius: 10)
                    .padding()
                    .background(Color("Tas"))
                    .cornerRadius(20)
                    .font(.title2)
                    .foregroundColor(Color("Mavi"))
                
                Spacer()
                VStack {
                    VStack{
                        Text(soru)
                            .font(.largeTitle)
                            .foregroundColor(Color("Kahve"))
                    }
                    HStack{
                        ForEach(0..<3) {number in Button {
                            soruSor()
                        }label: {
                            Text("\(cevaplarSiralama(number: number))")
                                .padding()
                                .shadow(radius: 5)
                                .background(Color("Tas"))
                                .clipShape(Circle())
                            
                        }}
                    }
                }
                .frame(width: 200, height: 100, alignment: .center)
                .padding(20)
                .shadow(radius: 10)
                .background(LinearGradient(gradient: Gradient(colors: [Color("Krem"), Color("Tas")]), startPoint: .bottom, endPoint: .top))
                
                .cornerRadius(200)
                
                HStack {
                    Text("SKOR : \(skor)")
                        .padding()
                        .background(.white)
                        .cornerRadius(200)
                        .frame(width: 200, height: 200, alignment: .center)
                        .foregroundColor(Color("Kahve"))
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
        .ignoresSafeArea()
    }
    func soruSor () {
        if zorluk == true {
            zorSeviye()
        } else { kolaySeviye()}
        cevaplarFunc()
    }
    func kolaySeviye () -> Int{
        digerSayi = Int.random(in: 1...5)
        return digerSayi
    }
    func zorSeviye () -> Int{
        digerSayi = Int.random(in: 6...10)
        return digerSayi
    }
    func cevaplarFunc() {
        let secenekler = [(secilenSayi*digerSayi), ((secilenSayi-1)*digerSayi), (secilenSayi*(digerSayi+1))]
        soru = "\(secilenSayi) x \(digerSayi)"
        cevaplar = secenekler
    }
    func cevaplarSiralama(number: Int) -> Int {
        cevaplar.shuffle()
        return cevaplar[number]
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

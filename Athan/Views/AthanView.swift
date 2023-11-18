//
//  ContentView.swift
//  Athan
//
//  Created by Reem Alammari on 01/05/1445 AH.
//

import SwiftUI


struct AthanView: View {
 
    @StateObject var aa = AthanInfo()
      @State private var date = Date.now
      let startDate: Date = Date()
      let endDate = Calendar.current.date(from: DateComponents(year: 2024 ))
      var athan: [Athan]
  
      var dateFormater : DateFormatter{
          let formatter = DateFormatter()
          formatter.dateStyle = .short
          return formatter
      }
  
      var body: some View {
          ZStack {
              Image("athanbackground")
                  .resizable()
                  .ignoresSafeArea()
              VStack{
                  Text("Pryer Times")
                      .font(.largeTitle)
                      .bold()
                      .foregroundColor(.brown.opacity(0.7))
                      .padding(.top)
                  Text("\(date.formatted(date: .complete , time: .omitted))")
                      .foregroundColor(.black.opacity(0.5))
                      .frame(maxWidth: .infinity)
                      .padding()
                      .background(.white)
                      .font(.title2)
                      .bold()
                  //===================================
                  VStack {
                      DatePicker("", selection: $date , in: startDate...(endDate ?? Date()))
                          .datePickerStyle(GraphicalDatePickerStyle())
                          .frame(maxHeight: 350)
                          .tint(.brown)
                          .padding(.top)
                      //===================================
                      let  fajr = aa.pryerTimes?.data.first(where: {date.formatted(date: .abbreviated , time: .omitted) == $0.date.readable})?.timings.Fajr
                      
                      let  duhr = aa.pryerTimes?.data.first(where: {date.formatted(date: .abbreviated , time: .omitted) == $0.date.readable})?.timings.Dhuhr
                      
                      let  asr = aa.pryerTimes?.data.first(where: {date.formatted(date: .abbreviated , time: .omitted) == $0.date.readable})?.timings.Asr
                      
                      let  magrib = aa.pryerTimes?.data.first(where: {date.formatted(date: .abbreviated , time: .omitted) == $0.date.readable})?.timings.Maghrib
                      
                      let  isha = aa.pryerTimes?.data.first(where: {date.formatted(date: .abbreviated , time: .omitted) == $0.date.readable})?.timings.Isha
                      //====================================
                      
                      VStack(alignment: .leading, spacing: 15.0) {
                          HStack(spacing: 20.0){
                              Image("fajer")
                                  .resizable()
                                  .scaledToFit()
                                  .clipShape(Circle())
                                   .frame(width: 50)
                              Text("Fajer:  \(fajr ?? "" ) ")
                          }
                          Divider().background(.brown)
                          HStack(spacing: 20.0){
                              Image("duhr")
                                  .resizable()
                                  .scaledToFit()
                                  .clipShape(Circle())
                                  .frame(width: 50)
                              Text("Dhuhr:  \(duhr ?? "") ")
                          }
                          Divider().background(.brown)
                          HStack(spacing: 20.0){
                              Image("asr")
                                  .resizable()
                                  .scaledToFit()
                                  .clipShape(Circle())
                                  .frame(width: 50)
                              Text("Asr:  \(asr ?? "") ")
                          }
                          Divider().background(.brown)
                          HStack(spacing: 20.0){
                              Image("magrib")
                                  .resizable()
                                  .scaledToFit()
                                  .clipShape(Circle())
                                  .frame(width: 50)
                              Text("Magrib:  \(magrib ?? "") ")
                          }
                          Divider().background(.brown)
                          HStack(spacing: 20.0){
                              Image("isha")
                                  .resizable()
                                  .scaledToFit()
                                  .clipShape(Circle())
                                  .frame(width: 50)
                              Text("Isha:  \(isha ?? "") ")
                              
                          }
                          
                      }.padding()
                      .foregroundColor(.brown)
                      .font(.title2)
                          .bold()
                  }
                  .onAppear(){
  
                     aa.fetch()
                  }
  
  
              }
          }
      }
  }

#Preview {
    AthanView(athan: [])
}


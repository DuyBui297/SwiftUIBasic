//
//  ContentView.swift
//  FirstDemoSwiftUI
//
//  Created by Duy Bui on 7/20/19.
//  Copyright © 2019 iosAppTemplates. All rights reserved.
//

import SwiftUI
import Combine

class WebService: BindableObject {
  
  var didChange = PassthroughSubject<Void, Never>()
  var webLink = "http://www.iosapptemplate.com" {
    didSet {
      didChange.send(())
    }
  }
}

struct ContentView : View {
  
  /// Variable
  @State var firstName = ""
  @State var lastName = ""
  @ObjectBinding var webService = WebService()
  
  /// View
  var body: some View {
    VStack(alignment: .center, spacing: 30) {
      Spacer()
      Text("iOS App Template")
        .font(.largeTitle)
        .padding(.bottom, 50)
      VStack(alignment: .center, spacing: 15) {
        Group {
          TextField($firstName, placeholder: Text("First Name"))
            .background(Color.white)
            .textFieldStyle(.roundedBorder)
          }.clipShape(RoundedRectangle(cornerRadius: 10))
        Group {
          TextField($lastName, placeholder: Text("Last Name"))
            .background(Color.white)
            .textFieldStyle(.roundedBorder)
          }.clipShape(RoundedRectangle(cornerRadius: 10))
        Group {
          TextField($webService.webLink, placeholder: Text("Website"))
            .background(Color.white)
            .textFieldStyle(.roundedBorder)
          }.clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(15)
        .background(Color.gray)
        .cornerRadius(15)
      VStack {
        Text("Premium functional iOS app templates")
          .font(.system(size: 22))
        Text("Make your own iOS apps in just a few hours")
          .font(.system(size: 17))
          .italic()
      }
      
      HStack(alignment: .center, spacing: 20) {
        Text("E-Commerce").color(Color.white)
          .padding(10)
          .background(Color.red)
          .cornerRadius(5)
        Text("Dating App").color(Color.white)
          .padding(10)
          .background(Color.green)
          .cornerRadius(5)
        Text("Booking app").color(Color.white)
          .padding(10)
          .background(Color.orange)
          .cornerRadius(5)
      }
      
      Button(action: {
        print("Thanks for your support")
      }) {
        Group {
          Text("Buy Now")
            .color(Color.white)
            .padding(15)
            .frame(width: 200, height: 50)
            .background(Color.blue)
          }
          .clipShape(RoundedRectangle(cornerRadius: 10))
          .shadow(radius: 10)
          .padding(.top, 50)
      }
      Spacer()
    }.padding(15)
      .background(
        Image("images")
          .resizable()
          .scaledToFill())
          .edgesIgnoringSafeArea(.all)
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif

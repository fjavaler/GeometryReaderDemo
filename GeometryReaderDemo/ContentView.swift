//
//  ContentView.swift
//  GeometryReaderDemo
//
//  Created by Fred Javalera on 3/31/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    
    GeometryReader { geometry in
      
      VStack {
        Rectangle()
          .frame(width: geometry.size.width/4, height: geometry.size.height/8, alignment: .center)
          .onTapGesture {
            // Coordinates take safe area into account
            print("Global: x: \(geometry.frame(in: .global).minX),y: \(geometry.frame(in: .global).minY)")
            // Coordinates DO NOT take safe area into account
            print("Local: x: \(geometry.frame(in: .local).minX),y: \(geometry.frame(in: .local).minY)")
          }
        
        // Coordinates printed for this rectangle are the same as the rectangle above. This is because it is not displaying the coordinates of the green rectangle, it is displaying the coordinates of the GeometryReader! If you want the individual coordinates of each rectangle, they should both be wrapped in their own GeometryReader.
        Rectangle()
          .foregroundColor(.green)
          .frame(width: geometry.size.width/4, height: geometry.size.height/8, alignment: .center)
          .onTapGesture {
            print("Global: x: \(geometry.frame(in: .global).minX),y: \(geometry.frame(in: .global).minY)")
            print("Local: x: \(geometry.frame(in: .local).minX),y: \(geometry.frame(in: .local).minY)")
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

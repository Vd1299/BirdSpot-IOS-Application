//
//  ContentView.swift
//  BirdSpot
//
//  Created by csuftitan on 2/23/22.
//

/*import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, welcome to Information page")
            .padding()
    }
} */

import SwiftUI


struct MenuBar: View {
    @Binding var name: String
    @Binding var color: (backColor: Color, textColor: Color)
    @Binding var isMainMenu: Bool
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geometry in
                HStack {
                    Text(name).foregroundColor(color.textColor).bold()
                    Spacer()
                    if isMainMenu == true {
                        Menu {
                            Text("Settings")
                           // Button("Location",action: openLocationMenu)
                            //Button("Language",action: changeLanguage)
                                //Button("Color Blind Mode", action: toggleColorBlindMode)
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(color.textColor)
                                .padding(.trailing, 10)
                        }
                    } else {
                        Button(action: {
                            self.mode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrowshape.turn.up.left")
                                .foregroundColor(color.textColor)
                                .padding(.trailing, 10)
                        }
                    }
                }
                    .modifier(menuModifier(menuColor: $color, isMM: $isMainMenu))
                    .frame(width:geometry.size.width)
        }
            .frame(height: 60)
            .hiddenNavBarSyle()
    }
}



struct menuModifier: ViewModifier {
    @Binding var menuColor: (backColor: Color, textColor: Color)
    @Binding var isMM: Bool
    func body(content: Content) -> some View {
        if isMM {
            content
                .font(.system(size:24))
                .frame(height: 60)
                .padding(.leading,10)
                .background(menuColor.backColor)
        } else {
            content
                .font(.system(size:24))
                .frame(height: 60)
                .padding(.leading,10)
                .background(menuColor.backColor)
                .cornerRadius(10)
        }
    }
}

struct HomeScreen: View {
    @State var viewName = "Birdspot"
    @State var titleColor = (backColor: Color.gray, textColor: Color.white)
    @State var ismainmenu = true
    var body: some View {
        GeometryReader { geometrey in
            VStack(spacing: 0){
                MenuBar(name: $viewName, color: $titleColor , isMainMenu: $ismainmenu)
                NavigationView {
                    NavigationLink(destination: InformationView()) {
                        Text("Open Information View")
                    }
                }.hiddenNavBarSyle()
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        HomeScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InformationView: View {
    @State var viewName = "Information View"
    @State var titleColor = (backColor: Color.pink, textColor: Color.black)
    @State var ismainmenu = false
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0){
                    MenuBar(name: $viewName, color: $titleColor , isMainMenu: $ismainmenu)
                    Text("The information page will have birds to browse and read information about")
                   
                    Image("Bald Eagle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150.0, height: 90.0, alignment: .center)
                        .border(Color.gray, width: 2.0)
                        .clipped()
                    Text("Bald Eagle")
                
                    Image("Blue Jay")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150.0, height: 90.0, alignment: .center)
                        .border(Color.gray, width: 2.0)
                        .clipped()
                    Text("Blue Jay")
                
                    Image("Northern Cardinal")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150.0, height: 90.0, alignment: .center)
                        .border(Color.gray, width: 2.0)
                        .clipped()
                    Text("Northern Cardinal")
                    
        
                    Spacer()
            }
        }
    }
        
}

struct hideNavBar : ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("",displayMode: .inline)
            .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavBarSyle() -> some View {
        modifier(hideNavBar())
    }
}

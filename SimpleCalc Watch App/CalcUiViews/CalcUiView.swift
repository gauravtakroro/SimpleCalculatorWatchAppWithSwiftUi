//
//  CalcUiView.swift
//  SimpleCalc Watch App
//
//  Created by Gaurav Tak on 18/08/23.
//

import SwiftUI

struct CalcUiView: View {
    @StateObject var calculatorViewModel = CalcViewModel()
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .mutliply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
        
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack {
                    // Text display
                    HStack {
                        Spacer()
                        Text(calculatorViewModel.resultValueDisplayed)
                            .bold()
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(alignment: .trailing)
                    }.frame(maxWidth: .infinity)
                    // Our buttons
                    ForEach(buttons, id: \.self) { row in
                        HStack {
                            ForEach(row, id: \.self) { item in
                                Text(item.rawValue)
                                    .font(.system(size: 16))
                                    .foregroundColor(.white) .frame(
                                        width: self.buttonWidth(item: item, geoWidth: geo.size.width),
                                        height: self.buttonHeight(geoWidth: geo.size.width)
                                    ).background(self.buttonBackgroundColor(item: item)).buttonStyle(.bordered) .cornerRadius(self.buttonWidth(item: item, geoWidth: geo.size.width)/2).onTapGesture {
                                        self.calculatorViewModel.didTap(button: item)
                                    }
                            }
                        }
                    }
                }.padding(.vertical, -10)
            }
        }
    }
}

extension CalcUiView {
    
    func buttonWidth(item: CalcButton, geoWidth: Double) -> CGFloat {
        if item == .equal  {
            return ((geoWidth - (2*12)) / 3.4) * 2
        }
        return (geoWidth - (3*12)) / 3.4
    }

    func buttonHeight(geoWidth: Double) -> CGFloat {
        return (geoWidth - (3*12)) / 6.2
    }
    
    func buttonBackgroundColor(item: CalcButton) -> Color {
        switch item {
        case .add, .subtract, .mutliply, .divide, .equal:
            return .blue
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

struct CalcUiView_Previews: PreviewProvider {
    static var previews: some View {
        CalcUiView()
    }
}


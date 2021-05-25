//
//  CustomButtonView.swift
//  App
//
//  Created by José João Silva Nunes Alves on 24/05/21.
//

import SwiftUI

struct CustomButtonView: View {
    var label: String = ""
    var icon: String = ""
    var color: Color = Color.white
    var action: (()->Void)?

    private var scale: CGFloat {
        return selected ? 1.0 : 0.85
    }

    private var backgroundColor: UIColor {
        return selected ? UIColor.black : UIColor.gray
    }

    private var iconColor: Color {
        return selected ? color : Color.gray
    }

    private var sizeButton: CGFloat {
        let screen = UIScreen.main.bounds.width + UIScreen.main.bounds.height
        if screen < 1354 {
            return 80
        }
        return 110
    }

    private var sizeIcon: CGFloat {
        let screen = UIScreen.main.bounds.width + UIScreen.main.bounds.height
        if screen < 1354 {
            return 28
        }
        return 40
    }

    private var sizeLabel: CGFloat {
        let screen = UIScreen.main.bounds.width + UIScreen.main.bounds.height
        if screen < 1354 {
            return 12
        }
        return 20
    }

    @State var selected: Bool = false
    var body: some View {
        ZStack {
            Color(backgroundColor)
                .opacity(0.45)
                .cornerRadius(26)
                .frame(width: self.sizeButton, height: self.sizeButton, alignment: .center)

            VStack {
                Image(systemName: icon)
                    .font(.system(size: self.sizeIcon, weight: .medium, design: .default))
                Text(label)
                    .font(.system(size: self.sizeLabel, weight: .medium, design: .rounded))
                    .allowsTightening(true)
                    .lineLimit(1)
                    .minimumScaleFactor(0.4)
            }
            .foregroundColor(iconColor)
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
        }
        .scaleEffect(scale)
        .onTapGesture {
            selected = !selected
            action?()
        }
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
            .previewLayout(.fixed(width: 80, height: 80))
    }
}

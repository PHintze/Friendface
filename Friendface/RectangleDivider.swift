//
//  RectangleDivider.swift
//  Friendface
//
//  Created by Pascal Hintze on 30.11.2023.
//

import SwiftUI

struct RectangleDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(Color(red: 0.2, green: 0.2, blue: 0.2))
            .padding(.vertical)
    }
}

#Preview {
    RectangleDivider()
}

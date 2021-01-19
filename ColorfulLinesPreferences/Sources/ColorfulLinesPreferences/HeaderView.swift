import SwiftUI

struct HeaderView: View {
    let name: String
    let developer: String
    let image: Image
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Text("Developed by \(developer)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            image
                .resizable()
                .frame(width: 50, height: 50)
        }
        .padding()
    }
}

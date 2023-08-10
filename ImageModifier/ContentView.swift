import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @State private var imageSize: CGSize = .zero
    
    var body: some View {
        GeometryReader { proxy in
            Image("Blueprint_2nd_Floor")
                .resizable()
                // This adds the ability to pan around after zooming, otherwise it get's locked to the center
                .onAppear {
                    self.imageSize = CGSize(width: proxy.size.width, height: proxy.size.height)
                }
                .scaledToFit()
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipShape(Rectangle())
                .modifier(ImageModifier(contentSize: imageSize))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

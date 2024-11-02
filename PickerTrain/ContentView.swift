import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .blue, .yellow]
    let colorNames: [String] = ["Red", "Blue", "Yellow"]
    @State var colorIndex = 0
    @State var isOn = false
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    Section(header: Text("General"), footer: Text("Lets go")) {
                        Picker(selection: $colorIndex,
                               label: Label("Color", systemImage: "circle.fill").foregroundStyle(colors[colorIndex]),
                               content: {
                            ForEach(0..<colorNames.count, id: \.self) {
                                Text(colorNames[$0]).tag($0)
                            }
                        })
                        Toggle(isOn: $isOn) {
                            Label("Enable notifications", systemImage: "bell.fill")
                        }
                    }.navigationTitle("Settings")
                    Section(header: Text("Notifications"), footer: Text("This header is about notifications")) {
                        Text("Notifications are enabled: \(isOn)")
                        Button("Toggle notifications") { isOn.toggle() }
                    }
                }
                Text("Settings page").padding()
            }
        }.animation(.spring(), value: colorIndex)
        

            
        
    }
}

#Preview {
    ContentView()
}

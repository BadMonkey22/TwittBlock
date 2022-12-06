import SwiftUI


// MARK: -
// ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————

struct HomeScreen: View {
 
    var isEnabled: Bool
 
    
    // MARK: -
    // ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————

    var body: some View {
        
        VStack( spacing: 20 ) {
            
            Logo(enabled: isEnabled)
                .padding()
            
            if isEnabled {
                instructionsEnabledMessage.frame( maxWidth: .infinity )
            } else {
                instructionsDisabledMessage.frame( maxWidth: .infinity )
            }
        }
    }

    
    // MARK: -
    // ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————

    @ViewBuilder
    var instructionsEnabledMessage: some View {
        
        Group {
            Text( LocalizedStringKey.instructionsEnabledTitle )
            Text( LocalizedStringKey.instructionsEnabledFooter )
        }
        .font( .title2 )
        .multilineTextAlignment(.center)
        
    }
    
    
    @ViewBuilder
    var instructionsDisabledMessage: some View {
      
        Group {
            Text( LocalizedStringKey.instructionsDisabledTitle )
            Text( LocalizedStringKey.instructionsDisabledMessage ).font( .title2 ) // .monospaced()
            Text( LocalizedStringKey.instructionsDisabledFooter )
        }
        .font( .title2 )
        .minimumScaleFactor( 0.42 )
        .multilineTextAlignment(.center)

    }
}


// MARK: -
// ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————

@available(macOS 12.0, *)
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeScreen(isEnabled: false)
                .preferredColorScheme(.light)
            HomeScreen(isEnabled: true)
                .preferredColorScheme(.light)
            HomeScreen(isEnabled: false)
                .preferredColorScheme(.dark)
            HomeScreen(isEnabled: true)
                .preferredColorScheme(.dark)

            HomeScreen(isEnabled: true)
                .preferredColorScheme(.light)
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
        }
        .previewLayout(.device)
    }
}

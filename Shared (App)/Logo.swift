import SwiftUI


// MARK: -
// ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————

struct Logo: View {
 
    var enabled: Bool

    
    // MARK: -
    // ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————

    var body: some View {
        Image( enabled  ?  "blockerEnabled"  :  "blockerDisabled" )
            .resizable()
            .frame( width: 256, height: 256 )
    }
}


// MARK: -
// ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Logo(enabled: false)
                .preferredColorScheme(.light)
            Logo(enabled: true)
                .preferredColorScheme(.light)
            Logo(enabled: false)
                .preferredColorScheme(.dark)
            Logo(enabled: true)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}

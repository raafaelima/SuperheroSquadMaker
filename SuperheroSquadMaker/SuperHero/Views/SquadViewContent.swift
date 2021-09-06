//
//  SquadView.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 06/09/2021.
//

import SwiftUI
import Kingfisher

struct CircleView: View {

    @State var heroName: String
    @State var thumbnailURL: String

    var body: some View {
        VStack {
            ZStack {
                KFImage(URL(string: thumbnailURL)!)
                    .placeholder { Image("heroThumbnail") }
                    .clipShape(Circle())
                    .frame(width: 70, height: 70)
            }

            Text(heroName)
                .foregroundColor(.white)
                .bold()
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)

        }.frame(width: 80, height: 130)
    }
}

struct SquadContentView: View {

    @State var squad: [Superhero]

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(squad, id: \.id) { hero in
                        CircleView(heroName: hero.name, thumbnailURL: hero.thumbnailURL)
                    }
                }.padding()
            }.frame(height: 150)
            .background(Color("marvelgray"))
        }
    }
}

#if DEBUG

let thumbnail = "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/portrait_xlarge.jpg"

let squad = [
    Superhero(id: 1, name: "Hero1", description: "", modified: "", thumbnailURL: thumbnail, profileImageURL: ""),
    Superhero(id: 2, name: "Hero2", description: "", modified: "", thumbnailURL: thumbnail, profileImageURL: ""),
    Superhero(id: 3, name: "Hero3", description: "", modified: "", thumbnailURL: thumbnail, profileImageURL: ""),
    Superhero(id: 4, name: "Hero4", description: "", modified: "", thumbnailURL: thumbnail, profileImageURL: ""),
    Superhero(id: 5, name: "Hero5", description: "", modified: "", thumbnailURL: thumbnail, profileImageURL: ""),
    Superhero(id: 6, name: "Hero6", description: "", modified: "", thumbnailURL: thumbnail, profileImageURL: ""),
    Superhero(id: 7, name: "Hero7", description: "", modified: "", thumbnailURL: thumbnail, profileImageURL: "")
]

struct SquadView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SquadContentView(squad: squad)
            SquadContentView(squad: squad)
                .previewDevice("iPod touch (7th generation)")
        }
    }
}

#endif

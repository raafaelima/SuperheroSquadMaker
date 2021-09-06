//
//  SquadCell.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 06/09/2021.
//

import UIKit

class SquadCell: UICollectionViewCell {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func initView(hero: Superhero) {
        self.heroName.text = hero.name
        self.heroImage.loadThumbnail(from: hero.thumbnailURL, rounded: true)
    }
}

//
//  SuperHeroTableViewCell.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 05/09/2021.
//

import Foundation
import UIKit

class SuperHeroTableViewCell: UITableViewCell {

    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroImage: UIImageView!

    private let margins = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.clipsToBounds = true
        contentView.layer.masksToBounds = false
        contentView.layer.cornerRadius = contentView.bounds.height/8
        contentView.frame = contentView.frame.inset(by: margins)
    }

    func initView(hero: Superhero) {
        self.heroName.text = hero.name
        self.heroImage.loadThumbnail(from: hero.thumbnailURL, rounded: true)
    }
}

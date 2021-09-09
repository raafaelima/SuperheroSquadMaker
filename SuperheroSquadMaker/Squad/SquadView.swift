//
//  SquadView.swift
//  SuperheroSquadMaker
//
//  Created by Rafael Lima on 06/09/2021.
//

import UIKit

private class SquadTapGesture: UITapGestureRecognizer {
    var hero: Superhero?
}

class SquadView: UIView {

    weak var coordinator: MainCoordinator?

    private var squadDataSource = [Superhero]()
    private let cellIdentifier = "SquadCell"

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("SquadView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        initCollectionView()
    }

    private func initCollectionView() {
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.dataSource = self
        collectionView.collectionViewLayout = horizontalLayout()
        collectionView.isUserInteractionEnabled = true
        collectionView.allowsSelection = true
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    func loadSquad(squad: [Superhero]) {
        OperationQueue.main.addOperation({
            self.squadDataSource = squad
            self.collectionView.reloadData()
        })
    }
}

extension SquadView: UICollectionViewDataSource, UICollectionViewDelegate {

    // MARK: - CollectionView Layout

    // Composition layout for ios device 13+
    // Reference: https://github.com/jrasmusson/swift-arcade/blob/master/UIKIt/UICollectionView/CompositionalLayout/README.md
    @available(iOS 13.0, *)
    func horizontalLayout() -> UICollectionViewLayout {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(70), heightDimension: .absolute(120))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .horizontal

        let layout = UICollectionViewCompositionalLayout(section: section, configuration: config)
        return layout
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return squadDataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? SquadCell

        let hero = squadDataSource[indexPath.row]

        let tap = SquadTapGesture(target: self, action: #selector(navigateToDetails(sender:)))
        tap.hero = hero
        tap.cancelsTouchesInView = false

        cell?.initView(hero: hero)
        cell?.addGestureRecognizer(tap)
        return cell!
    }

    @objc
    private func navigateToDetails(sender: SquadTapGesture) {
        if let hero = sender.hero {
            coordinator?.details(of: hero)
        }
    }
}

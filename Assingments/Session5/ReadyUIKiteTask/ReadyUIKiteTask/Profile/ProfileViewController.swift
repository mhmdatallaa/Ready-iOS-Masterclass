//
//  ProfileViewController.swift
//  ReadyUIKiteTask
//
//  Created by Mohamed Atallah on 14/12/2025.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var bioTextView: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

        let nib = UINib(nibName: "ProjectCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ProjectCell")
        bioTextView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna."
        title = "Profile"
    }
}

extension ProfileViewController: UICollectionViewDelegate {
    
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCell", for: indexPath) as? ProjectCell
        guard let cell else { return UICollectionViewCell() }
        return cell
    }
    
    
}




extension ProfileViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        let itemsPerRow: CGFloat = 2
        let spacing: CGFloat = 16

        let totalSpacing = spacing * (itemsPerRow + 1)
        let availableWidth = collectionView.bounds.width - totalSpacing
        let itemWidth = availableWidth / itemsPerRow

        return CGSize(width: itemWidth, height: itemWidth)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        16
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        16
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 16)
    }
}

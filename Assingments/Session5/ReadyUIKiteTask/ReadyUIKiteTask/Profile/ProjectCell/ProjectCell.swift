//
//  ProjectCell.swift
//  ReadyUIKiteTask
//
//  Created by Mohamed Atallah on 14/12/2025.
//

import UIKit

class ProjectCell: UICollectionViewCell {

    @IBOutlet weak var projectView: UIView!
    
    private let colors: [UIColor] = [.systemPink, .systemPurple, .systemBlue]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUP()
    }

    func setUP() {
        projectView.backgroundColor = colors.randomElement()
        projectView.layer.cornerRadius = 16
        projectView.clipsToBounds = true
    }
}

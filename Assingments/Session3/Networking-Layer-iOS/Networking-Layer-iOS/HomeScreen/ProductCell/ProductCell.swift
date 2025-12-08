//
//  ProductTableViewCell.swift
//  Networking-Layer-iOS
//
//  Created by Mohamed Atallah on 07/12/2025.
//

import UIKit

final class ProductCell: UITableViewCell {
    
    @IBOutlet private(set) var productImage: UIImageView!
    @IBOutlet private(set) var productTitle: UILabel!
    @IBOutlet private(set) var productDescription: UILabel!
    @IBOutlet private(set) var productPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureProductCell(_ product: Product) {
        productImage.load(from: product.image ?? "")
        productTitle.text = product.title
        productDescription.text = product.description
        productPrice.text =  "\(product.price ?? 0.00)$"
    }
    
}



//
//  ProductDetailsViewController.swift
//  Networking-Layer-iOS
//
//  Created by Mohamed Atallah on 09/12/2025.
//

import UIKit


final class ProductDetailsViewController: UIViewController {
    
    var product: Product
    
    init(product: Product) {
        self.product = product
        super.init(nibName: "ProductDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet private(set) var productImage: UIImageView!
    @IBOutlet private(set) var productPrice: UILabel!
    @IBOutlet private(set) var productDescription: UILabel!
    @IBOutlet private(set) var productTitle: UILabel!
    
    
    override func loadView() {
            let nib = UINib(nibName: "ProductDetailsViewController", bundle: nil)
            view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProduct()
        title = product.title ?? "N/A"
    }
    
    func configureProduct() {
        if let image = product.image {
            productImage.load(from: image, placeholder: nil)
        }
        productTitle.text = product.title ?? "N/A"
        productPrice.text = "Price: \(String(format: "$%.2f", product.price ?? 0.00))"
        productDescription.text = product.description
    }
}


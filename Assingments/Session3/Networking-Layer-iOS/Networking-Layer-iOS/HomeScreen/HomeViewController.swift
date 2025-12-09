//
//  HomeViewController.swift
//  Networking-Layer-iOS
//
//  Created by Mohamed Atallah on 08/12/2025.
//

import UIKit

class HomeViewController: UITableViewController {
    let viewModel: HomeViewModelProtocol
    private var products: [Product] = []
    
    init(viewModel: HomeViewModelProtocol, style: UITableView.Style = .plain) {
        self.viewModel = viewModel
        super.init(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Use init(viewModel:) instead.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ProductCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "productCell")
        title = "Products"
        Task {
            await viewModel.getAllProducts()
            let products = viewModel.products
            DispatchQueue.main.async {
                self.products = products
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductCell
        guard let cell else {
            return UITableViewCell()
        }
        let product = products[indexPath.row]
        print(product)
        cell.selectionStyle = .none
        cell.configureProductCell(product)
        return cell
    }
    
}


extension HomeViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetailsViewController = ProductDetailsViewController(product: products[indexPath.row])
        navigationController?.pushViewController(productDetailsViewController, animated: true)
    }
}

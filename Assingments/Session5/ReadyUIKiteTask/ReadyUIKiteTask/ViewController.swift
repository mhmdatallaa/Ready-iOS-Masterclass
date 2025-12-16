////
////  ViewController.swift
////  ReadyUIKiteTask
////
////  Created by Mohamed Atallah on 14/12/2025.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//}
//
//import UIKit
//
//final class ProfileViewController: UIViewController, UITextFieldDelegate {
//
//    // MARK: - Profile Section
//    private let profileImageView: UIImageView = {
//        let iv = UIImageView()
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.image = UIImage(systemName: "person.crop.circle.fill")
//        iv.contentMode = .scaleAspectFill
//        iv.tintColor = .systemGray
//        iv.layer.cornerRadius = 60
//        iv.clipsToBounds = true
//        return iv
//    }()
//
//    private let nameLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "John Appleseed"
//        label.font = .boldSystemFont(ofSize: 24)
//        return label
//    }()
//
//    private let jobLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "iOS Developer"
//        label.font = .systemFont(ofSize: 16)
//        label.textColor = .systemGray
//        return label
//    }()
//
//    private let bioTextView: UITextView = {
//        let tv = UITextView()
//        tv.translatesAutoresizingMaskIntoConstraints = false
//        tv.text = "Passionate iOS developer with experience in UIKit and SwiftUI. Loves clean architecture and performance."
//        tv.font = .systemFont(ofSize: 15)
//        tv.isScrollEnabled = true
//        tv.layer.borderWidth = 1
//        tv.layer.borderColor = UIColor.systemGray4.cgColor
//        tv.layer.cornerRadius = 8
//        return tv
//    }()
//
//    private let editButton: UIButton = {
//        var config = UIButton.Configuration.filled()
//        config.title = "Edit Profile"
//        config.cornerStyle = .medium
//        let button = UIButton(configuration: config)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    // MARK: - Form Section
//    private let usernameField = ProfileViewController.makeTextField(placeholder: "Username")
//    private let emailField = ProfileViewController.makeTextField(placeholder: "Email")
//    private let phoneField = ProfileViewController.makeTextField(placeholder: "Phone Number")
//
//    private let charCountLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "0/100"
//        label.font = .systemFont(ofSize: 13)
//        label.textColor = .systemGray
//        return label
//    }()
//
//    // MARK: - Settings Section
//    private let notificationSwitch = UISwitch()
//
//    private let sliderValueLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "5"
//        return label
//    }()
//
//    private let levelSlider: UISlider = {
//        let slider = UISlider()
//        slider.translatesAutoresizingMaskIntoConstraints = false
//        slider.minimumValue = 0
//        slider.maximumValue = 10
//        slider.value = 5
//        return slider
//    }()
//
//    private let segmentedControl: UISegmentedControl = {
//        let sc = UISegmentedControl(items: ["Low", "Medium", "High"])
//        sc.translatesAutoresizingMaskIntoConstraints = false
//        sc.selectedSegmentIndex = 1
//        return sc
//    }()
//
//    // MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        title = "Profile"
//
//        usernameField.delegate = self
//        emailField.keyboardType = .emailAddress
//        phoneField.keyboardType = .numberPad
//
//        levelSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
//        usernameField.addTarget(self, action: #selector(usernameChanged), for: .editingChanged)
//
//        setupLayout()
//    }
//
//    // MARK: - Layout
//    private func setupLayout() {
//        let switchStack = UIStackView(arrangedSubviews: [UILabel(text: "Notifications"), notificationSwitch])
//        switchStack.axis = .horizontal
//        switchStack.distribution = .equalSpacing
//
//        let sliderStack = UIStackView(arrangedSubviews: [levelSlider, sliderValueLabel])
//        sliderStack.axis = .horizontal
//        sliderStack.spacing = 12
//
//        let mainStack = UIStackView(arrangedSubviews: [
//            profileImageView,
//            nameLabel,
//            jobLabel,
//            bioTextView,
//            editButton,
//            usernameField,
//            charCountLabel,
//            emailField,
//            phoneField,
//            switchStack,
//            sliderStack,
//            segmentedControl
//        ])
//
//        mainStack.axis = .vertical
//        mainStack.spacing = 12
//        mainStack.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(mainStack)
//
//        NSLayoutConstraint.activate([
//            profileImageView.heightAnchor.constraint(equalToConstant: 120),
//            profileImageView.widthAnchor.constraint(equalToConstant: 120),
//            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            bioTextView.heightAnchor.constraint(equalToConstant: 100),
//
//            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
//        ])
//    }
//
//    // MARK: - Actions
//    @objc private func sliderChanged() {
//        sliderValueLabel.text = String(Int(levelSlider.value))
//    }
//
//    @objc private func usernameChanged() {
//        let count = usernameField.text?.count ?? 0
//        charCountLabel.text = "\(count)/100"
//    }
//
//    // MARK: - Helpers
//    private static func makeTextField(placeholder: String) -> UITextField {
//        let tf = UITextField()
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        tf.placeholder = placeholder
//        tf.borderStyle = .roundedRect
//        return tf
//    }
//}
//
//// MARK: - UILabel Convenience
//private extension UILabel {
//    convenience init(text: String) {
//        self.init()
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.text = text
//    }
//}

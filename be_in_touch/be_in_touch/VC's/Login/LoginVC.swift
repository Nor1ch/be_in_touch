//
//  LoginVC.swift
//  be_in_touch
//
//  Created by Nor1 on 18.05.2023.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {
    
    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var titleLogin: UILabel = {
        let view = UILabel()
        view.text = "Welcome Back"
        view.font = Constants.Font.Login.title
        view.textColor = .white
        return view
    }()
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.alpha = 0
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .red
        return view
    }()
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "horde"))
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
        startAnimation()
    }
    
    private func setupViews() {
        view.addSubview(backgroundImage)
        view.addSubview(containerView)
        view.addSubview(titleLogin)
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordTextField)
    }
    private func makeConstraints(){
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLogin.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(100)
        }
        containerView.snp.makeConstraints { make in
            make.top.equalTo(titleLogin.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(300)
        }
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(80)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(80)
        }
    }
    private func startAnimation(){
        UIView.animate(withDuration: 1, delay: 2, options: .curveEaseInOut){
            self.containerView.alpha = 0.9
        }
        UIView.animate(withDuration: 1, delay: 4, options: .curveEaseInOut, animations: {
            self.titleLogin.alpha = 0.5
        }, completion: {bool in
            UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut){
                self.titleLogin.snp.remakeConstraints { make in
                    make.centerY.equalToSuperview().dividedBy(2)
                    make.centerX.equalToSuperview()
                }
                self.view.layoutIfNeeded()
            }
        })
    }
}

//
//  ViewController.swift
//  MarioLuigi
//
//  Created by Karl Petersson on 2018-09-30.
//  Copyright © 2018 Karl Petersson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SelectionDelegate {
    let selectViewController = SelectViewController()
    
    let chooseButton:UIButton = {
        let button = UIButton()
        button.setTitle("Choose", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        button.addTarget(self, action: #selector(ViewController.buttonPressed), for: .touchUpInside)
        return button
    }()
    
    let imageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "mario_mushroom_big"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(chooseButton)
        view.addSubview(imageView)
        selectViewController.selectDelegate = self
        setUpLayout()
    }
    
    @objc func buttonPressed(){
        print("Pressed")
        self.navigationController?.pushViewController(selectViewController, animated: true)
    }
    
    func didTapOnCharacter(character: Character) {
        self.view.backgroundColor = character.backgroundColor
        self.imageView.image = character.image
    }
    
    func setUpLayout() {
        chooseButton.widthAnchor.constraint(equalToConstant: self.view.frame.width/2).isActive = true
        chooseButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        chooseButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: self.view.frame.width/3).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: self.view.frame.width/3).isActive = true
    }
}


//
//  SelectViewController.swift
//  MarioLuigi
//
//  Created by Karl Petersson on 2018-09-30.
//  Copyright © 2018 Karl Petersson. All rights reserved.
//
import UIKit
import SwiftGifOrigin
import RxSwift

class SelectViewController: UIViewController {
    
    private let selectedCharacterSubject = PublishSubject<Character>()
    var selectedCharacter:Observable<Character> {
        return selectedCharacterSubject.asObservable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(marioButton)
        view.addSubview(luigiButton)
        setupLayout()
        
    }
    let marioButton:UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage.gif(name: "mario"), for: .normal)
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(SelectViewController.marioPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let luigiButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage.gif(name: "luigi"), for: .normal)
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(SelectViewController.luigiPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func marioPressed(){
        print("Mario Pressed")
        guard let image = marioButton.imageView?.image else {return}
        selectedCharacterSubject.on(.next(Character.init(backgroundColor: .red, image: image)))
        navigationController?.popViewController(animated: true)
    }
    
    @objc func luigiPressed(){
        print("Luigi Pressed")
        guard let image = luigiButton.imageView?.image else {return}
        selectedCharacterSubject.on(.next(Character.init(backgroundColor: .green, image: image)))
        navigationController?.popViewController(animated: true)
    }
    
    func setupLayout() {
        marioButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -self.view.frame.height / 3 * 0.5).isActive = true
        marioButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        marioButton.imageView?.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/3).isActive = true
        marioButton.imageView?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/3).isActive = true
        
        luigiButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.height / 3 * 0.5).isActive = true
        luigiButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        luigiButton.imageView?.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/3).isActive = true
        luigiButton.imageView?.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/3).isActive = true
    }
    
}

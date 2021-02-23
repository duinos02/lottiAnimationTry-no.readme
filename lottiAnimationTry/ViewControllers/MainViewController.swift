//
//  ViewController.swift
//  lottiAnimationTry
//
//  Created by 이예진 on 2021/02/09.
//

import UIKit
import Lottie

class MainViewController: UIViewController {

    let titleLabel : UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "안녕하세요!"
        label.font = UIFont.boldSystemFont(ofSize: 70)
        
        return label
    }()
    
    let animationView : AnimationView = {
        let animView = AnimationView(name: "47642-circle-wave")
        animView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        animView.contentMode = .scaleAspectFill
        return animView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(animationView)
        view.backgroundColor = .white
        animationView.center = view.center
        
        //애니메이션 실행
        animationView.play{ (finish) in
            print("animation done")
        
            self.animationView.removeFromSuperview()
            
            //애니메이션 실행 괄호 안으로 들어왔을 때는 애들 다 self를 명시해줘야 오류 안남
            self.view.addSubview(self.titleLabel)
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        }
    }


}


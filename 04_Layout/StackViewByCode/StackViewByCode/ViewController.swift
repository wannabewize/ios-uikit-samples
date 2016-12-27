//
//  ViewController.swift
//  StackViewByCode
//
//  Created by Jaehoon Lee on 2016. 12. 27..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutByConstraints()
        layoutByStackView()
    }

    func layoutByStackView() {
        let titleLabel = UILabel()
        titleLabel.text = "제목"
        
        let title = UILabel()
        title.text = "스타워즈7"
        
        let directorLabel = UILabel()
        directorLabel.text = "감독"
        
        let director = UILabel()
        director.text = "JJ 에이브럼스"
        
        let actorLabel = UILabel()
        actorLabel.text = "주연"
        actorLabel.frame.size.width = 80
        
        let actors = UILabel()
        actors.text = "데이지 리들리, 존 보예가, 아담 드라이버, 해리슨 포드"
        actors.numberOfLines = 0
        
        let labelWidth : CGFloat = 80
        
        let titleStackView = UIStackView(arrangedSubviews: [titleLabel, title])
        titleLabel.frame.size.width = labelWidth
        titleStackView.distribution = .fillProportionally
        titleStackView.alignment = .fill
        titleStackView.spacing = 10
        
        let directorStackView = UIStackView()
        // 스택뷰에 뷰 추가
        directorStackView.addArrangedSubview(directorLabel)
        directorStackView.addArrangedSubview(director)
        directorLabel.frame.size.width = labelWidth
        directorStackView.alignment = .fill
        directorStackView.distribution = .fillProportionally
        directorStackView.spacing = 10
        
        let actorStackView = UIStackView(arrangedSubviews: [actorLabel, actors])
        actorLabel.frame.size.width = labelWidth
        actorStackView.alignment = .fill
        actorStackView.distribution = .fillProportionally
        actorStackView.spacing = 10
        
        let movieStackView = UIStackView(arrangedSubviews: [titleStackView, directorStackView, actorStackView])
        movieStackView.axis = .vertical
        movieStackView.spacing = 22
        
        self.view.addSubview(movieStackView)
        
        movieStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let views : [String:AnyObject] = ["movieView":movieStackView, "topGuide":self.topLayoutGuide]
        
        let constraints1 = NSLayoutConstraint.constraints(withVisualFormat: "|-[movieView]-|", options: [], metrics: nil, views: views)
        let constraints2 = NSLayoutConstraint.constraints(withVisualFormat: "V:[topGuide]-300-[movieView]", options: [], metrics: nil, views: views)
        
        self.view.addConstraints(constraints1)
        self.view.addConstraints(constraints2)
        
    }

    func layoutByConstraints() {
        let titleLabel = UILabel()
        titleLabel.text = "제목"
        self.view.addSubview(titleLabel)
        
        let title = UILabel()
        title.text = "스타워즈7"
        self.view.addSubview(title)
        
        let directorLabel = UILabel()
        directorLabel.text = "감독"
        self.view.addSubview(directorLabel)
        
        let director = UILabel()
        director.text = "JJ 에이브럼스"
        self.view.addSubview(director)
        
        
        let actorLabel = UILabel()
        actorLabel.text = "주연"
        self.view.addSubview(actorLabel)
        
        let actors = UILabel()
        actors.text = "데이지 리들리, 존 보예가, 아담 드라이버, 해리슨 포드"
        actors.numberOfLines = 0
        self.view.addSubview(actors)
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        directorLabel.translatesAutoresizingMaskIntoConstraints = false
        director.translatesAutoresizingMaskIntoConstraints = false
        
        actorLabel.translatesAutoresizingMaskIntoConstraints = false
        actors.translatesAutoresizingMaskIntoConstraints = false
        
        let metrics = ["NameWidth":80, "NameValueMargin":10, "VerticalMargin":22]
        let horizontalFormat = "|-[label(NameWidth)]-NameValueMargin-[value]-|"
        
        let titleViews = ["label":titleLabel, "value":title]
        
        let titleConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalFormat, options: .alignAllCenterY, metrics: metrics, views: titleViews)
        self.view.addConstraints(titleConstraints)
        
        let directorViews = ["label":directorLabel, "value":director]
        let directorConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalFormat, options: .alignAllCenterY, metrics: metrics, views: directorViews)
        self.view.addConstraints(directorConstraints)
        
        let actorViews = ["label":actorLabel, "value":actors]
        let actorConstratins = NSLayoutConstraint.constraints(withVisualFormat:horizontalFormat, options: .alignAllCenterY, metrics: metrics, views: actorViews)
        self.view.addConstraints(actorConstratins)
        
        
        let labels : [String:AnyObject] = ["title":titleLabel, "director":directorLabel, "actor":actorLabel, "topGuide":self.topLayoutGuide]
        let verticalConstratins = NSLayoutConstraint.constraints(withVisualFormat:"V:[topGuide]-150-[title]-VerticalMargin-[director]-VerticalMargin-[actor]", options: [], metrics: metrics, views: labels)
        self.view.addConstraints(verticalConstratins)
    }
}


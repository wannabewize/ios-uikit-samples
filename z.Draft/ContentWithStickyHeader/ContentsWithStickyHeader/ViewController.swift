//
//  ViewController.swift
//  ListInStickyScrollView
//
//  Created by Jaehoon Lee on 10/11/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stickyHeader: UIView!
    @IBOutlet weak var topContainer: UIView!
    @IBOutlet weak var bottomContainer: UIView!
    
    var headerConstraint: NSLayoutConstraint!
    var topContainerConstraint: NSLayoutConstraint!
    var topContainerHeight: CGFloat = 0

    var panGestureRecognizer: UIPanGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        containerView.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        
        let transition = gesture.translation(in: containerView)
        let dy =  transition.y
        
        gesture.setTranslation(.zero, in: containerView)
        
        var newTopContainerConstant: CGFloat
        var newHeaderConstant: CGFloat
        
        if headerConstraint.constant + dy <= 0 {
            newHeaderConstant = 0
        }
        else if headerConstraint.constant + dy > topContainerHeight {
            newHeaderConstant = topContainerHeight
        }
        else {
            newHeaderConstant = headerConstraint.constant + dy
        }
        
        if dy < 0 && newHeaderConstant == 0 {
            // 헤더가 붙은 상태에서, 더 이상 위로 스크롤 막음
            newTopContainerConstant = topContainerConstraint.constant
        }
        else if topContainerConstraint.constant + dy >= 0 {
            newTopContainerConstant = 0
        }
        else if topContainerConstraint.constant + dy <= -topContainerHeight {
            newTopContainerConstant = -topContainerHeight
        }
        else {
            newTopContainerConstant = topContainerConstraint.constant + dy / 2
        }
        
        self.topContainerConstraint.constant = newTopContainerConstant
        self.headerConstraint.constant = newHeaderConstant
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        stickyHeader.translatesAutoresizingMaskIntoConstraints = false
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false

        
        topContainerConstraint = topContainer.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0)
        headerConstraint = stickyHeader.topAnchor.constraint(equalTo: containerView.topAnchor, constant: topContainer.frame.height)

        // viewDidLoad에서는 안된다??? why?
        NSLayoutConstraint.activate([
            // 상단 콘텐츠는 절반 크기
            topContainerConstraint,
            topContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            topContainer.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            topContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),

            stickyHeader.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            headerConstraint,
            stickyHeader.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            stickyHeader.heightAnchor.constraint(equalToConstant: 40),

            bottomContainer.topAnchor.constraint(equalTo: stickyHeader.bottomAnchor),
            bottomContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bottomContainer.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            bottomContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        topContainerHeight = topContainer.frame.height
    }
}

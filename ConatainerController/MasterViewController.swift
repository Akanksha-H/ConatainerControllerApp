//
//  ViewController.swift
//  ConatainerController
//
//  Created by Admin on 08/10/22.
//

import UIKit

final class MasterViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    @objc private func selectionDidChange(_sender: UISegmentedControl){
        updateViewConstraints()
    }
    
    private func setSegmentCcontrol(){
        segmentControl.removeAllSegments()
        segmentControl.insertSegment(withTitle: "summeryViewController", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "FinalViewController", at: 1, animated: true)
        segmentControl.addTarget(self, action: #selector(selectionDidChange(_sender:)), for: .valueChanged)
        
        segmentControl.selectedSegmentIndex = 0
    }
    
    //There are several ways we can instantiate the child view controllers. We can add lazy properties to the MasterViewController class or we can set the child view controllers up when the master view controller is initialized. Use lazy properties because it instantiates the child view controllers when they are needed. If the user never taps the Sessions segment of the segmented control, then there is no need to instantiate an instance of the SessionsViewController class.
    
    private lazy var summeryViewController: summeryViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "summeryViewController") as? summeryViewController else {
            fatalError("Error loading summery")
        }
        
        self.add(asChildViewController: viewController)
        
    return viewController
    }()
    
    private lazy var finalViewController: FinalViewController = {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "FinalViewController") as? FinalViewController else {
            fatalError("Error loading final")
        }
        
        self.add(asChildViewController: viewController)

        return viewController
    }()
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View as Subview
        view.addSubview(viewController.view)

        // Define Constraints
        NSLayoutConstraint.activate([
            viewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
    private func updateView() {
        if segmentControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: finalViewController)
            add(asChildViewController: summeryViewController)
        } else {
            remove(asChildViewController: summeryViewController)
            add(asChildViewController: finalViewController)
        }
    }

    private func setupView() {
        setSegmentCcontrol()
       updateView()
    }

}


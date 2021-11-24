//
//  OnBoardingViewController.swift
//  PlatziFinanzas
//
//  Created by saul corona on 23/11/21.
//

import UIKit

struct OnBoardingItem {
    let title: String
    let description: String
    let imageName: String
}

class OnBoardingViewController: UIPageViewController {
    var pageControl: UIPageControl?
    
    fileprivate(set) lazy var items: [OnBoardingItem] = {
        return [
            OnBoardingItem(
                title: "Save money and reduce debt",
                description: "Press start button",
                imageName: "OnBoarding1"
            ),
            OnBoardingItem(
                title: "You have finished your onboarding",
                description: "",
                imageName: "OnBoarding2"
            )
        ]
    }()
    
    fileprivate(set) lazy var contentViewController: [UIViewController] = {
        var items = [UIViewController]()
        for i in 0 ..< self.items.count {
            items.append(self.instanteViewController(from: i))
        }
        return items
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
    }
    
    func instanteViewController(from index: Int) -> UIViewController {
        guard let viewController = UIStoryboard(name: "OnBoarding", bundle: Bundle.main)
            .instantiateViewController(withIdentifier: "OnBoardingSteps") as? OnBoardingStepsViewController else {
                return UIViewController()
        }
        
        viewController.item = items[index]
        return viewController
    }
}

extension OnBoardingViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
            let index = contentViewController.firstIndex(of: viewController)
            if index == 0 {
                return nil
            }
            return contentViewController[index! - 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController) -> UIViewController? {
            let index = contentViewController.firstIndex(of: viewController)
            if index == contentViewController.count - 1 {
                return nil
            }
            return contentViewController[index! + 1]
    }
}


extension OnBoardingViewController: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
            guard let index = contentViewController.firstIndex(of: viewControllers!.first!) else {
                return
            }
            pageControl?.currentPage = index
    }
}

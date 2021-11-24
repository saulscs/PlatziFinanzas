//
//  OnBoardingStepsViewController.swift
//  PlatziFinanzas
//
//  Created by saul corona on 23/11/21.
//

import UIKit

class OnBoardingStepsViewController: UIViewController {
    @IBOutlet weak var onBoardingImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var item: OnBoardingItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = item?.title
        descriptionLabel.text = item?.description
        onBoardingImage.image = UIImage(named: item?.imageName ?? "")

        // Do any additional setup after loading the view.
    }

}

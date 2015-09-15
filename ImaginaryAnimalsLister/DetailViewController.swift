//
//  DetailViewController.swift
//  ImaginaryAnimalsLister
//
//  Created by Charlie Williams on 14/09/2015.
//  Copyright © 2015 Charlie Williams. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var animal: ImaginaryAnimal?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLastSeenLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let animal = animal {
            self.nameLabel.text = animal.name
            self.heightLabel.text = "\(animal.height)"
            self.locationLabel.text = animal.location
            self.dateLastSeenLabel.text = animal.dateLastSeen
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if let url = animal?.imageURL, let imageData = NSData(contentsOfURL: url) {
            self.imageView.image = UIImage(data: imageData)
        }
    }
}

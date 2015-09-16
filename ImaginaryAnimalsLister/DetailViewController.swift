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
            
            loadImage()
        }
    }
    
    func loadImage() -> Void {
        let queue = dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(queue, { [weak self] in
            
            if let url = self?.animal?.imageURL,
                imageData = NSData(contentsOfURL: url) {
                    dispatch_async(dispatch_get_main_queue(), {
                        self?.imageView.image = UIImage(data:imageData)})
            }
        })
    }
}

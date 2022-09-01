//
//  ViewController.swift
//  NewProject
//
//  Created by iPHTech38 on 01/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fill_SignButtonView: UIView!
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    @IBOutlet weak var pagesLabel: UILabel!
    
    // Variable Declaration
    var timer = Timer()
    var counter = 0
    
    var noOfPages = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fill_SignButtonView.layer.cornerRadius = fill_SignButtonView.frame.height / 2
        
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        
        pagesLabel.text = "Page 1 of \(noOfPages)"
        
        DispatchQueue.main.async {
              self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
           }
    }
    
    
    @objc func changeImage() {
             
         if counter < noOfPages {
              let index = IndexPath.init(item: counter, section: 0)
              self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
              //pageView.currentPage = counter
              counter += 1
         } else {
              counter = 0
              let index = IndexPath.init(item: counter, section: 0)
              self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
              // pageView.currentPage = counter
               counter = 1
           }
        
        self.pagesLabel.text = "Page \(counter) of \(noOfPages)"
      }
    
    @IBAction func filL_SignButtonAction(_ sender: UIButton) {
        
    }

    @IBAction func saveButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noOfPages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


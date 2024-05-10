//
//  ViewController.swift
//  AnimationApp
//
//  Created by Gamze Akyüz on 28.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txt: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func alphaButton(_ sender: Any) {
        
        self.img.alpha = 0
        
        UIView.animate(withDuration: 5, animations: {
            
            self.img.alpha = 1
            
        },completion: nil)
        
    }
    @IBAction func scaleButton(_ sender: Any) {
        
        UIView.animate(withDuration: 1, animations: {
            
            self.img.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            
        },completion: nil)
        
    }
    @IBAction func rotateButton(_ sender: Any) {
        
//        radyan dönüşümü derece * .pi/180
        
        UIView.animate(withDuration: 1, animations: {
            
            self.txt.transform = CGAffineTransform(rotationAngle: 90 * .pi/180)
            
        },completion: nil)
        
    }
    @IBAction func translationButton(_ sender: Any) {
        
        UIView.animate(withDuration: 1, animations: {
            
            self.txt.transform = CGAffineTransform(translationX: 50, y: 0)
            
        },completion: nil)
        
    }
    @IBAction func cokluButton(_ sender: Any) {
        
        UIView.animate(withDuration: 5, animations: {
            
            let hareket = CGAffineTransform(translationX: 0, y: 100)
            let kucultme = CGAffineTransform(scaleX: 0.5, y: 0.5)
            let don = CGAffineTransform(rotationAngle: 90 * .pi/180)
            
            let x = hareket.concatenating(kucultme)
            
            self.txt.transform = don.concatenating(x)
            
            self.txt.alpha = 0
            
            
        },completion: nil)
        
    }
    @IBAction func ardisikButton(_ sender: Any) {
        
//        bir animasyon bittikten sonra başka animasyonu başlatabiliriz
        
        UIView.animate(withDuration: 1, animations: {
            
            self.img.alpha = 0
            
        },completion: {(true) in
            
            UIView.animate(withDuration: 1, animations: {
                
                self.txt.alpha = 0
                
            },completion: nil)
        })


        
    }
    @IBAction func gecikmeAnimasyonu(_ sender: Any) {
        
        UIView.animate(withDuration: 1,delay: 1, animations: {
            
            self.txt.transform = CGAffineTransform(translationX: 50, y: 0)
            
        },completion: nil)
        
    }
    @IBAction func ivmeAnimasyonı(_ sender: Any) {
        
        UIView.animate(withDuration: 2,delay: 1,options: [.curveEaseInOut], animations: {
            
            self.txt.transform = CGAffineTransform(translationX: 0, y: 100)
            
        },completion: nil)
    }
    @IBAction func tekrarAnimasyonu(_ sender: Any) {
        
        UIView.animate(withDuration: 1,delay: 1,options: [.repeat,.autoreverse], animations: {
            
            self.img.transform = CGAffineTransform(translationX: 0, y: 50)
            
        },completion: nil)
        
    }
    

    
}

//delay : görsel nesneye delay ile animasyona başlamadan önce geçikme eklenebilir

/**
 
 ivme oluşturma
 
 görsel nesneye gerçek hayatta olduğu gibi hızlanma ve yavaşlama etkisi verilebilir. option parametresi ile
 
 .curveLinear: varsayılan hali ile çalışır ivme etkisi olmaz
 .curveEaseIn: animastonun başında ivme uygulanır
 .curveEaseOut: animasyonun sonunda ivme uygulanır
 .curveEaseInOut : animasyonun başında ve sonunda iveme uygulanır
 
 not : geçikme parametresi olmadan option özelliğ eklenemez
 
 delay: 0, option: [.curveEaseIn]
 
 */

/**
 tekrar oluşturma
 
 animasyonların tekrarlama şekini belirler. option parametresi ile bu özellik kullanılır.
 
 repeat: yapılan işlemin son haline geldikten sonra başa dönerek işlemi tekrarlama
 
 autoreverse: yapılan işlemin son halina geldikten sonra geriye doğru işlem yapma şeklinde tekrarlama
 
 
 */

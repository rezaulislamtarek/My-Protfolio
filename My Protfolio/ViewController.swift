//
//  ViewController.swift
//  My Protfolio
//
//  Created by Rezaul Islam on 16/5/24.
//

import UIKit
import SnapKit

struct Skil{
    var title : String
    var icon : String
}

class ViewController: UIViewController {
    
    var skils : [Skil] = [
        Skil(title: "Swift", icon: "swift"),
        Skil(title: "iOS", icon: "iphone"),
        Skil(title: "Android", icon: "barcode"),
        Skil(title: "Java", icon: "cup.and.saucer.fill"),
        Skil(title: "Kotlin", icon: "k.circle.fill"),
        
    ]
    
    var rootStackView = UIStackView()
    var profileImage : UIImageView = UIImageView()
    var nameLabel : UILabel = UILabel()
    var professionLabel : UILabel = UILabel()
    var companyLabel : UILabel = UILabel()
    
    
    var skilScrollView = UIScrollView()
    var skilStackView = UIStackView()
    var skilLabel = UILabel()
    
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Protfolio"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configView()
        setUpUI()
        setUpConstraint()
        
    }
    
    func configView(){
        
        view.addSubview(rootStackView)
        view.addSubview(skilLabel)
        view.addSubview(skilScrollView)
        
        skilScrollView.showsHorizontalScrollIndicator = false
        skilScrollView.addSubview(skilStackView)
        
     }
    
    private func setUpProfilePic(){
        profileImage.image = UIImage(named: "tarek_new")
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.cornerRadius = 25
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill
         
    }
    
    private func setUpNameLabel(){
        nameLabel.text = "Md. Rezaul Islam"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private func setUpPossitionLabel(){
        professionLabel.text = "Senior Mobile Application Developer"
    }
    
    private func setUpCompanyLabel(){
        companyLabel.text = "Media365 Limited"
        companyLabel.font = UIFont.boldSystemFont(ofSize: 22)
    }
    
    private func configProfileStackView(){
        rootStackView.axis = .vertical
        rootStackView.spacing = 4
        rootStackView.distribution = .fill
        rootStackView.alignment = .leading
        rootStackView.backgroundColor = .systemMint.withAlphaComponent(0.1)
        rootStackView.layer.cornerRadius = 16
        
        
        rootStackView.addArrangedSubview(profileImage)
        rootStackView.addArrangedSubview(nameLabel)
        rootStackView.addArrangedSubview(professionLabel)
        rootStackView.addArrangedSubview(companyLabel)
    }
    
    private func setUpSkilStackView(){
        skilStackView.backgroundColor = .white
        skilStackView.distribution = .fillEqually
        skilStackView.axis = .horizontal
        skilStackView.spacing = 0
        
         
        addSkils()
    }
    
    private func addSkils(){
        skils.forEach { skil in
            let skilView = SkilItem(title: skil.title, image: UIImage(systemName: skil.icon)!)
            skilStackView.addArrangedSubview(skilView)
        }
    }
    
    private func setUpSkilLabel(){
        skilLabel.text = "Skils"
        
    }
    
    private func setUpUI(){
        configProfileStackView()
        setUpProfilePic()
        setUpNameLabel()
        setUpPossitionLabel()
        setUpCompanyLabel()
        
        setUpSkilLabel()
        
        setUpSkilStackView()
        
        
        
    }
    
    private func setUpConstraint(){
        rootStackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        rootStackView.isLayoutMarginsRelativeArrangement = true
        
        rootStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        profileImage.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(130)
        }
        
        skilLabel.snp.makeConstraints { make in
            make.top.equalTo(rootStackView.snp.bottom).offset(12)
            make.left.equalTo(rootStackView.snp.left)
        }
         
        skilScrollView.snp.makeConstraints { make in
            make.top.equalTo(skilLabel.snp.bottom).offset(8)
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
        
        skilStackView.snp.makeConstraints { make in
            
            make.leading.equalTo(skilScrollView.snp.leading).offset(16)
            make.trailing.equalTo(skilScrollView.snp.trailing)
            make.top.equalTo(skilScrollView.snp.top)
            make.bottom.equalTo(skilScrollView.snp.bottom)
        }
        
    }
    
}
#Preview{
    ViewController()
}



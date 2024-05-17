//
//  SkilItem.swift
//  My Protfolio
//
//  Created by Rezaul Islam on 17/5/24.
//

import UIKit
import SnapKit

class SkilItem: UIView {
    
    private let stackView : UIStackView = {
         
        let stv = UIStackView()
        stv.axis = .horizontal
        stv.spacing = 4
        stv.alignment = .center
        stv.backgroundColor =  .systemMint.withAlphaComponent(0.1)
        stv.layoutMargins = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        stv.isLayoutMarginsRelativeArrangement = true
        stv.layer.cornerRadius = 8
        return stv
    }()
    
    private let iconImageView : UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private let skilLabel : UILabel = {
       let ul = UILabel()
        return ul
    }()
    
    init(title: String, image : UIImage) {
        super.init(frame: .zero)
        config(title: title, image: image)
        setConstraint()
    }
    
     
    
    func config(title: String, image : UIImage){
         
        addSubview(stackView)
        
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(skilLabel)
        
        
        
        iconImageView.image = image
        skilLabel.text = title
    }
    
    
    func setConstraint(){
        
        iconImageView.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
        
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().inset(4)
        }
    }
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


#Preview{
    SkilItem(title: "iOS", image: UIImage(systemName: "swift")!)
}

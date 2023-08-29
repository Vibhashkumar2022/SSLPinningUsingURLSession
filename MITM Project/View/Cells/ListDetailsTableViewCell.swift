//
//  ListDetailsTableViewCell.swift
//  MITM Project
//
//  Created by Vibhash Kumar on 28/08/23.
//

import UIKit

struct ListDetailsCellViewModel {
    var id_Nation : String?
    var nation : String?
    var id_Year : Int?
    var year : String?
    var population : Int?
    var slug_Nation : String?
    
    init(id_Nation: String? = nil, nation: String? = nil, id_Year: Int? = nil, year: String? = nil, population: Int? = nil, slug_Nation: String? = nil) {
        self.id_Nation = id_Nation
        self.nation = nation
        self.id_Year = id_Year
        self.year = year
        self.population = population
        self.slug_Nation = slug_Nation
    }
}

class ListDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView : UIView!
    @IBOutlet weak var cellTitleLbl : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(viewModel : ListDetailsCellViewModel?){
        cellTitleLbl.text = "\(viewModel?.id_Year ?? 0)"
    }
}

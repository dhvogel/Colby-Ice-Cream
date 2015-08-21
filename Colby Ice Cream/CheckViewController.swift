import UIKit

class CheckViewController: UIViewController {
    
    //@IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var pageIndex: Int!
    var titleText: String!
    var flavors: [String!] = []
    @IBOutlet weak var Flavor1: UILabel!
    @IBOutlet weak var Flavor2: UILabel!
    @IBOutlet weak var Flavor3: UILabel!
    @IBOutlet weak var Flavor4: UILabel!
    @IBOutlet weak var Submitted_By: Bold_Label!
    @IBOutlet weak var Time_Submitted: UILabel!
    
    
    let colorGen = ColorGenerator()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#FE7877", hexBottom: "F7D021")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)
        
        //self.imageView.image = UIImage(named: self.imageFile)
        self.titleLabel.text = self.titleText
        self.Flavor1.text = flavors[0]
        self.Flavor2.text = flavors[1]
        self.Flavor3.text = flavors[2]
        self.Flavor4.text = flavors[3]
        self.Submitted_By.text = "Submitted By: " + flavors[4]
        self.Time_Submitted.text = "Time Submitted: " + flavors[5]
        
    }
    
    override func didReceiveMemoryWarning() { 
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
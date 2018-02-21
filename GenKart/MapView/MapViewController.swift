import UIKit
import GoogleMaps
import SwiftyJSON




class MapViewController: UIViewController,GMSMapViewDelegate{
    
    @IBOutlet fileprivate weak var mapView: GMSMapView!
    //private var infoWindow = InfoView()
    fileprivate var locationMarker : GMSMarker? = GMSMarker()
    
    override func viewDidLoad() {
   
        super.viewDidLoad()
        GetStores()
        let camera = GMSCameraPosition.camera(withLatitude: 33.5317, longitude: 73.1188, zoom: 15.0)
        mapView.camera = camera
        showMarker(position: camera.target)
        
        circle()
        mapView.settings.myLocationButton = true
        
        
    }
    
    func mapView(_ mapView: GMSMapView, didTapMyLocation location: CLLocationCoordinate2D) {
        performSegue(withIdentifier: "Show", sender: nil)
        
        
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        print("tapped")
        performSegue(withIdentifier: "Show", sender: nil)
        
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        performSegue(withIdentifier: "Show", sender: nil)
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        print("tapped")
        performSegue(withIdentifier: "Show", sender: nil)
        
        return true
        
    }
    
 
    
    func showMarker(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.isDraggable = true
        marker.position = position
        marker.appearAnimation = GMSMarkerAnimation.pop
        marker.title = "WebMarke8"
        marker.snippet = "Bahria Phase 7"
        marker.isTappable = true
        
        
        marker.map = mapView
        
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        performSegue(withIdentifier: "Show", sender: nil)
        
    }
    

    
    func circle(){
        let circleCenter = CLLocationCoordinate2D(latitude: 33.5317, longitude: 73.1188)
        
        let circ = GMSCircle(position: circleCenter, radius: 1000)
        circ.fillColor = UIColor(red: 0.0, green: 0.7, blue: 0, alpha: 0.1)
        circ.strokeColor = UIColor.blue
        circ.strokeWidth = 2.5
        circ.map = mapView
    }
    
}
extension MapViewController{

    func GetStores(){
 
        //  let request = NSMutableURLRequest(url: NSURL(string: "http://webmarke8.com/gincart/api/password/email"
        // )! as URL)
        
        //
        //let postString = "email=\(fgEmail)"
        // request.httpBody = postString.data(using: String.Encoding.utf8)
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://webmarke8.com/gincart/api/stores")! as URL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(usertokenn)", forHTTPHeaderField: "Authorization")
        
      
        let task = URLSession.shared.dataTask(with: request as URLRequest) {(data, response, error) in
            
            if error != nil {
                print("error=\(String(describing: error))")
                return
            }
            
            // print("response = \(data)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //
            print("responseString = \(responseString!)")
        
            // Convert server json response to NSDictionary
            do {
                if (try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary) != nil {
                    
                    
                    let json = JSON(data!)
                    
                    print(json)
                    
    
                    
                }

            }

                
            catch let error as NSError {
                print(error.localizedDescription)
                
            }
            
            
            
            
            
            
            
            
            
            
        }
        
        
        task.resume()
        
        
        
        
        
    }
    
    
    
    
    
    
    //MARK - GMSMarker Dragging
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("didBeginDragging")
    }
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("didDrag")
    }
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("didEndDragging")
    }
    
    
    
    
    
    
    
    
    
}


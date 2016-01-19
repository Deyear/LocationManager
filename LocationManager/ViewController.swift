//
//  ViewController.swift
//  LocationManager
//
//  Created by maiziedu on 11/23/15.
//  Copyright © 2015 Alatan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?  // Manager 管理器 Location 地址
    var mapView:MKMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        //设备使用电池供电时最高的精度
        locationManager!.desiredAccuracy = kCLLocationAccuracyBest
        //精确到1000米,距离过滤器，定义了设备移动后获得位置信息的最小距离
        locationManager!.distanceFilter = 10.0 // 单位 10 米
        let state = CLLocationManager.locationServicesEnabled()
        let auth = CLLocationManager.authorizationStatus()
        
        
        if state {
            
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager!.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("\(locations)")
        
        let location = locations.last
        
        manager.stopUpdatingLocation()
        
        // 地址编码器
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location!) { (placeMarks, error) -> Void in
            
            for pm:CLPlacemark in placeMarks! {
                print("\(pm)")
                
                let addDic = pm.addressDictionary
                print("\(addDic)")
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        
        print("\(newLocation)")
        
        manager.stopUpdatingLocation()

    }
    
    func locationManager(manager: CLLocationManager, didStartMonitoringForRegion region: CLRegion) {
        
    }
}


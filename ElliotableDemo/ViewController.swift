//
//  ViewController.swift
//  Timetable Library
//
//  Created by denny on 2021/01/11.
//

import UIKit
import Elliotable

class ViewController: UIViewController, ElliotableDelegate, ElliotableDataSource {
    @IBOutlet var timetable: Elliotable!
    
    let dayString: [String] = ["월", "화", "수", "목", "금"]
    
    let courseList: [ElliottEvent] = [ElliottEvent(courseId: "c0001", courseName: "Operating System", roomName: "IT Building 21204", professor: "TEST", courseDay: .tuesday, startTime: "12:00", endTime: "13:15", textColor: UIColor.white, backgroundColor: .purple), ElliottEvent(courseId: "c0002", courseName: "Operating System", roomName: "IT Building 21204", professor: "TEST", courseDay: .thursday, startTime: "12:00", endTime: "13:15", textColor: UIColor.white, backgroundColor: .blue)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timetable.delegate = self
        timetable.dataSource = self
        
        // Table Item Properties
        timetable.elliotBackgroundColor = UIColor.white
        timetable.borderWidth        = 1
        timetable.borderColor        = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)

        // Course Item Properties
        timetable.textEdgeInsets = UIEdgeInsets(top: 2, left: 3, bottom: 2, right: 10)
        timetable.courseItemMaxNameLength = 18
        timetable.courseItemTextSize      = 12.5
        timetable.courseTextAlignment     = .left
        // Course Item Round Radius
        timetable.borderCornerRadius = 24
        timetable.roomNameFontSize        = 8

        // courseItemHeight - default : 60.0
        timetable.courseItemHeight       = 70.0

        // Day Symbol & Leftside Time Symbol Properties
        timetable.symbolFontSize = 14
        timetable.symbolTimeFontSize = 12
        timetable.symbolFontColor = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        timetable.symbolTimeFontColor = UIColor(displayP3Red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        timetable.symbolBackgroundColor = UIColor(named: "main_bg") ?? .white
    }
 
    func courseItems(in elliotable: Elliotable) -> [ElliottEvent] {
        return courseList
    }
    
    func elliotable(elliotable: Elliotable, didSelectCourse selectedCourse: ElliottEvent) {
        // Nothing
    }
    
    func elliotable(elliotable: Elliotable, didLongSelectCourse longSelectedCourse: ElliottEvent) {
        // Nothing
    }
    
    func elliotable(elliotable: Elliotable, at dayPerIndex: Int) -> String {
        return dayString[dayPerIndex]
    }
    
    func numberOfDays(in elliotable: Elliotable) -> Int {
        return 5
    }
}


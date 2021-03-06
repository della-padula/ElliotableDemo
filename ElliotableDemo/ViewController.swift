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
    
    let dayString: [String] = ["월", "화", "수", "목", "금", "토"]
    
    let courseList: [ElliottEvent] = [ElliottEvent(courseId: "c0001", courseName: "Operating System", roomName: "IT Building 21204", professor: "TEST", courseDay: .tuesday, startTime: "12:00", endTime: "13:15", textColor: UIColor.white, backgroundColor: .purple), ElliottEvent(courseId: "c0002", courseName: "Operating System", roomName: "IT Building 21204", professor: "TEST", courseDay: .thursday, startTime: "20:00", endTime: "23:15", textColor: UIColor.white, backgroundColor: .blue), ElliottEvent(courseId: "c0002", courseName: "Operating System", roomName: "IT Building 21204", professor: "TEST", courseDay: .friday, startTime: "21:30", endTime: "22:15", textColor: UIColor.white, backgroundColor: .blue), ElliottEvent(courseId: "c0002", courseName: "Operating System", roomName: "IT Building 21204", professor: "TEST", courseDay: .tuesday, startTime: "21:15", endTime: "22:15", textColor: UIColor.white, backgroundColor: .blue)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        timetable.courseItems = courseList
        
        timetable.delegate = self
        timetable.dataSource = self
        
        timetable.elliotBackgroundColor = UIColor.white
        timetable.borderWidth = 1
        timetable.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)

        timetable.textEdgeInsets = UIEdgeInsets(top: 2, left: 3, bottom: 2, right: 10)
        timetable.courseItemMaxNameLength = 18
        timetable.courseItemTextSize = 12.5
        timetable.courseTextAlignment = .left

        timetable.borderCornerRadius = 24
        timetable.roomNameFontSize = 8

        timetable.courseItemHeight = 70.0
        timetable.symbolFontSize = 14
        timetable.symbolTimeFontSize = 12
        timetable.symbolFontColor = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        timetable.symbolTimeFontColor = UIColor(displayP3Red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        
        timetable.reloadData()
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
        return dayString.count
    }
}


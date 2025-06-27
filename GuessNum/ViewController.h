//
//  ViewController.h
//  猜数字
//
//  Created by 哇哦 on 2022/6/12.
//

@import UIKit;
@import ActivityKit;

@interface ViewController : UIViewController

//label
@property (weak, nonatomic) IBOutlet UILabel *label_Tips;   //提示大、小
@property (weak, nonatomic) IBOutlet UILabel *label_Number;     //显示Slider的数字

//slider
@property (weak, nonatomic) IBOutlet UISlider *number_Slider;   //选择数滑杆

//button
@property (weak, nonatomic) IBOutlet UIButton *btn_Select;  //选择猜的数
@property (weak, nonatomic) IBOutlet UIButton *btn_Again;   //再玩一局
@property (weak, nonatomic) IBOutlet UIButton *btn_Tips;    //提示
@property (weak, nonatomic) IBOutlet UIButton *btn_Record;

//image
@property (weak, nonatomic) IBOutlet UIImageView *image_Info;

@end


//
//  ViewController.m
//  猜数字
//
//  Created by 哇哦 on 2022/6/12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int random_Value = 0;   //初始化随机数
int trans_Number_Slider_Value;  //转换
int number_Of_Clicks = 10;   //存储点击次数

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [_number_Slider setValue: 0];   //最开始值为0

    random_Value = (arc4random() % 100);    //取一个随机数

    [_btn_Tips setTitleColor: [UIColor lightGrayColor] forState: UIControlStateNormal];     //设置成不可用

    _label_Number.layer.masksToBounds = YES;
    _label_Number.layer.cornerRadius = 35;

    _btn_Record.layer.masksToBounds = YES;
    _btn_Record.layer.cornerRadius = 22;

    _btn_Select.layer.masksToBounds = YES;
    _btn_Select.layer.cornerRadius = 20;

    _btn_Again.layer.masksToBounds = YES;
    _btn_Again.layer.cornerRadius = 20;

    _image_Info.layer.masksToBounds = YES;
    _image_Info.layer.cornerRadius = 25;

}

- (IBAction)number_Slider: (UISlider *)sender {
    [_number_Slider setMinimumValue: 0];    //最小
    [_number_Slider setMaximumValue: 100];  //最大

    trans_Number_Slider_Value = (int)[_number_Slider value];   //强制转换类型
    NSString *number_slider_value = [NSString stringWithFormat: @"%d", trans_Number_Slider_Value];   //label只能用NSString显示

    [_label_Number setText: number_slider_value];   //把值显示在label上
}

- (IBAction)btn_Select: (UIButton *)sender {
    //判断随机数和选择的值的大小

    number_Of_Clicks--;     //点击一次自减

    //如果在那一局里待点击次数小于 0，那么不让次数变为负（即可以继续看提示）
    if (number_Of_Clicks < 0) {
        number_Of_Clicks = 0;
    }

    if (trans_Number_Slider_Value == random_Value) {
        [_label_Tips setText: @"猜对了！"];
        random_Value = 0;
        [_number_Slider setValue: 0];
        [_label_Number setText: @"0"];
        number_Of_Clicks = 10;

    } else if (trans_Number_Slider_Value > random_Value) {
        [_label_Tips setText: @"大了"];
    } else if (trans_Number_Slider_Value < random_Value) {
        [_label_Tips setText: @"小了"];
    }

    NSLog(@"%d", random_Value);
}

- (IBAction)btn_Again: (UIButton *)sender {
    random_Value = (arc4random() % 100);    //点击切换随机数
    [_label_Tips setText: @"请选择数字"];
    [_number_Slider setMaximumValue: 100];
    [_number_Slider setValue: 0];
    [_label_Number setText: @"0"];
    number_Of_Clicks = 10;
    NSLog(@"%d", random_Value);

    number_Of_Clicks = 10;  //新开局时设置待点击次数为10

//    [self performSegueWithIdentifier: @"SecondViewController" sender: self];
}

- (IBAction)btn_Tips: (UIButton *)sender {
    //如果待点击次数为 0，则可以查看提示
    if (number_Of_Clicks == 0) {
        NSString *trans_Random_Value = [NSString stringWithFormat: @"%d", random_Value];

        UIAlertController *number_Alert = [UIAlertController alertControllerWithTitle: @"提示" message: trans_Random_Value preferredStyle: UIAlertControllerStyleAlert];  //初始化主提示
        UIAlertAction *number_Alert_Action1 = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil];     //初始化确定按钮
        [number_Alert addAction: number_Alert_Action1];     //把确定按钮添加到主提示

        [self presentViewController: number_Alert animated: YES completion: nil];   //呈现提示

    } else {
        NSString *trans_Number_Of_Clicks = [NSString stringWithFormat: @"再猜%d次即可获取提示。", number_Of_Clicks];    //获取提示

        UIAlertController *number_Of_Clicks_Alert = [UIAlertController alertControllerWithTitle: @"提示" message: trans_Number_Of_Clicks preferredStyle: UIAlertControllerStyleAlert];  //初始化主提示
        UIAlertAction *number_Of_Clicks_Alert_Action1 = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil];     //初始化确定按钮

        [number_Of_Clicks_Alert addAction: number_Of_Clicks_Alert_Action1];     //把确定按钮添加到主提示

        [self presentViewController: number_Of_Clicks_Alert animated: YES completion: nil];     //呈现提示

    }
}

@end

//
//  ViewController.m
//  SudokuDemo
//
//  Created by qianfeng on 15/10/3.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#import "ViewController.h"

#define kScreen [[UIScreen mainScreen] bounds].size

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createUI];
}


-(void)createUI
{
    CGFloat wSpace=(kScreen.width-3*57)/4;
    CGFloat hSpace=(kScreen.height-3*57-49-64)/4;
    for (int i=0; i<9; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag=101+i;
        btn.backgroundColor=[UIColor redColor];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.masksToBounds=YES;
        btn.layer.cornerRadius=10;
        //算法  九宫格坐标的小算法:(横坐标:i%横向显示个数的最大值;纵坐标:i/纵向的个数的最大值)
        [btn setFrame:CGRectMake(wSpace+(i%3)*(57+wSpace), hSpace+(i/3)*(hSpace+57), 57, 57)];
        [self.view addSubview:btn];
        
        //label
      UILabel *label=[self createLabelWithFrame:CGRectMake(wSpace+(i%3)*(57+wSpace), hSpace+57+(i/3)*(hSpace+57), 57, 20) text:@"wo"];
        
        label.font=[UIFont systemFontOfSize:12];
        label.textAlignment=NSTextAlignmentCenter;
        [self.view addSubview:label];       
    }
}
-(UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text
{
    UILabel *label=[[UILabel alloc] initWithFrame:frame];
    label.text=text;
    label.backgroundColor=[UIColor clearColor];
    label.numberOfLines=0;
    label.font=[UIFont systemFontOfSize:15];
    return label;
    
}


-(void)btnClick:(UIButton *)sender
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

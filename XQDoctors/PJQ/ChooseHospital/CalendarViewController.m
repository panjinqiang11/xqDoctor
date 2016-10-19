//
//  CalendarViewController.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CalendarViewController.h"
#import "JTCalendar.h"

@interface CalendarViewController ()<JTCalendarDelegate>
@property (weak, nonatomic)  JTCalendarMenuView *calendarMenuView;
@property (weak, nonatomic)  JTHorizontalCalendarView *calendarContentView;
@property (nonatomic,strong) NSDate *dateSelected;

@property (strong, nonatomic) JTCalendarManager *calendarManager;
@property (nonatomic,weak)UILabel *time;
@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    JTCalendarMenuView *calendarMenView = [[JTCalendarMenuView alloc]initWithFrame:CGRectMake(0,80,[UIScreen mainScreen].bounds.size.width,40 )];
    
    calendarMenView.backgroundColor = [UIColor redColor];
    
    self.calendarMenuView = calendarMenView;
    
    [self.view addSubview:calendarMenView];
    
    JTHorizontalCalendarView *calendarContentView = [[JTHorizontalCalendarView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.calendarMenuView.frame),[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.width)];
    [self.view addSubview:calendarContentView];
    
    self.calendarContentView = calendarContentView;
    
    self.calendarManager = [[JTCalendarManager alloc]init];
    
    
    [self.calendarManager setMenuView:self.calendarMenuView];
    [self.calendarManager setContentView:self.calendarContentView];
    [self.calendarManager setDate:[NSDate date]];
    
    self.calendarManager.delegate = self;

    
    UILabel *time = [[UILabel alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,80)];
    
    time.backgroundColor = [UIColor blueColor];
    
    time.textColor = [UIColor redColor];
    
    time.font = [UIFont systemFontOfSize:20];
    
    time.textAlignment = NSTextAlignmentCenter;
    
    self.time = time;
    
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    [format setDateFormat:@"yyyy-MM-dd"];
    
    self.time.text =[format stringFromDate:[NSDate date]];
    

    
    [self.view addSubview:time];
    

    
    
    /*设置只显示一个星期的模式
    
    self.calendarManager.settings.weekModeEnabled = YES;
    [self.calendarManager reload];
     
     */
}
//点击dayView
- (void)calendar:(JTCalendarManager *)calendar didTouchDayView:(UIView<JTCalendarDay> *)dayView{
    
    self.dateSelected = dayView.date;
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    [format setDateFormat:@"yyyy-MM-dd"];
    
    self.time.text =[format stringFromDate:self.dateSelected];
    

    
   // self.time.text =[NSString stringWithFormat:@"%@", dayView.date];
    
    // Animation for the circleView
    dayView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1);
    [UIView transitionWithView:dayView
                      duration:.5
                       options:0
                    animations:^{
                        dayView.transform = CGAffineTransformIdentity;
                        [_calendarManager reload];
                    } completion:nil];
    
    // Load the previous or next page if touch a day from another month
    if(![self.calendarManager.dateHelper date:_calendarContentView.date isTheSameMonthThan:dayView.date]){
        if([self.calendarContentView.date compare:dayView.date] == NSOrderedAscending){
            [self.calendarContentView loadNextPageWithAnimation];
        }
        else{
            [self.calendarContentView loadPreviousPageWithAnimation];
        }
    }
    
    
}

//JTCalendar代理方法
- (void)calendar:(JTCalendarManager *)calendar prepareDayView:(UIView<JTCalendarDay> *)dayView{
//    UIView *cir = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
//    cir.center = dayView.center;
//    
//  
//    [dayView addSubview:cir];
//    
    dayView.layer.cornerRadius = 15;
    
    dayView.layer.masksToBounds = YES;
    
    dayView.hidden = NO;
    
    if([dayView isFromAnotherMonth]){
        //隐藏其他月份的日期
        dayView.hidden = YES;
    }
    // Today
    if([self.calendarManager.dateHelper date:[NSDate date] isTheSameDayThan:dayView.date]){
        dayView.hidden = NO;
        
        dayView.backgroundColor = [UIColor blueColor];
      
        dayView.tintColor = [UIColor whiteColor];
    }
   // selected
    
    
    if(self.dateSelected && [_calendarManager.dateHelper date:_dateSelected isTheSameDayThan:dayView.date]){
        dayView.hidden = NO;
        
        [UIView animateWithDuration:2.0 animations:^{
            dayView.backgroundColor = [UIColor redColor];

        } completion:^(BOOL finished) {
             dayView.backgroundColor = [UIColor whiteColor];
        }];
        
         dayView.backgroundColor = [UIColor redColor];
        dayView.tintColor = [UIColor whiteColor];
    }

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.calendarManager reload]; // （必须要在这里调用）Must be call in viewDidAppear
}

- (BOOL)calendarHaveEvent:(JTCalendarManager *)calendar date:(NSDate *)date
{
    return NO;
}

- (void)calendarDidDateSelected:(JTCalendarManager *)calendar date:(NSDate *)date
{
    NSLog(@"%@", date);
}


@end

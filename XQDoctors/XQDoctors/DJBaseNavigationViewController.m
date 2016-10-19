
#import "DJBaseNavigationViewController.h"

@interface DJBaseNavigationViewController ()

@end

@implementation DJBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏栏的背景图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"background"] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航栏的文字外观
    NSDictionary *dict = @{
                           NSFontAttributeName:[UIFont systemFontOfSize:18],
                           NSForegroundColorAttributeName:[UIColor whiteColor]
                           };
    [self.navigationBar setTitleTextAttributes:dict];
    
    //设置按钮颜色
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ViewController.m
//  3DTouchDemo
//
//  Created by 尾灯 on 2018/7/25.
//  Copyright © 2018年 尾灯. All rights reserved.
//

#import "ViewController.h"
#import "PreviewViewController.h"
#import "NavgationViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"ListView";
    [self tableView];
}

#pragma mark -UITableViewDelegate&UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    //判断是否支持3DTouch
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        //cell 注册3DTouch ，sourceView就是需要响应3DTouch的view
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    }
    return cell;
}
#pragma mark -UIViewControllerPreviewingDelegate
//重按时显示的预览页面
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    //预览页面显示导航栏
    PreviewViewController *previewVC = [[PreviewViewController alloc] init];
    NavgationViewController *nav = [[NavgationViewController alloc] initWithRootViewController:previewVC];
    return nav;

    //预览页面不显示导航栏
//    PreviewViewController *previewVC = [[PreviewViewController alloc] init];
//    return previewVC;
}
//继续用力按执行的操作
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    //相当于push操作
    PreviewViewController *previewVC = [[PreviewViewController alloc] init];
    [self showViewController:previewVC sender:self];
}

#pragma mark -lazy
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];

        //注册cell
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  NavgationViewController.m
//  3DTouchDemo
//
//  Created by 尾灯 on 2018/7/25.
//  Copyright © 2018年 尾灯. All rights reserved.
//

#import "NavgationViewController.h"

@interface NavgationViewController ()

@end

@implementation NavgationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//快捷菜单的生成，在需要预览的页面重写该方法
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];

    UIPreviewAction *action0 = [UIPreviewAction actionWithTitle:@"标为未读" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"点击-->标为未读");
    }];
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"免打扰" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"点击-->免打扰");
    }];
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"置顶" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"点击-->置顶");
    }];
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"删除" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"点击-->删除");
    }];
    [items addObjectsFromArray:@[action0,action1,action2,action3]];
    return items;
}


@end

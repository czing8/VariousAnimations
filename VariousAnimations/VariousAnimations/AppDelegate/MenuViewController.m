//
//  MenuViewController.m
//  VariousAnimations
//
//  Created by Vols on 16/3/14.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "MenuViewController.h"

#import "MainViewController.h"
#import "LayerAnimationController.h"
#import "TransAnimationController.h"
#import "ButtonShowController.h"
#import "SegmentShowController.h"

#import "UIViewController+REFrostedViewController.h"

@interface MenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView   * tableView;
@property (nonatomic, strong) NSArray       * menuTitles;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self displayUIs];
}

- (void)initData {
    _menuTitles = @[@"小动画", @"层动画", @"转场动画", @"Button", @"Seguement"];
}


- (void)displayUIs {
    
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

#pragma mark - Properties

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.opaque = NO;
        _tableView.rowHeight = 54;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];
        _tableView.tableHeaderView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 100.0f)];
            /*
             UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
             imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
             imageView.image = [UIImage imageNamed:@"avatar.jpg"];
             imageView.layer.masksToBounds = YES;
             imageView.layer.cornerRadius = 50.0;
             imageView.layer.borderColor = [UIColor whiteColor].CGColor;
             imageView.layer.borderWidth = 3.0f;
             imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
             imageView.layer.shouldRasterize = YES;
             imageView.clipsToBounds = YES;
             
             UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
             label.text = @"Roman Efimov";
             label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
             label.backgroundColor = [UIColor clearColor];
             label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
             [label sizeToFit];
             label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
             
             [view addSubview:imageView];
             [view addSubview:label];
             */
            view;
        });
    }
    return _tableView;
}


#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
            [self displayViewController:[MainViewController class]];
            break;
        case 1:
            [self displayViewController:[LayerAnimationController class]];
            break;
        case 2:
            [self displayStoryboard:@"TransAnimation"];
            break;
        case 3:
            [self displayViewController:[ButtonShowController class]];
            break;
        case 4:
            [self displayViewController:[SegmentShowController class]];
            break;
            
        default:
            break;
    }
    
    
//    [navigationController pushViewController:secondViewController animated:YES];
    [self.frostedViewController hideMenuViewController];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
    return _menuTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    cell.textLabel.text = _menuTitles[indexPath.row];
    
    return cell;
}


#pragma mark - helper

- (void)displayViewController:(Class)class {
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    UIViewController * vc = [[class alloc] init];
    navigationController.viewControllers = @[vc];
}

- (void)displayStoryboard:(NSString *)storyboardName {
    
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController * vc = [storyBoard instantiateInitialViewController];;
    navigationController.viewControllers = @[vc];
}


@end

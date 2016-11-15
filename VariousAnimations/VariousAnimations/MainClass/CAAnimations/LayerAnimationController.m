//
//  LayerAnimationController.m
//  VariousAnimations
//
//  Created by Vols on 16/3/14.
//  Copyright © 2016年 HaierSmart. All rights reserved.
//

#import "LayerAnimationController.h"

#import "FrostedNavigationController.h"

#import "CAPartBViewController.h"
#import "CAPartAViewController.h"
#import "CAShapeViewController.h"

#import "EmitterViewController.h"
#import "DrawIconAnimationController.h"

@interface LayerAnimationController () <UITableViewDelegate, UITableViewDataSource >

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray <NSArray *>* dataSource;

@end

@implementation LayerAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"层动画";
    
    [self initData];
    [self displayUIs];
}

- (void)displayUIs {
    self.view.backgroundColor = [UIColor whiteColor];
    [self addShowMenuButton];
    
    [self.view addSubview:self.tableView];
}


- (void)initData{
    _dataSource = @[@[@"粒子效果", @"绘制Icon"], @[@"Style 1", @"Style 2", @"Style 3", @"Style 4", @"Style 5"]];
}

#pragma mark - Actions

- (void)EmitterAction {
    [self.navigationController pushViewController:[[EmitterViewController alloc] init] animated:YES];
}

- (void)DrawIconAnimation {
    [self.navigationController pushViewController:[[DrawIconAnimationController alloc] init] animated:YES];
}



- (void)basicStyleOne {
    [self.navigationController pushViewController:[self getControllerWithStoryboardName:@"RotateViewController"] animated:YES];
}

- (void)basicStyleTwo {
    [self.navigationController pushViewController:[self getControllerWithStoryboardName:@"PerspectRotateViewController"] animated:YES];
}


- (void)basicStyleThree {
    [self.navigationController pushViewController:[self getControllerWithStoryboardName:@"CubeFlipViewController"] animated:YES];
}


- (void)basicStyleFour {
    [self.navigationController pushViewController:[self getControllerWithStoryboardName:@"CubeFlipPageViewController"] animated:YES];
}


- (void)basicStyleFive {
    [self.navigationController pushViewController:[[CAShapeViewController alloc] init] animated:YES];
}


#pragma mark - Properites
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];

    }
    return _tableView;
}

#pragma mark -


#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex {
    if (sectionIndex == 0)
        return nil;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 34)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 0, 0)];
    label.text = @"基本图层设置";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    [view addSubview:label];
    
    return view;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource[section].count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.textColor = [UIColor colorWithWhite:0.293 alpha:1.000];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = _dataSource[indexPath.section][indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            indexPath.section == 0 ? [self EmitterAction]:[self basicStyleOne];
            break;

        case 1:
            indexPath.section == 0 ? [self DrawIconAnimation]:[self basicStyleTwo];
            break;
            
        case 2:
            indexPath.section == 0 ? :[self basicStyleThree];
            break;
            
        case 3:
            indexPath.section == 0 ? :[self basicStyleFour];
            break;
            
        case 4:
            indexPath.section == 0 ? :[self basicStyleFive];
            break;
            
        default:
            break;
    }
}


#pragma mark - privates
- (id)getControllerWithStoryboardName:(NSString *)boardName{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:boardName bundle:nil];
    id controller = [storyBoard instantiateInitialViewController];
    
    return controller;
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

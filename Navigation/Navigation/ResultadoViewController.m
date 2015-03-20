//
//  ResultadoViewController.m
//  Navigation
//
//  Created by Kaique Damato on 3/20/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "ResultadoViewController.h"
#import "BuscaViewController.h"

@interface ResultadoViewController ()

@end

@implementation ResultadoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(130, 310, 90, 20)];
    label.text = _teste;
    
    UIImage *imagem = [UIImage imageNamed:_teste];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:imagem];
    imageView.frame = CGRectMake(100, 200, 100, 100);
    
    [self.view addSubview:imageView];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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

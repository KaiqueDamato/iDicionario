//
//  BuscaViewController.m
//  Navigation
//
//  Created by Kaique Damato on 3/19/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "BuscaViewController.h"
#import "Dicionario.h"
#import "Letra.h"
#import "ResultadoViewController.h"

@interface BuscaViewController () <UITextFieldDelegate> {
    UIImageView *imageView;
    Dicionario *dicionario;
    UILabel *label;
    BOOL farol;
}

@end

@implementation BuscaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dicionario = [Dicionario sharedInstance];
    farol = YES;
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dicionario"]];
    imageView.frame = CGRectMake(135, 170, 50, 50);
    label = [[UILabel alloc] initWithFrame:CGRectMake(70, 250, 185, 20)];
    label.text = @"Palavra não encontrada";
    label.alpha = 0;
    
    _textFieldBusca = [[UITextField alloc] initWithFrame:CGRectMake(10, 300, 300, 20)];
    _textFieldBusca.placeholder = @"Digite a Palavra";
    _textFieldBusca.backgroundColor = [UIColor whiteColor];
    _textFieldBusca.borderStyle = UITextBorderStyleRoundedRect;
    _textFieldBusca.delegate = self;
    
    [self.view addSubview:imageView];
    [self.view addSubview:_textFieldBusca];
    [self.view addSubview:label];
}

- (void)viewWillAppear:(BOOL)animated {
    label.alpha = 0;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
        for (Letra *letra in dicionario.dicionario) {
            NSString *palavraLetra = [letra.palavra uppercaseString];
            NSString *palavraText = [_textFieldBusca.text uppercaseString];
            if ([palavraLetra isEqualToString:palavraText]) {
                ResultadoViewController *resultadoView = [[ResultadoViewController alloc] init];
                resultadoView.teste = _textFieldBusca.text;
                [self.navigationController pushViewController:resultadoView animated:NO];
            } else {
                [UIView animateWithDuration:0.1
                                      delay:0.0
                                    options:UIViewAnimationOptionCurveEaseOut
                                 animations:^{
                                     imageView.transform = CGAffineTransformMakeTranslation(50, 0);
                                 }
                                 completion:^(BOOL finished) {
                                     [UIView animateWithDuration:0.1
                                                           delay:0.03
                                                         options:UIViewAnimationOptionCurveEaseOut
                                                      animations:^{
                                                          imageView.transform = CGAffineTransformMakeTranslation(-35, 0);
                                                      }
                                                      completion:^(BOOL finished) {
                                                          [UIView animateWithDuration:0.1
                                                                                delay:0.03
                                                                              options:UIViewAnimationOptionCurveEaseOut
                                                                           animations:^{
                                                                               imageView.transform = CGAffineTransformMakeTranslation(15, 0);
                                                                           }
                                                                           completion:^(BOOL finished) {
                                                                               [UIView animateWithDuration:0.1
                                                                                                     delay:0.03
                                                                                                   options:UIViewAnimationOptionCurveEaseOut
                                                                                                animations:^{
                                                                                                    imageView.transform = CGAffineTransformMakeTranslation(-3, 0);
                                                                                                }
                                                                                                completion:^(BOOL finished) {
                                                                                                    [UIView animateWithDuration:0.1
                                                                                                                          delay:0.03
                                                                                                                        options:UIViewAnimationOptionCurveEaseOut
                                                                                                                     animations:^{
                                                                                                                         imageView.transform = CGAffineTransformMakeTranslation(3, 0);
                                                                                                                     } completion:^(BOOL finished) {
                                                                                                                         [UIView animateWithDuration:0.1
                                                                                                                                               delay:0.03
                                                                                                                                             options:UIViewAnimationOptionCurveEaseOut
                                                                                                                                          animations:^{
                                                                                                                                              imageView.transform = CGAffineTransformMakeTranslation(-2, 0);
                                                                                                                                          }
                                                                                                                                          completion:^(BOOL finished) {
                                                                                                                                              [UIView animateWithDuration:0.1
                                                                                                                                                                    delay:0.03
                                                                                                                                                                  options:UIViewAnimationOptionCurveEaseOut
                                                                                                                                                               animations:^{
                                                                                                                                                                   imageView.transform = CGAffineTransformMakeTranslation(2, 0);
                                                                                                                                                    
                                                                                                                                                               }
                                                                                                                                                               completion:^(BOOL finished) {
                                                                                                                                                                   
                                                                                                                                                                   label.alpha = 1;
                                                                                                                                                            
                                                                                                                                                               }];
                                                                                                                                          }];
                                                                                                                     }];
                                                                                                }];
                                                                           }];
                                                      }];
                                 }];
            }
    }
    return YES;
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

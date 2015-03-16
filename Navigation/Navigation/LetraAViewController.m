//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved. --5
//

#import "LetraAViewController.h"
#import "LetraBViewController.h"
#import "Dicionario.h"
#import "Letra.h"

@implementation LetraAViewController{
    BOOL forward;
}


-(void) viewDidLoad {
    [super viewDidLoad];
    _dicionario = [Dicionario sharedInstance];
    forward = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    if (_dicionario.contador == 5) {
        _dicionario.contador = 0;
    }
    Letra *letra = [_dicionario.dicionario objectAtIndex:_dicionario.contador];
    self.title = [[letra.palavra substringToIndex:1] uppercaseString];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"Falar Palavra" forState:UIControlStateNormal];
    botao.frame = CGRectMake(0, 0, 200, 10);
    botao.transform = CGAffineTransformMakeTranslation(65, 400);
    
    UIImage *imagem = [UIImage imageNamed:letra.palavra];
    UIImageView *view = [[UIImageView alloc] initWithImage:imagem];
    view.frame = CGRectMake(0, 0, 100, 100);
    view.center = self.view.center;
    
    [self.view addSubview:botao];
    [self.view addSubview:view];
    
}

-(void)next:(id)sender {
    forward = YES;
    LetraBViewController *proximo = [[LetraBViewController alloc]
                                              initWithNibName:nil
                                            bundle:NULL];
    [self.navigationController pushViewController:proximo
                                         animated:YES];
    
    if (_dicionario.contador == 5) {
        _dicionario.contador = 0;
    } else {
        _dicionario.contador++;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    if (!forward) {
        _dicionario.contador--;
    }
    forward = NO;
}


@end

//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved. --5
//

#import "LetraAViewController.h"
#import "Dicionario.h"
#import "Letra.h"

@implementation LetraAViewController {
    UIImage *imagem;
    UIImageView *imageView;
    UILabel *palavra;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    _dicionario = [Dicionario sharedInstance];
    
    Letra *letra = _dicionario.letraAtual;
    self.title = [[letra.palavra substringToIndex:1] uppercaseString];
    
    imagem = [UIImage imageNamed:letra.palavra];
    imageView = [[UIImageView alloc] initWithImage:imagem];
    imageView.frame = CGRectMake(0, 0, 100, 100);
    imageView.center = self.view.center;
    
    UIBarButtonItem *proximo = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(proximo)];
    self.navigationItem.rightBarButtonItem = proximo;
    
    palavra = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    palavra.text = letra.palavra;
    
    UIBarButtonItem *anterior = [[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(anterior)];
    self.navigationItem.leftBarButtonItem = anterior;
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"Falar Palavra" forState:UIControlStateNormal];
    botao.frame = CGRectMake(0, 0, 200, 10);
    botao.transform = CGAffineTransformMakeTranslation(65, 400);
    
    [self.view addSubview:botao];
    [self.view addSubview:imageView];
    [self.view addSubview:palavra];
}

- (void)updateViewWithModel:(Letra *)letra {
    Letra *letra1 = _dicionario.letraAtual;
    self.title = [[letra1.palavra substringToIndex:1] uppercaseString];
    palavra.text = letra.palavra;
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"Falar Palavra" forState:UIControlStateNormal];
    botao.frame = CGRectMake(0, 0, 200, 10);
    botao.transform = CGAffineTransformMakeTranslation(65, 400);
    
    imagem = [UIImage imageNamed:letra1.palavra];
    imageView.image = imagem;
    imageView.frame = CGRectMake(0, 0, 100, 100);
    imageView.center = self.view.center;
    
    [self.view addSubview:botao];
    [self.view addSubview:imageView];
}

- (void)proximo {
    [self updateViewWithModel:_dicionario.proximo];
}

- (void)anterior {
    [self updateViewWithModel:_dicionario.anterior];
}


@end

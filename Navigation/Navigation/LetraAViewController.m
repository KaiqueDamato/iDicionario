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
    UIBarButtonItem *proximo;
    UIBarButtonItem *anterior;
    BOOL permissao;
    Letra *letra;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    _dicionario = [Dicionario sharedInstance];
    permissao = YES;
    
    if (permissao) {
        proximo = [[UIBarButtonItem alloc]
                   initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(proximo)];
        
        anterior = [[UIBarButtonItem alloc]
                    initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(anterior)];
    }
    
    self.navigationItem.rightBarButtonItem = proximo;
    
    self.navigationItem.leftBarButtonItem = anterior;
    
    letra = _dicionario.letraAtual;
    
    self.navigationItem.title = [[letra.palavra substringToIndex:1] uppercaseString];
    
    imageView = [[UIImageView alloc] initWithImage:_dicionario.letraAtual.imagem];
    imageView.frame = CGRectMake(120, -200, 100, 100);
    
    palavra = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    palavra.text = letra.palavra;
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"Falar Palavra" forState:UIControlStateNormal];
    botao.frame = CGRectMake(65, 400, 200, 10);
    
    [self.view addSubview:botao];
    [self.view addSubview:imageView];
    [self.view addSubview:palavra];
}

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         imageView.transform = CGAffineTransformMakeTranslation(0, self.view.frame.origin.x+450);
                     }
                     completion:nil];
}

- (void)proximo {
    permissao = NO;
    LetraAViewController *viewController = [[LetraAViewController alloc] initWithNibName:nil bundle:nil];
    NSMutableArray *lista = [self.navigationController.viewControllers mutableCopy];
    if ([lista count] > 3) {
        [lista removeObjectAtIndex:0];
        self.navigationController.viewControllers = lista;
    }
    [self.navigationController pushViewController:viewController animated:NO];
    [_dicionario proximo];
    permissao = YES;
}

- (void)anterior {
    permissao = NO;
    [_dicionario anterior];
    LetraAViewController *viewController = [[LetraAViewController alloc] initWithNibName:nil bundle:nil];
    NSMutableArray *lista = [self.navigationController.viewControllers mutableCopy];
    if ([lista count] > 3) {
        [lista addObject:viewController];
        [lista removeLastObject];
        self.navigationController.viewControllers = lista;
    } else {
        [lista insertObject:viewController atIndex:0];
        self.navigationController.viewControllers = lista;
    }
    [self.navigationController popViewControllerAnimated:NO];
    permissao = YES;
}

@end

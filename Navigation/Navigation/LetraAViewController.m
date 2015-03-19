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
    BOOL permissao, toque;
    Letra *letra;
    UITextField *textField;
    float deltaX, deltaY;
    CGRect myFrame;
    UITouch *aTouch;
    CGPoint touchLocation;
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
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, 40)];
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 220, 20)];
    textField.placeholder = @"Digite a Palavra";
    textField.backgroundColor = [UIColor whiteColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    UIBarButtonItem *textItemView = [[UIBarButtonItem alloc] initWithCustomView:textField];
    UIBarButtonItem *botaoItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(botaoSalvar)];
    [toolbar setItems:@[textItemView, botaoItem]];
    
    
    self.navigationItem.rightBarButtonItem = proximo;
    
    self.navigationItem.leftBarButtonItem = anterior;
    
    letra = _dicionario.letraAtual;
    
    self.navigationItem.title = [[letra.palavra substringToIndex:1] uppercaseString];
    
    NSString *bundle = [[NSBundle mainBundle] pathForResource:letra.palavra ofType:@"png"];
    imagem = [UIImage imageWithContentsOfFile:bundle];
    imageView = [[UIImageView alloc] initWithImage:imagem];
    imageView.frame = CGRectMake(120, -200, 100, 100);
    [imageView setUserInteractionEnabled:YES];
    
    palavra = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    palavra.text = letra.palavra;
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"Falar Palavra" forState:UIControlStateNormal];
    botao.frame = CGRectMake(65, 400, 200, 10);
    
    [self.view addSubview:botao];
    [self.view addSubview:imageView];
    [self.view addSubview:palavra];
    [self.view addSubview:toolbar];
}

- (void)botaoSalvar {
    palavra.text = textField.text;
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    aTouch = [touches anyObject];
    touchLocation = [aTouch locationInView:imageView];
    toque = NO;
    
    if ([aTouch view] == imageView) {
        toque = YES;
        [UIView animateWithDuration:0.5 animations:^{
            imageView.frame = CGRectMake(self.view.center.x-100, self.view.center.y-90, 200, 200);
        }];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    imageView.frame = CGRectMake(self.view.center.x-50, self.view.center.y-40, 100, 100);
    
    CGPoint loc = [aTouch locationInView:imageView];
    CGPoint prevloc = touchLocation;
    
    if (toque) {
        myFrame = imageView.frame;
        deltaX = loc.x - prevloc.x;
        deltaY = loc.y - prevloc.y;
        myFrame.origin.x += deltaX;
        myFrame.origin.y += deltaY;
        [imageView setFrame:myFrame];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
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

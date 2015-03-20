//
//  ListaTableViewController.m
//  Navigation
//
//  Created by Kaique Damato on 3/18/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "ListaTableViewController.h"
#import "Dicionario.h"
#import "Letra.h"

@interface ListaTableViewController () {
    Dicionario *dicionario;
    Letra *letra;
}

@end

@implementation ListaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dicionario = [Dicionario sharedInstance];
    self.tableView.contentInset = UIEdgeInsetsMake(15, 0, 49, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dicionario.dicionario count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celula"];

    NSRange range;
    range.length = 1;
    range.location = 0;
    
    letra = dicionario.dicionario[indexPath.row];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 40, 40)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 15, 90, 20)];
    
    NSString *letraModificada = [[letra.palavra substringToIndex:1] uppercaseString];
    NSString *palavraModificada = [letra.palavra stringByReplacingCharactersInRange:range withString:letraModificada];
    NSMutableAttributedString *palavraFinal = [[NSMutableAttributedString alloc] initWithString:palavraModificada];
    
    [palavraFinal addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    
    NSString *bundle = [[NSBundle mainBundle] pathForResource:letra.palavra ofType:@"png"];
    image.image = [UIImage imageWithContentsOfFile:bundle];
    
    label.attributedText = palavraFinal;
    
    [cell addSubview:image];
    [cell addSubview:label];
    
    return cell;
}

@end

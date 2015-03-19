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
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [dicionario.dicionario count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celula"];
    
    letra = dicionario.dicionario[indexPath.row];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 40, 40)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 15, 90, 20)];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(70, 15, 90, 20)];
    NSString *bundle = [[NSBundle mainBundle] pathForResource:letra.palavra ofType:@"png"];
    image.image = [UIImage imageWithContentsOfFile:bundle];
    label.text = letra.palavra;
    label1.text = [[letra.palavra substringToIndex:1] uppercaseString];
    label1.textColor = [UIColor redColor];
    [cell addSubview:image];
    [cell addSubview:label];
    [cell addSubview:label1];
    cell.detailTextLabel.text = [letra.palavra substringToIndex:1];
    
    return cell;
}

@end

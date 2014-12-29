//
//  SqliteLib.m
//  database
//
//  Created by digicorp on 15/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SqliteLib.h"
static sqlite3 *database;

@implementation SqliteLib

#pragma mark -
#pragma mark open and close DB 
+(void)closeDB
{
	sqlite3_close(database);
	//NSLog(@"close successfully");
}

+(BOOL)OpenDB{
	BOOL open = FALSE;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *temppath = [documentsDirectory stringByAppendingPathComponent:kFilename];
	NSFileManager *databasefile = [NSFileManager defaultManager];
	if(![databasefile fileExistsAtPath:temppath])
		[databasefile copyItemAtPath:[[NSBundle mainBundle]pathForResource:@"BookMovie" ofType:@"sqlite"] toPath:temppath error:nil];
	//[databasefile release];
	if(sqlite3_open([temppath UTF8String], &database)!= SQLITE_OK)
	{	sqlite3_close(database);
	}else{
		open = TRUE;
        NSLog(@"Database opened");
	}
	return open;
}

#pragma mark -
#pragma mark Create table in database
+(BOOL)CreateDB:(NSString *)TableName FieldsInTable:(NSDictionary *)Fieldsname
{
	
	BOOL create = FALSE;
	if([SqliteLib OpenDB])
	{
		char *errmsg;
		NSMutableString *query =[[NSMutableString alloc]init];
		NSEnumerator *enumerator = [Fieldsname keyEnumerator];
		id key;
		while ((key = [enumerator nextObject])) {
			
			if([query length]==0)
			{	[query appendString:key];
				[query appendString:@" "];
				[query appendString:[Fieldsname objectForKey:key]];
			}else{	
				[query appendString:@","];
				[query appendString:key];
				[query appendString:@" "];
				[query appendString:[Fieldsname objectForKey:key]];
			}
		}
		//NSLog(@"query==%@",query);
		NSString *createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@);",TableName,query];
		//NSLog(@"create==%@",createQuery);
		//[query release];
		//NSString *createSql = @"CREATE TABLE IF NOT EXISTS UNITDET (PHOTOFLOOR BLOB,BLG_NAME TEXT,UNIT_NO TEXT,FLOOR_NO TEXT,REMARK TEXT);";
		if(sqlite3_exec(database, [createQuery UTF8String],NULL,NULL,&errmsg) != SQLITE_OK)
		{sqlite3_close(database);
		}else{NSLog(@"Created successfully");
			create = TRUE;}
	}
	else {
		NSLog(@"failed to open database");
	}
	return create;
}

#pragma mark -
#pragma mark  Simple operations

+(BOOL)InsertRow:(NSString *)TableName ValueToInsert:(NSDictionary *)valueData
{
	BOOL Insert = FALSE;
	@try {
		if([SqliteLib OpenDB])
		{		
			NSMutableString *query = [[NSMutableString alloc]init];
			NSMutableString *questioStr= [[NSMutableString alloc]init];
			NSEnumerator *enumerator = [valueData keyEnumerator];
			id key;
			while ((key = [enumerator nextObject])) {
				if([query length] == 0)
				{
					[query appendString:key];
					[questioStr appendString:@"?"];
				}else{
					[query appendString:@","];
					[query appendString:key];
					[questioStr appendString:@","];
					[questioStr appendString:@"?"];
				}
			}
			NSLog(@"query==%@",query);
			NSString *insertQuery = [NSString stringWithFormat:@"INSERT OR REPLACE INTO %@ (%@) VALUES (%@);",TableName,query,questioStr];
			NSLog(@"Insert==%@",insertQuery);
			sqlite3_stmt *insertStatemant = nil;
			if(sqlite3_prepare_v2(database, [insertQuery UTF8String], -1, &insertStatemant, NULL) == SQLITE_OK)
			{	
				int i=1;
				NSEnumerator *enumerator = [valueData keyEnumerator];
				while ((key = [enumerator nextObject]))
				{
					NSLog(@"%@",[valueData objectForKey:key]);
					if ([valueData objectForKey:key]) {
						if([[valueData objectForKey:key] isKindOfClass:[UIImage class]]){
							NSData *imagedata = UIImagePNGRepresentation([valueData objectForKey:key]);
							sqlite3_bind_blob(insertStatemant, i, [imagedata bytes],[imagedata length],NULL);
						}else if([[valueData objectForKey:key] isKindOfClass:[NSNumber class]]){
							sqlite3_bind_double(insertStatemant, i, [[valueData objectForKey:key]doubleValue]);
						}else
							sqlite3_bind_text(insertStatemant,i,[[valueData objectForKey:key] UTF8String],-1,SQLITE_TRANSIENT);
						i++;
					}
				}
				if(SQLITE_DONE == sqlite3_step(insertStatemant))
				{Insert = TRUE;}
				sqlite3_finalize(insertStatemant);
				[SqliteLib closeDB];
			}
			//[query release];
			//[questioStr release];
		}
	}@catch (NSException * e) {
		NSLog(@"insert row %@",e);
	}
	return Insert;
}

+(void)MultipleRowInertion:(NSString *)TableName ValueToInsert:(NSArray *)values{
	NSLog(@"START ********* %@ %d items",TableName,values.count);
	sqlite3_stmt *compiledStmt;
	sqlite3_prepare_v2(database, "BEGIN TRANSACTION", -1, &compiledStmt, NULL);
	sqlite3_step(compiledStmt);
	sqlite3_finalize(compiledStmt);	
	NSMutableString *query = [[NSMutableString alloc]init];
	NSMutableString *questioStr= [[NSMutableString alloc]init];
	for (NSString *a in [SqliteLib ColoumnInTables:TableName]) {
		if([query length] == 0)
		{
			[query appendString:a];
			[questioStr appendString:@"?"];
		}else{
			[query appendString:@","];
			[query appendString:a];
			[questioStr appendString:@","];
			[questioStr appendString:@"?"];
		}
	}
	NSString *insertQuery = [NSString stringWithFormat:@"INSERT OR REPLACE INTO %@ (%@) VALUES (%@);",TableName,query,questioStr];
	NSLog(@"Insert==%@",insertQuery);
	
	if (sqlite3_prepare_v2(database, [insertQuery UTF8String], -1, &compiledStmt, NULL)== SQLITE_OK) {
		for (NSDictionary *valueData in values) {
			//NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
			int i=1;
			for (NSString *a in [SqliteLib ColoumnInTables:TableName]) {
				if ([valueData objectForKey:a]) {
					if([[valueData objectForKey:a] isKindOfClass:[UIImage class]]){
						NSData *imagedata = UIImagePNGRepresentation([valueData objectForKey:a]);
						sqlite3_bind_blob(compiledStmt, i, [imagedata bytes],[imagedata length],NULL);
					}else if([[valueData objectForKey:a] isKindOfClass:[NSNumber class]]){
						sqlite3_bind_double(compiledStmt, i, [[valueData objectForKey:a]doubleValue]);
					}else
						sqlite3_bind_text(compiledStmt,i,[[valueData objectForKey:a] UTF8String],-1,SQLITE_TRANSIENT);
				}else sqlite3_bind_null(compiledStmt, i);
				i++;
				
			}
			NSUInteger err = sqlite3_step(compiledStmt);
			if (err != SQLITE_DONE)
				NSLog(@"replace error %d %s",err, sqlite3_errmsg(database));
			sqlite3_reset(compiledStmt);
			
		}
		sqlite3_finalize(compiledStmt);		
	}
	sqlite3_prepare_v2(database, "END TRANSACTION", -1, &compiledStmt, NULL);
	sqlite3_step(compiledStmt);
	sqlite3_finalize(compiledStmt);	
}

+(BOOL)updateRow:(NSString *)TableName updatedField:(NSDictionary *)fieldToUpdate updateFrom:(NSString*)fieldFromUpdate{
	
	BOOL Update = FALSE;
	if([SqliteLib OpenDB])
	{
		NSMutableString *Fieldsto = [[NSMutableString alloc]init];
		NSEnumerator *enumerator = [fieldToUpdate keyEnumerator];
		id key;
		while ((key = [enumerator nextObject])) {
			
			if([Fieldsto length] == 0)
			{
				[Fieldsto appendString:key];
				[Fieldsto appendString:@" = "];
				[Fieldsto appendString:@"'"];
				[Fieldsto appendFormat:@"%@",[fieldToUpdate objectForKey:key]];
				[Fieldsto appendString:@"'"];
			}else{
				[Fieldsto appendString:@","];
				[Fieldsto appendString:key];
				[Fieldsto appendString:@" = "];
				[Fieldsto appendString:@"'"];
				[Fieldsto appendFormat:@"%@",[fieldToUpdate objectForKey:key]];
				[Fieldsto appendString:@"'"];
			}
			NSLog(@"updateQuery==%@",Fieldsto);
		}
		//NSString *UpdateQuery = [NSString stringWithFormat:@"UPDATE %@ SET %@ WHERE %@;",TableName,Fieldsto,FieldsFrom];
		NSString *UpdateQuery =[NSString stringWithFormat:@"UPDATE %@ SET %@ WHERE %@;",TableName,Fieldsto,fieldFromUpdate];
		NSLog(@"UpdateQuery=%@",UpdateQuery);
		sqlite3_stmt *updateStmt = nil;
		if(sqlite3_prepare_v2(database,[UpdateQuery UTF8String], -1, &updateStmt, NULL) != SQLITE_OK)
			NSLog(@"Error while creating update statement");
		else
		{
			int success = sqlite3_step(updateStmt);
			if(success == SQLITE_DONE)
			{
				NSLog(@"update database");
				//Update = TRUE;
			}
			Update = TRUE;
			sqlite3_reset(updateStmt);
		}
		[SqliteLib closeDB];
		//[Fieldsto release];
		//[FieldsFrom release];
	}
	return Update;
}

+(BOOL)DeleteRow:(NSString *)TableName ColumnNameAndValuetoDelete:(NSDictionary *)columndata{
	BOOL DeleteRow = FALSE;
	if([SqliteLib OpenDB]){
		NSMutableString *query = nil;
		NSEnumerator *enumerator = [columndata keyEnumerator];
		id key;
		while ((key = [enumerator nextObject])) {
			query = [NSMutableString stringWithFormat:@"%@",key];
			[query appendFormat:@"="];
			[query appendString:[columndata valueForKey:key]];
		}
		NSLog(@"query  %@",query);
		NSString *DeleteQuery =[NSString stringWithFormat:@"Delete From %@ WHERE %@;",TableName,query];
		NSLog(@"UpdateQuery=%@",DeleteQuery);
		sqlite3_stmt *deleteStmt = nil;
		if(sqlite3_prepare_v2(database,[DeleteQuery UTF8String], -1, &deleteStmt,NULL) != SQLITE_OK)
			NSLog(@"Error while creating delete sttement");
		else
		{
			int success = sqlite3_step(deleteStmt);
			if(success != SQLITE_DONE)
			{NSLog(@"delete row");
				DeleteRow = TRUE;}
			sqlite3_reset(deleteStmt);
			
		}
		[SqliteLib closeDB];
	}
	return DeleteRow;
}

+(BOOL)AlterTable:(NSString *)TableName ColumnNameAndDataType:(NSDictionary *)columndata Action:(NSString*)actionstr
{
	BOOL alter = FALSE;
	if([SqliteLib OpenDB]){
		NSMutableString *query= nil;
		NSEnumerator *enumerator = [columndata keyEnumerator];
		id key;
		while ((key = [enumerator nextObject])) {
			if([actionstr isEqualToString:@"add"]){
				query = [NSMutableString stringWithFormat:@"%@",key];
				[query appendFormat:@" "];
				[query appendString:[columndata valueForKey:key]];
			}else if([actionstr isEqualToString:@"drop"]){
				query = [NSMutableString stringWithFormat:@"column %@",key];
			}
		}
		NSLog(@"query  %@",query);
		NSString *AlterQuery =[NSString stringWithFormat:@"ALTER TABLE %@ %@ %@;",TableName,actionstr,query];
		NSLog(@"AlterQuery=%@",AlterQuery);
		sqlite3_stmt *alterStmt = nil;
		if(sqlite3_prepare_v2(database,[AlterQuery UTF8String], -1, &alterStmt,NULL) != SQLITE_OK)
			NSLog(@"Error while creating alter statement");
		else
		{
			int success = sqlite3_step(alterStmt);
			if(success != SQLITE_DONE)
			{	
				NSLog(@"alter table");
				alter = TRUE;
			}
			sqlite3_reset(alterStmt);
		}
		[SqliteLib closeDB];
	}
	return alter;
}
+(void)DropDB:(NSString *)TableName
{
	NSString *dropQuery = [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@;",TableName];
	char *errmsg;
	if([SqliteLib OpenDB])
	{
		if(sqlite3_exec(database, [dropQuery UTF8String],NULL,NULL,&errmsg) != SQLITE_OK)
		{
			sqlite3_close(database);
			NSLog(@"Not dropped");
		}
		else {
			NSLog(@"Db dropped");
		}
	}
}

#pragma mark -
#pragma mark get data form TABLE
+(NSArray *)SelectData:(NSString *)TableName values:(NSArray *)selectValues
{
	NSMutableArray *recordAry = nil;
	NSString *selectQuery=nil;
	if([SqliteLib OpenDB])
	{
		if(selectValues == nil)
		{
			selectQuery = [NSString stringWithFormat:@"SELECT * FROM %@;",TableName];
		}else{
			NSMutableString *FieldsOfTable = [[NSMutableString alloc]init];
			for (NSString *s in selectValues) {
				if([FieldsOfTable length] == 0)
				{
					[FieldsOfTable appendString:s];
				}else{					
					[FieldsOfTable appendString:@","];
					[FieldsOfTable appendString:s];
				}
			}
			selectQuery = [NSString stringWithFormat:@"SELECT %@ FROM %@;",FieldsOfTable,TableName];
			//[FieldsOfTable release];
		}
		//NSLog(@"select == %@",selectQuery);
		sqlite3_stmt *selectStmt = nil;
		if (sqlite3_prepare_v2( database, [selectQuery UTF8String], -1, &selectStmt, nil) == SQLITE_OK) 
		{
			recordAry = [[NSMutableArray alloc]init];
			while (sqlite3_step(selectStmt) == SQLITE_ROW) 
			{
				
				NSMutableDictionary *tempDict = [[NSMutableDictionary alloc]init];
				for(int i=0;i<sqlite3_column_count(selectStmt);i++)
				{
					if (![[NSString stringWithFormat:@"%s", sqlite3_column_text(selectStmt,i)] isEqualToString:@"(null)"]) {
						[tempDict setValue:[NSString stringWithFormat:@"%s", sqlite3_column_text(selectStmt,i)] forKey:[NSString stringWithFormat:@"%s", sqlite3_column_name(selectStmt, i)]];
					}
				}
				if ([tempDict count]>0)[recordAry addObject:tempDict];
				//[tempDict release];
			}
		}
	}
	[SqliteLib closeDB];
	return recordAry;
}
+(int)CountQuery:(NSString *)query{
	
	int count;
	
	NSLog(@"count query ==== %@",query);
	if ([SqliteLib OpenDB]) {
		sqlite3_stmt *countStmt = nil;
		if( sqlite3_prepare_v2(database, [query UTF8String], -1, &countStmt, nil) == SQLITE_OK)
		{
			count = 0;
			while (sqlite3_step(countStmt) == SQLITE_ROW) 
			{
				count = count +1;			}
		}
	}
	[SqliteLib closeDB];
   	return count;
}

+(NSArray *)SelectDataWithContdition:(NSString *)TableName values:(NSArray *)selectValues Conditions:(NSString*)Con{
	NSMutableArray *recordAry = nil;
	NSString *selectQuery=nil;
	if([SqliteLib OpenDB])
	{
		if(selectValues == nil)
		{
			selectQuery = [NSString stringWithFormat:@"SELECT * FROM %@ where %@;",TableName,Con];
		}else{
			NSMutableString *FieldsOfTable = [[NSMutableString alloc]init];
			for (NSString *s in selectValues) {
				if([FieldsOfTable length] == 0)
				{
					[FieldsOfTable appendString:s];
				}else{					
					[FieldsOfTable appendString:@","];
					[FieldsOfTable appendString:s];
				}
			}
			selectQuery = [NSString stringWithFormat:@"SELECT %@ FROM %@ where %@;",FieldsOfTable,TableName,Con];
			//[FieldsOfTable release];
		}
		NSLog(@"select == %@",selectQuery);
		sqlite3_stmt *selectStmt = nil;
		if (sqlite3_prepare_v2( database, [selectQuery UTF8String], -1, &selectStmt, nil) == SQLITE_OK) 
		{
			recordAry = [[NSMutableArray alloc]init] ;
			while (sqlite3_step(selectStmt) == SQLITE_ROW) 
			{
				
				NSMutableDictionary *tempDict = [[NSMutableDictionary alloc]init];
				for(int i=0;i<sqlite3_column_count(selectStmt);i++)
				{
					if (![[NSString stringWithFormat:@"%s", sqlite3_column_text(selectStmt,i)] isEqualToString:@"(null)"]) 
						[tempDict setValue:[NSString stringWithFormat:@"%s", sqlite3_column_text(selectStmt,i)] forKey:[NSString stringWithFormat:@"%s", sqlite3_column_name(selectStmt, i)]];
				}
				if ([tempDict count]>0)[recordAry addObject:tempDict];
				//[tempDict release];
			}
		}
	}
	[SqliteLib closeDB];
	return recordAry;
}

+(NSMutableArray *)CustomeQuery:(NSString*)query{
	NSMutableArray *recordAry = nil;
	
	NSLog(@"the query is %@",query);
	if([SqliteLib OpenDB])
	{		
		sqlite3_stmt *selectStmt = nil;
		if (sqlite3_prepare_v2( database, [query UTF8String], -1, &selectStmt, nil) == SQLITE_OK) 
		{
			recordAry = [[NSMutableArray alloc]init] ;
			while (sqlite3_step(selectStmt) == SQLITE_ROW) 
			{
			
				NSMutableDictionary *tempDict = [[NSMutableDictionary alloc]init];
				for(int i=0;i<sqlite3_column_count(selectStmt);i++)
				{
					if (![[NSString stringWithFormat:@"%s", sqlite3_column_text(selectStmt,i)] isEqualToString:@"(null)"]) 
					[tempDict setValue:[NSString stringWithFormat:@"%s", sqlite3_column_text(selectStmt,i)] forKey:[NSString stringWithFormat:@"%s", sqlite3_column_name(selectStmt, i)]];
				}
				if ([tempDict count]>0)[recordAry addObject:tempDict];
				//[tempDict release];
			}
		}
	}
	[SqliteLib closeDB];
	return recordAry;
}

+(NSArray*)SelectDistinctData:(NSString *)TableName ColoumnName:(NSString*)ColName{
	NSString *query = [NSString stringWithFormat:@"SELECT DISTINCT %@  FROM %@",ColName,TableName];
	NSMutableArray *recordAry = nil;
	if([SqliteLib OpenDB])
	{		
		sqlite3_stmt *selectStmt = nil;
		if (sqlite3_prepare_v2( database, [query UTF8String], -1, &selectStmt, nil) == SQLITE_OK) 
		{
			recordAry = [[NSMutableArray alloc]init] ;
			while (sqlite3_step(selectStmt) == SQLITE_ROW) 
			{
				
				NSMutableDictionary *tempDict = [[NSMutableDictionary alloc]init];
				for(int i=0;i<sqlite3_column_count(selectStmt);i++)
				{
					if (![[NSString stringWithFormat:@"%s", sqlite3_column_text(selectStmt,i)] isEqualToString:@"(null)"]) 
					[tempDict setValue:[NSString stringWithFormat:@"%s", sqlite3_column_text(selectStmt,i)] forKey:[NSString stringWithFormat:@"%s", sqlite3_column_name(selectStmt, i)]];
				}
				if ([tempDict count]>0)[recordAry addObject:tempDict];
				//[tempDict release];
			}
		}
	}
	[SqliteLib closeDB];
	return recordAry;
}

+(NSArray *)SelectDataOrderBy:(NSString *)TableName ColumnName:(NSArray *)ColName isDESC:(BOOL)isDesc OrderByColName:(NSString*)Coloumn{
	NSMutableArray *recordAry = nil;
	NSString *selectQuery=nil;
	NSString *v;
	if (isDesc)v= @"DESC";
		else  v =@"ASC";
	
	if([SqliteLib OpenDB])
	{
		if(ColName == nil)
		{
			selectQuery = [NSString stringWithFormat:@"SELECT * FROM %@ ORDER BY %@ %@;",TableName,Coloumn,v];
		}else{
			NSMutableString *FieldsOfTable = [[NSMutableString alloc]init];
			for (NSString *s in ColName) {
				if([FieldsOfTable length] == 0)
				{
					[FieldsOfTable appendString:s];
				}else{					
					[FieldsOfTable appendString:@","];
					[FieldsOfTable appendString:s];
				}
			}
			selectQuery = [NSString stringWithFormat:@"SELECT %@ FROM %@ ORDER BY %@ %@;",FieldsOfTable,TableName,v];
			//[FieldsOfTable release];
		}
		//NSLog(@"select == %@",selectQuery);
		sqlite3_stmt *selectStmt = nil;
		if (sqlite3_prepare_v2( database, [selectQuery UTF8String], -1, &selectStmt, nil) == SQLITE_OK) 
		{
			recordAry = [[NSMutableArray alloc]init] ;
			while (sqlite3_step(selectStmt) == SQLITE_ROW) 
			{
				
				NSMutableDictionary *tempDict = [[NSMutableDictionary alloc]init];
				for(int i=0;i<sqlite3_column_count(selectStmt);i++)
				{
					if (![[NSString stringWithFormat:@"%s", sqlite3_column_text(selectStmt,i)] isEqualToString:@"(null)"]) 
						[tempDict setValue:[NSString stringWithFormat:@"%s", sqlite3_column_text(selectStmt,i)] forKey:[NSString stringWithFormat:@"%s", sqlite3_column_name(selectStmt, i)]];
				}
				if ([tempDict count]>0)[recordAry addObject:tempDict];
				//[tempDict release];
			}
		}
	}
	[SqliteLib closeDB];
	return recordAry;
}

+(NSArray*)ColoumnInTables:(NSString*)tablename{
	NSArray *a = nil;
	if ([tablename isEqualToString:@"AuditHeader"]) {
		//Arpan Change needed
		a = [NSArray arrayWithObjects:@"pk_AuditId",@"AuditName",@"Country_Code",@"Franchise_Code",@"fk_UserId",@"DateCreated",@"PriceperKW",@"PriceGroup",@"Contact",@"PhoneNo",@"CompanyName",@"Address1",@"Address2",@"PostCode",@"EMail",@"AuditPhoto",@"image",@"Status",@"City",nil];
	}else if ([tablename isEqualToString:@"AuditLine"]) {
		a = [NSArray arrayWithObjects:@"pk_LightId",@"fk_RoomId",@"ExistingCode",@"ReplacementSKU",@"Quantity",@"fk_AuditId",@"Status",nil];
	}if ([tablename isEqualToString:@"AuditRoom"]) {
		a = [NSArray arrayWithObjects:@"pk_RoomId",@"fk_AuditId",@"Description",@"HoursperDay",@"DaysperWeek",@"Status",nil];
	}if ([tablename isEqualToString:@"Brochure"]) {
		a = [NSArray arrayWithObjects:@"BrochureCode",@"Description",nil];
	}if ([tablename isEqualToString:@"Closure"]) {
		a = [NSArray arrayWithObjects:@"ClosureCode",@"Description",nil];
	}if ([tablename isEqualToString:@"Country"]) {
		a = [NSArray arrayWithObjects:@"CountryCode",@"Description",nil];
	}if ([tablename isEqualToString:@"Currency"]) {
		a = [NSArray arrayWithObjects:@"CurrencyCode",@"Description",nil];
	}if ([tablename isEqualToString:@"Language"]) {
		a = [NSArray arrayWithObjects:@"LanguageCode",@"Description",nil];
	}if ([tablename isEqualToString:@"Franchise_Area"]) {
		a = [NSArray arrayWithObjects:@"CountryCode",@"FranchiseCode",@"Description",nil];
	}if ([tablename isEqualToString:@"Existing_Lamp"]) {
		a = [NSArray arrayWithObjects:@"ExistingLampCode",@"Description",@"Wattage",@"Lifespan",nil];
	}if ([tablename isEqualToString:@"Existing_Lamp_Price"]) {
		a = [NSArray arrayWithObjects:@"ExistingLampCode",@"CurrencyCode",@"UnitPrice",nil];
	}if ([tablename isEqualToString:@"UserCountryPermission"]) {
		a = [NSArray arrayWithObjects:@"CountryCode",@"FranchiseCode",@"Per_Active",@"Per_Create",@"Per_View",@"Per_Edit",nil];
	}if ([tablename isEqualToString:@"PriceGroupCategory"]) {
		a = [NSArray arrayWithObjects:@"Currency_Code",@"Price_Group",nil];
	}if ([tablename isEqualToString:@"Existing_Lamp_Replacement"]) {
		a = [NSArray arrayWithObjects:@"CountryCode",@"SKUCode",@"DefaultVal",@"ExistingLampCode",nil];
	}if ([tablename isEqualToString:@"SKU"]) {
		a = [NSArray arrayWithObjects:@"SKUCode",@"Base",@"LampType",@"Size",@"Dimmable",@"ColorTemperature",@"Lumens",@"BeamAngle",@"Measurement",@"Wattage",@"Lifespan",@"WattageText",nil];
	}if ([tablename isEqualToString:@"SKU_Brochure"]) {
		a = [NSArray arrayWithObjects:@"SKUCode",@"BrochureCode",@"PageNumber",nil];
	}if ([tablename isEqualToString:@"SKU_Description"]) {
		a = [NSArray arrayWithObjects:@"SKUCode",@"LanguageCode",@"Description",nil];
	}if ([tablename isEqualToString:@"SKU_Price"]) {
		a = [NSArray arrayWithObjects:@"SKUCode",@"CurrencyCode",@"PriceGroup",@"UnitPrice",nil];
	}if ([tablename isEqualToString:@"SKU_Stock"]) {
		a = [NSArray arrayWithObjects:@"SKUCode",@"CountryCode",@"Stock",@"MonthAverage",@"BackOrderQuantity",@"ScheduledToBeDropped",@"NextStock",nil];
	}
	return a;
}
@end

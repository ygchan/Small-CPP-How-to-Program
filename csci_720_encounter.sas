/* ------------------------------------------------------------------------- */
/* #1. Create a macro variable */
%let name = George;
%let age = 30;

/* ------------------------------------------------------------------------- */
/* #2. How to print a message and use the variable */
%put &name is &age years old.;

/* ------------------------------------------------------------------------- */
/* #3. How to separate data into two sets? */
data male_student female_student;
	set sashelp.class;
	if sex = 'M' then output male_student;
	else if sex = 'F' then output female_student;
run;

proc sql;
	create table male_student as
	select *
	from sashelp.class
	where sex = 'M';
	
	create table female_student as 
	select *
	from sashelp.class
	where sex = 'M'
;
quit;

/* ------------------------------------------------------------------------- */
/* #4. How to create a table (dataset)? */
data claims;
	input id $13. DX $10.;
datalines;
0000000000001 R14.0
0000000000002 M12.9
0000000000003 I25.10
0000000000004 D12.6
0000000000005 M54.2
; run;

proc sql;
	create table claims (
		id varchar(13), 
		dx varchar(10)  
	);
	
	insert into claims(id, dx) values('0000000000001', 'R14.0');
	insert into claims(id, dx) values('0000000000002', 'M12.9');
	insert into claims(id, dx) values('0000000000003', 'R14.0');
	insert into claims(id, dx) values('0000000000004', 'I25.10');
	insert into claims(id, dx) values('0000000000005', 'M54.2');
quit; 

/* ------------------------------------------------------------------------- */
/* #4. How to remove a period (substring) in a column? */
data claims;
	set claims;
	dx = compress(dx, '', 'p');
run;

proc sql;
	create table claims_without as
	select id, replace(dx, '.', '')
	from claims;
quit; 

/* ------------------------------------------------------------------------- */
/* #5. How to convert string to number (123456)      -- col_1?
					  string to number (123,456)     -- col_2? 
                      string to date   ('01JAN2019') -- col_3?
                      number to string (123456)      -- col_4? */
/* https://blogs.sas.com/content/sgf/2015/05/01/converting-variable-types-do-i-use-put-or-input/ */
data example;
	input col_1 $ col_2 $ col_3 $ col_4;
datalines;
123456
123,456
01JAN19
123456
;
run;

data converted;
	set example;
	new_col1 = input(col_1, 6.);      /* Convert string to number */
	new_col2 = input(col_2, comma7.); /* Convert the comma string to number */
	new_col3 = input(col_3, date7.);  /* Convert the date from string to text */
	new_col4 = put(col_4, 6.);       /* Convert the number into string */
	drop col_1 col_2 col_3 col_4;
	format new_col3 mmddyy10.;
run;

/* ------------------------------------------------------------------------- */
/* #6. How to delete all the tables in a given directory (library)? */
proc datasets library=work kill nolist;
run;

/* ------------------------------------------------------------------------- */
/* #7. How to create a macro (function) in SAS? */
%macro Print(Name);
	%put Hello &Name.;
%mend;

/* Inovke the macro here */
%print(George);

/* ------------------------------------------------------------------------- */
/* #8. What is the difference between Trim, Strip, Compress? */
/* Trim - remove trailing spaces */
/* Strip - remove leading and trailing spaces */
/* Compress - when used without arugment, remove all spaces */

/* ------------------------------------------------------------------------- */
/* #9. How to keep only one blank when there are extra? */
data _null_;
	string = 'This      is a random      message.';
	clean_string = compbl(string);
	/* This is a random message. */
	put clean_string;
run;

/* ------------------------------------------------------------------------- */
/* #10. How to import / export excel spreadsheet? */
proc import 
	datafile = "/path/file.xlsx"
	out = dataset_name
	dbms = 'xlsx'
	replace;
quit;

proc export 
	outfile = "/path/file.xlsx"
	data = dataset_name
	dbms = 'xlsx'
	replace;
	sheet = 'work_sheet_name';
quit;

/* ------------------------------------------------------------------------- */
/* #11. How to sort a dataset */
proc sort 
	data = sashelp.class
	out = work.class_sorted;
	by name;
run;

proc sql;
	create table work.class_sorted as 
	select *
	from sashelp.class
	order by name;
quit;

/* ------------------------------------------------------------------------- */
/* #12. How to add row number */


/* ------------------------------------------------------------------------- */
/* #12. How to concat strings? */

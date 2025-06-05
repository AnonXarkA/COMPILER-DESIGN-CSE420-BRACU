%option noyywrap

%{
#include<bits/stdc++.h>
using namespace std;

ofstream yyoutlog; //output filestream for log file

string loglist = ""; //list of tokens along with line numbers

// define necessary c++ variables and functions here (if any)
int lines=1; //to keep track of line numbers

void to_string(){
	return ;
}

%}

/* Regular Definitions */

delim [ \t\n]

/* write regular expressions for whitespace and newline */

ws [ \t]
newline \n

def "def"

if	"if"

lparen "("

rparen ")"

colon ":"

for "for"

in "in"

range "range"

print "print"

assignop "="

relop "<"|">"|"=="

else "else"

return "return"

break "break"

not "not"

catch "catch"


letter [a-zA-Z]
digit [0-9]

/* write regular expressions for id, float and integers */

id [a-zA-Z_][a-zA-Z0-9_]*

float [-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?

integers [-+]?[0-9]+




%%

{ws} { /* ignore whitespace */ }

{newline} { ++lines;}



{def} {
			loglist="Line no "+to_string(lines)+": Token <DEF> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

{lparen} {
			loglist="Line no "+to_string(lines)+": Token <LPAREN> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

{rparen} {
			loglist="Line no "+to_string(lines)+": Token <RPAREN> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}	

{colon} {
			loglist="Line no "+to_string(lines)+": Token <COLON> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

{for} {
			loglist="Line no "+to_string(lines)+": Token <FOR> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}	

{in} {
			loglist="Line no "+to_string(lines)+": Token <IN> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

{range} {
			loglist="Line no "+to_string(lines)+": Token <RANGE> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

{integers} {
			loglist="Line no "+to_string(lines)+": Token <CONST_INT> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}	

{print} {
			loglist="Line no "+to_string(lines)+": Token <PRINT> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

{assignop} {
			loglist="Line no "+to_string(lines)+": Token <ASSIGNOP> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}	

{if} {
			loglist="Line no "+to_string(lines)+": Token <IF> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

{relop} {
			loglist="Line no "+to_string(lines)+": Token <RELOP> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

{else} {
			loglist="Line no "+to_string(lines)+": Token <ELSE> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

{return} {
			loglist="Line no "+to_string(lines)+": Token <RETURN> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

{break} {
			loglist="Line no "+to_string(lines)+": Token <BREAK> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

{not} {
			loglist="Line no "+to_string(lines)+": Token <NOT> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

{catch} {
			loglist="Line no "+to_string(lines)+": Token <CATCH> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}

{id} {
            loglist="Line no "+to_string(lines)+": Token <ID> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
        }

"+"|"-" { /* to match two same operators use | */
			loglist="Line no "+to_string(lines)+": Token <ADDOP> Lexeme "+yytext+" found"+"\n"+"\n";
			yyoutlog<<loglist;
		}









%%

int main(int argc, char *argv[])
{

	if(argc != 2) //check if file name is given
	{
        cout<<"Please input file name"<<endl;
		return 0;
	}

	yyin = fopen(argv[1], "r"); //the file to be read must be assigned to yyin

	yyoutlog.open("20301066_log.txt", ios::trunc); // remember to rename the log file as mentioned in the spec
	
	if(yyin == NULL) // file does not exist
	{
		// print error message and exit
	}
	
	yylex(); // start reading the input file in a loop
	
	//print total number of lines found in the input file
	
	loglist = "Total number of lines found in the input file: "+to_string(lines)+"\n";
	yyoutlog<<loglist;

	

	yyoutlog.close(); // close the log file
	
	fclose(yyin); // close the input file
}
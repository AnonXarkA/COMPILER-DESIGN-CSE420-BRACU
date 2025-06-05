# COMPILER-DESIGN-CSE420-BRACU




**BRAC UNIVERSITY** |

**Department of Computer Science and Engineering**  
**Course Code:** CSE 420 &nbsp;&nbsp; 
**Course Name:** Compiler Design  


# 🔬 Lab 1

---

## 1. 📘 Introduction

In this assignment we are going to construct a lexical analyzer. Lexical analysis is the process of scanning the source program as a sequence of characters and converting them into sequences of tokens. A program that performs this task is called a lexical analyzer or a lexer or a scanner. For example, if a portion of the source program contains `int x=5;` the scanner would convert in a sequence of tokens like:

```
<INT><ID><ASSIGNOP><COST_NUM><SEMICOLON>
```

You will also mention the associated symbol where applicable.

We will construct a scanner for a subset of Python language (a python function). The task will be performed using a tool named **flex (Fast Lexical Analyzer Generator)** which is a popular tool for generating scanners.

---

## 2. ✅ Tasks

You have to perform the following tasks in this assignment:

### 2.1 Identifying Tokens

#### 2.1.1 Keywords

You have to identify the keywords given in Table 1 and print the token in the output file.  
For example, you will have to print `<IF>` in case you find the keyword `if` in the source program.

| Keyword | Token | Keyword | Token | Keyword | Token |
|---------|-------|---------|-------|---------|-------|
| if | IF | try | TRY | and | AND |
| else | ELSE | except | EXCEPT | or | OR |
| for | FOR | True | TRUE | print | PRINT |
| range | RANGE | False | FALSE | in | IN |
| break | BREAK | def | DEF | continue | CONTINUE |
| not | NOT | return | RETURN | pass | PASS |
| catch | CATCH | finally | FINALLY | None | NONE |

> **Table 1:** Keyword List

---

#### 2.1.2 Constants

You have to identify constants using regular expressions.

- **Integer Literals**: One or more consecutive digits form an integer literal. Type of token will be `CONST_INT`. Note that `+` or `-` will not be the part of an integer.
- **Floating Point Literals**: Numbers like `3.147` and `.3147` will be considered as floating point constants. In this case, token type will be `CONST_FLOAT`.

---

#### 2.1.3 Operators and Punctuators

The operator list for the subset of the Python language we are dealing with is given in Table 2.  
A token in the form of `<Type>` along with the particular symbol should be printed in the output log file.

| Symbols | Type |
|---------|------|
| +, - | ADDOP |
| ++, -- | INCOP |
| <, >, == | RELOP |
| = | ASSIGNOP |
| &&, \|\| | LOGICOP |
| ! | NOT |
| ( | LPAREN |
| ) | RPAREN |
| { | LCURL |
| } | RCURL |
| [ | LTHIRD |
| ] | RTHIRD |
| , | COMMA |
| : | COLON |

> **Table 2:** Operators and Punctuators List

---

#### 2.1.4 Identifiers

Identifiers are names given to entities, such as variables, functions, structures etc. An identifier can only have alphanumeric characters `(a-z, A-Z, 0-9)` and underscore `_`.  
The **first character** of an identifier can only contain **alphabet** `(a-z, A-Z)` or underscore `_`.  
For any identifier encountered in the input file you have to print the token `<ID>` along with the symbol.

---

#### 2.1.5 White Space

You have to capture the white spaces in the input file, but no actions needed regarding this.

---

#### 2.1.6 Line count

You have to count the line numbers and print the corresponding line number with each token found.

---

## 3. 📂 Input

The input will be a text file containing a Python source program.  
File name will be given from the command line.

---

## 4. 📄 Output

In this assignment, there will be one output file. The output file should be named as:

```
<Your_student_ID>_log.txt
```

Here, you will output all the tokens as well as the line number where it was found.

For example, after detecting any lexeme except one representing white spaces you will print a line containing:

```
Line No. <line_count>: Token <Token> Lexeme <Lexeme> found.
```

For example, if you find an identifier `abcd` at line no 5 of your source code, you will print:

```
Line No. 5: Token <ID> Lexeme abcd found.
```

For more clarification about input output please refer to the sample input output file given in the lab folder.  
You are highly encouraged to produce output exactly like the sample one.

---

## 5. 📌 Submission

1. In your local machine create a new folder whose name is your student id.  
2. Put the lex file named as `<your_student_id>.l` containing your code.  
   **DO NOT** put the generated `lex.yy.c` file or any executable file in this folder.  
3. Compress the folder in a `.zip` file which should be named as your student id.  
4. Submit the `.zip` file.

|




|





# 🧩 Lab 2
---

## 1. 📘 Introduction

In the last assignment, we have constructed a lexical analyzer to generate token streams for a subset of python language.

In this assignment, we will construct the last part of the front end of a compiler for a subset of the C language. That means we will perform syntax analysis with a grammar rule containing function implementation in this assignment. To do so, we will build a parser with the help of Lex (Flex) and Yacc (Bison).

---

## 2. 💬 Language

Our chosen subset of the C language has the following characteristics:

- There can be multiple functions. No two functions will have the same name.
- There will be no pre-processing directives like `#include` or `#define`.
- Variables can be declared at suitable places inside a function. Variables can also be declared in the global scope.
- All the operators used in the previous assignment are included. Precedence and associativity rules are as per standard. Although we will ignore consecutive logical operators or consecutive relational operators like, `a && b && c`, `a < b < c`.
- No break statement and switch-case statement will be used.

---

## 3. ✅ Tasks

You have to complete the following tasks in this assignment.

### 3.1 Syntax Analysis

For the syntax analysis part you have to do the following tasks:

- Incorporate the grammar given in the file `Lab3_C_Syntax_Analyzer_Grammar.pdf` along with this document in your Yacc file.
- You are given a modified lex file named `lex_analyzer.l` to use it with your Yacc file. Try to understand the syntax and tokens used.
- Use a `SymbolInfo` pointer to pass information from lexical analyzer to parser when needed.
  - For example, if your lexical analyzer detects an identifier, it will return a token named `ID` and pass its symbol and type using a `SymbolInfo` pointer as the attribute of the token.
  - In the case of semicolons, it will only return the token as the parser does not need any more information.
  - You can implement this by redefining the type of `yylval` (`YYSTYPE`) in parser and associate `yylval` with new type in the scanner. See the skeleton file for example.
- Handle any ambiguity in the given grammar (For example, `if-else`). Your Yacc file should compile with **0 conflicts**.
- When a grammar matches the input from the C code, it should print the matching rule in the correct order in an output file (`log.txt`). For each grammar rule matched with some portion of the code, print the rule along with the relevant portion of the code.

---

## 4. 📂 Input

The input will be a text file containing a C source program.  
File name will be given from the command line.

---

## 5. 📄 Output

In this assignment, there will be one output file. The output file should be named as:

```
<Your_student_ID>_log.txt
```

This will contain matching grammar rules, and corresponding segment of source code as instructed in the previous sections.  
Print the line count at the end of the log file.

For more clarification about input-output check the supplied sample I/O files given in the lab folder.  
You are highly encouraged to produce output exactly like the sample one.

---

## 6. 📌 Submission

1. In your local machine create a new folder whose name is your student id.  
2. Put the lex file named as `<your_student_id>.l`, the Yacc file `<your_student_id>.y` and a script named `script.sh` (modifying with your own filenames), the `symbol_info.h` file in a folder named with your student id.  
   **DO NOT** put any I/O file, generated `lex.yy.c` file or any executable file in this folder.  
3. Compress the folder in a `.zip` file which should be named as your student id.  
4. Submit the `.zip` file.

> ❗ Failure to follow these instructions will result in penalty.

---

## 7. 📚 Grammar Rules

The following grammar rules are used for syntax analysis:

```
start : program
;

program : program unit
        | unit
;

unit : var_declaration
     | func_definition
;

func_definition : type_specifier ID LPAREN parameter_list RPAREN compound_statement
                | type_specifier ID LPAREN RPAREN compound_statement
;

parameter_list : parameter_list COMMA type_specifier ID
               | parameter_list COMMA type_specifier
               | type_specifier ID
               | type_specifier
;

compound_statement : LCURL statements RCURL
                   | LCURL RCURL
;

var_declaration : type_specifier declaration_list SEMICOLON
;

type_specifier : INT
               | FLOAT
               | VOID
;

declaration_list : declaration_list COMMA ID
                 | declaration_list COMMA ID LTHIRD CONST_INT RTHIRD
                 | ID
                 | ID LTHIRD CONST_INT RTHIRD
;

statements : statement
           | statements statement
;

statement : var_declaration
          | expression_statement
          | compound_statement
          | FOR LPAREN expression_statement expression_statement expression RPAREN statement
          | IF LPAREN expression RPAREN statement
          | IF LPAREN expression RPAREN statement ELSE statement
          | WHILE LPAREN expression RPAREN statement
          | PRINTLN LPAREN ID RPAREN SEMICOLON
          | RETURN expression SEMICOLON
;

expression_statement : SEMICOLON
                     | expression SEMICOLON
;

variable : ID
         | ID LTHIRD expression RTHIRD
;

expression : logic_expression
           | variable ASSIGNOP logic_expression
;

logic_expression : rel_expression
                 | rel_expression LOGICOP rel_expression
;

rel_expression : simple_expression
               | simple_expression RELOP simple_expression
;

simple_expression : term
                  | simple_expression ADDOP term
;

term : unary_expression
     | term MULOP unary_expression
;

unary_expression : ADDOP unary_expression
                 | NOT unary_expression
                 | factor
;

factor : variable
       | ID LPAREN argument_list RPAREN
       | LPAREN expression RPAREN
       | CONST_INT
       | CONST_FLOAT
       | variable INCOP
       | variable DECOP
;

argument_list : arguments
              |
;

arguments : arguments COMMA logic_expression
          | logic_expression
;
```


|


|



# 📘 Lab 3
---

---
## 1. Introduction

In the last assignment, we have constructed a sample of syntax analysis via matching the grammar with the tokens which came from lexical analyzer stages. In this assignment, we will construct a parse tree, basically the last part of the syntax analysis of a compiler for a subset of the C language. That means we will perform syntax analysis with a grammar rule generating the parse tree then print the terminal nodes of the parse tree if it is syntactically correct.

---
## 2. Language

Our chosen subset of the C language has the following characteristics:

* There can be multiple functions.
* No two functions will have the same name.
* There will be no pre-processing directives like `#include` or `#define`.
* Variables can be declared at suitable places inside a function. Variables can also be declared in the global scope.
The `TreeNode` class which is designed to represent nodes in a tree structure. It provides methods for creating nodes, managing child nodes, and traversing the tree structure in a post-traversal order.

---
## 3. Tasks

You have to generate a parse tree and print all the terminal nodes of the parse tree if they are syntactically correct according to the Syntax Analysis stages.

### 3.1 Tree generation using Syntax Analysis

For the syntax analysis part you have to do the following tasks:

* You are given a modified lex file named "`lex_analyzer.l`" to use it with your Yacc file. Try to understand the syntax and tokens used.
* The `symbol_info.h` file which contains the `symbol_info` class is designed to store information about symbols in a language, including their names, types, and associated syntax tree nodes.
* The `TreeNode.h` file contains the `TreeNode` class which is designed to represent nodes in a tree structure. It provides methods for creating nodes, managing child nodes, and traversing the tree structure in a post-traversal order.
* The `syntax_analyzer.y` file is the bison file where the necessary grammars for a C function and the rules for those grammars are described to generate a syntax tree from `input.txt` file, and logs the tree structure to an output file named `my_log.txt` file.
* On the main method of this file, there is a `yyparse()` function which is responsible for the parsing and construction of the syntax tree. Here the rules will be given and action should be implemented.

---
## 4. Input

The input will be a text file containing a c source program. File name will be given from the command line. Sample input and sample output are given in the txt file.

---
## 5. Output

In this assignment, there will be one output file. The output file should be named as `<Your_student_ID>_log.txt`. This will contain the terminal nodes generated from the parse tree if the syntax is correct. For a syntax error output file it will give an error message.

For more clarification about input-output check the supplied sample I/O files given in the lab folder. You are highly encouraged to produce output exactly like the sample one.

---
## 6. Submission

1.  In your local machine create a new folder whose name is your student id.
2.  Put the lex file named as `<your_student_id>.l`, the Yacc file `<your_student_id>.y` and a script named `script.sh` also the input file (modifying with your own filenames), and the output file in a folder named with your student id. DO NOT put any generated `lex.yy.c` file or any executable file in this folder.
3.  Compress the folder in a `.zip` file which should be named as your student id.
4.  Submit the `.zip` file.

Failure to follow these instructions will result in a penalty.

---
**Bonus Task:**

Print the input file as like the input file one maintaining all the formats.
For Example:

Sample input:

```c
int square (int y) {

}

return $y*y$
Sample outputint square (int y) {

return $y*y;$

}

```
Reference To have a better understanding of Lab 03, please go through Section 5.1, 5.2 and 5.3.1 from the reference compiler textbook 'Compilers: principles, techniques, and tools' written by Aho, Lam, Sethi, and Ullman.


## 7. 📚 Grammar Rules

The following grammar rules are used for syntax analysis:

```

start: program
    ;

program: program unit
    | unit
    ;

unit: var_declaration
    | func_definition
    ;

func_definition: type_specifier ID LPAREN parameter_list RPAREN compound_statement
    | type_specifier ID LPAREN RPAREN compound_statement
    ;

parameter_list: parameter_list COMMA type_specifier ID
    | parameter_list COMMA type_specifier
    | type_specifier ID
    | type_specifier
    ;

compound_statement: LCURL statements RCURL
    | LCURL RCURL
    ;

var_declaration: type_specifier declaration_list SEMICOLON
    ;

type_specifier: INT
    | FLOAT
    | VOID
    ;

declaration_list: declaration_list COMMA ID
    | declaration_list COMMA ID LTHIRD CONST_INT RTHIRD
    | ID
    | ID LTHIRD CONST_INT RTHIRD
    ;

statements: statement
    | statements statement
    ;

statement: var_declaration
    | expression_statement
    | compound_statement
    | FOR LPAREN expression_statement expression_statement expression RPAREN statement
    | IF LPAREN expression RPAREN statement
    | IF LPAREN expression RPAREN statement ELSE statement
    | WHILE LPAREN expression RPAREN statement
    | PRINTLN LPAREN ID RPAREN SEMICOLON
    | RETURN expression SEMICOLON
    ;

expression_statement: SEMICOLON
    | expression SEMICOLON
    ;

variable: ID
    | ID LTHIRD expression RTHIRD
    ;

expression: logic_expression
    | variable ASSIGNOP logic_expression
    ;

logic_expression: rel_expression
    | rel_expression LOGICOP rel_expression
    ;

rel_expression: simple_expression
    | simple_expression RELOP simple_expression
    ;

simple_expression: term
    | simple_expression ADDOP term
    ;

term: unary_expression
    | term MULOP unary_expression
    ;

unary_expression: ADDOP unary_expression
    | NOT unary_expression
    | factor
    ;

factor: variable
    | ID LPAREN argument_list RPAREN
    | LPAREN expression RPAREN
    | CONST_INT
    | CONST_FLOAT
    | variable INCOP
    | variable DECOP
    ;

argument_list: arguments
    ;

arguments: arguments COMMA logic_expression
    | logic_expression
    ;








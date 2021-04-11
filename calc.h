#ifndef __TABLA_H__
#define __TABLA_H__
/* Function type.  */
typedef double (*func_t) (double);

///Data type for links in the chain of symbols.
struct symrec
{
char *name;
int type;
union
{
  double var;
  func_t fnctptr;
} value;
struct symrec *next;
};

typedef struct symrec symrec;

//The symbol table: a chain of 'struct symrec'.
extern symrec *sym_table;

symrec *putsym (char const *, int);
symrec *getsym (char const *);


#endif

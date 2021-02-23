```flow
alias u = "User"
alias c = "Controller"
alias v = "View"
alias m = "Model"
alias d = "Database"


# adding entries
u->c: "click 'add entry'"
c->v: "GET entries/new"
v-->c: "entries/new"
c-->u: "entries/new"
u->c: "write entry, click 'submit'"
c->m: "POST add new entry"
m->d: "add entry"
m-->v: "new entry"
v-->c: "new entry"
c-->u: "HTML with entry"
```

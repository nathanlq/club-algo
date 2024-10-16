# Tout se passe ici

https://challenges.reply.com/tamtamy/challenge/code-challenge-2022/detail


## Un exemple de parser pour le problème

```python
import math as math

def parser(nom_fichier) :
    res = []
    canal = open(nom_fichier)
    ligne = canal.readline()
    first_line = ligne.strip("\n").split(" ")
    Si = int(first_line[0])
    Smax = int(first_line[1])    
    T = int(first_line[2])    
    D = int(first_line[3])
    allDemons = []
    for elem in range(D) :
        ligne = canal.readline().strip("\n").split(" ")
        Demon = [int(ligne[0]),int(ligne[1]),int(ligne[2]),int(ligne[3])]
        if int(ligne[3])!=0:
            fragments = [[int(k) for k in ligne[4:]]]
        else :
            fragments = [[]]
        # fragments récupérés à chaque tour
        allDemons += [Demon+fragments+[elem]]
    canal.close()
    return ([Si,Smax,T,D],allDemons)
```

Exemple input :

```
5 20 10 5
16 4 18 13 0 10 5 0 0 7 4 1 1 6 10 2 9
2 1 11 18 0 6 1 7 3 4 7 0 5 7 9 5 6 3 9 9 0 5
3 1 5 15 0 5 4 5 0 10 1 8 3 8 2 4 7 2 1
7 6 10 13 8 2 5 0 0 4 3 9 6 4 1 6 4
17 5 7 16 5 1 4 5 1 8 9 10 9 7 2 8 9 7 3 10
```

Exemple output :

```
1
3
2
0
```

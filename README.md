# Ma config emacs

Voici le code de ma config emacs

## Que rajoute ma config

### Fond
Avec cette config emacs est en dark mode et le fond est en une sorte de bleu sombre,
c'est la couleur avec l'aquelle le terminal ubuntu affiche le noir.
Il est possible de switcher entre noir et bleu sombre avec le racoursis
`C-c b`. Lorsque emacs est lancé dans un terminal le fond est noir.

### Indentation
L'affichage des tab est d'une taille de 4 charactère, et la tabulation se fait avec des tab.
Il est possible de switcher en tabulation avec des espace grace au racoursis `C-c i`, à ce moment
là, la tabulation se fait avec 4 espaces.

### Compilation et affichage d'erreur
En faisant `C-c m` en `java-mode` ou en `c-mode`, emacs va appeler un script bash qui va compiler
le code, retourner les lignes avec des erreurs, puis emacs va les surligner en rouge. Il est possible de supprimer
la surbrillance des erreurs en tapant `C-c c`.

La surbrillance des lignes se fait en surlignant les occurance d'une expression, donc si vous
avec plusieurs lignes qui sont exactement parail, que certaines ne font pas d'erreurs de compilation
et d'autres oui, alors elle seront quand même toutes surligner.

A tout moment pour en connaître plus sur les erreurs afficher vous pouvais faire `C-c e` pour afficher
dans une autre fenêtre la sortie d'erreur de la dernières compilation effecuter avec `C-c m`.

En java, la compilation se fait trouvant un dossier nomé `src` dans le chemin du fichier, puis le compile
dans un dossier nommé `bin`, la compilation se fait avec l'encodage iso-8859. Si la commande de compilation
ne vous plait pas, vous pouvez facilement la changer en modifiant le fichier `get_err_java.sh`.

En c, la compilation se fait en cherchant dans les fichier parrant un fichier `Makefile`. Si il en trouve un
alors il l'appelle avec la règle `nom_fichier.o`. Si vous ne voulez par compiler votre fichier au même endroit
que le fichier `Makefile` vous pouvez avec le racoursis `C-c b` changer le doser ou sont stocké les binaires
du mode courrant (attention à ne pas oublier le charactère `'\'` à la fin du nom du dossier). Par exemple si 
vous rentrez `bin\`, alors la règle de Makefile appelé sera `bin\nom_fichier.o`.

### Autres ajouts
 - On peut utiliser la sourie lorsque emacs est ouvert dans un terminal
 - Les charactères non impimables sont afficher (on peut les désafficher et les réafficher avec la commande `C-c w`
 - Numérotation des lignes
 - Prise en charge du camelCase
 - Plus de coloration syntaxique pour java, c, python et javascript

## Comment s'en servir
Il suffit de clone se dépot dans votre home
et d'ajouter à votre fichier `.emacs` la ligne suivante :
```emacs-lisp
(load "~/emacs-config/config.el")
```

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
En faisant `C-c m` en `java-mode`, en `c-mode` ou en `latex-mode`, emacs va appeler un script bash qui va compiler le code, retourner les lignes avec des erreurs, puis emacs va les surligner en rouge. Il est possible de supprimer la surbrillance des erreurs en tapant `C-c c`.

La surbrillance des lignes se fait en surlignant les occurance d'une expression régulière, donc si vous avec plusieurs lignes qui sont exactement parail, que certaines ne font pas d'erreurs de compilation et d'autres oui, alors elle seront quand même toutes surligner.

A tout moment pour en connaître plus sur les erreurs afficher vous pouvais faire `C-c e` pour afficher dans une autre fenêtre la sortie d'erreur de la dernières compilation effecuter avec `C-c m`.

#### En Java
<!--
En java, la compilation se fait trouvant un dossier nomé `src` dans le chemin du fichier, puis le compile dans un dossier nommé `bin`, la compilation se fait avec l'encodage iso-8859. Si la commande de compilation ne vous plait pas, vous pouvez facilement la changer en modifiant le fichier `get_err_java.sh`.
-->
En Java `C-c m` va chercher un Makefile dans les répértoires parents, s'il en trouve un (on va appeler `makefile_path` le chemin où il à était trouvé), alors il va appelé la règle `bin/path_to_file/file.class` où `path_to_file` est le chemin depuis `makefile_path/src/` vers le fichier courrant et `file.class` le nom du fichier courrant en remplaçant le `.java` par `.class`.

#### En C
En C, la compilation compile le fichier à l'aide de `gcc` avec les flags suivant : `-c -Wall -Wextra -fsyntax-only`. Le `-fsyntax-only` permet d'afficher les erreurs de compilation sans produire aucun fichier de compilation.

Il est aussi possible de poduire un fichier `.o` après la compilation, pour cela il faut rentrer un dossier où stocké les binaires avec le racoursis `C-c o`, sans oublier le charactère `/` à la fin du nom du dossier.
A ce moment la compilation se fera en cherchant dans les dossiers parrant un fichier `Makefile`. Si il en trouve un, alors il l'appellera avec la règle `Nom_dossierNom_fichier.o`.
Par exemple, si vous rentrer `bin/` comme dossier de compilation alors la règle de Makefile appelée sera `bin/nom_fichier.o`. Si vous voulez appellé la règle `nom_fichier.o`,
alors il ne faut rien rentrer comme dossier de compilation. Si vous ne voulez plus produire de binaire, alors il faut entrer `null` comme dossier de compilation.

#### En typescript
En typescript `C-c m` compile avec la commande `npx tsc --noEmit --allowJs nom_fichier`, ainsi il ne produit pas de fichier à la compiliation, et il peut analyse bien que très rudimentairement les fichier js.
On utilise `npx tsc` donc pour que la compilation fonctionne il faut que typscript soit accessible depuis le fichier.

#### En LaTeX
En latex, par défault la commande `C-c m` compile le fichier latex deux fois avec `pdflatex` si le fichier latex compile. Sinon il surligne en rouge la première erreur. Et on peut ouvrir le pdf avec `C-c s`.

On peut aussi en tapant avec le racoursis `C-c o` depuis un buffer latex modifier le fichier à compiler, si on rentre un chemin, alors il va compiler et afficher ce fichier avec les commandes `C-c m` et `C-c m`.
Si on rentre `Makefile`, alors il va chercher un Makefile en remontant dans les fichiers et lancer la règle de base avec `C-c m` et la règle `show` avec `C-c s`.
Et enfin si on rentre `null` alors on compile à nouveau le fichier courrant.

### Autres ajouts
 - On peut utiliser la sourie lorsque emacs est ouvert dans un terminal
 - Les charactères non imprimables sont afficher (on peut les désaffcher et les réaffcher avec la commande `C-c w`)
 - Numérotation des lignes
 - Prise en charge du camelCase
 - Plus de coloration syntaxique pour java, c, python et javascript
 - `C-c <up>` rétrécit le buffer verticalement, `C-c <down>` agrandit le buiffer verticalement
 - `C-c <left>` rétrécit le buffer horizontalement, `C-c <right>` agrandit le buiffer horizontalement
 - `M-<up>` et `M-<down>` permettent de faire dériler le buffer d'une ligne
 - `C-c r` permet d'activer et désactiver la troncation des longues lignes
 - En `latex-mode` les lignes sont tronqué selon les mots
 - Les fichiers qui finissent en `.ts` sont mis en `js-mode`
 - Le texte entre `\begin{comment}` et `\end{comment]` en `latex-mode` est considéré comme commentaire (coloration syntaxique)

## Comment s'en servir
Il suffit de cloner se dépot dans votre home :
```
git clone https://github.com/SamuelVedel/emacs-config.git
```
Puis d'ajouter à votre fichier `.emacs` la ligne suivante :
```emacs-lisp
(load "~/emacs-config/config.el")
```

Si jamais vous souhaité mettre la config dans un autre dossier que `~/emacs-config`, alors ce qu'il faut ajouté au `.emacs` est :
```emacs-lisp
(setq config-path "<path>")
(load "<path>/config.el")
```
en remplacant `<path>` par le cemin vers le dossier ou se trouve cette config.  
Cela sert aussi si l'on veut rendre cette config accessible à d'autres utilisateurs, car `~/emacs-config` est un chemin
relatif qui ne fonctionnera pas pour d'autres utilisateurs. Il faut dans ce cas là mettre le chemin absolu à la place de `<path>` (par exemple `/home/nom/emacs-config`)

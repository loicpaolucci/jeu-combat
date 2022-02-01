Projets : Mini jeu - il veulent tous ta POO
1. Introduction
Maintenant que tu as tous les outils de POO en main, on va te montrer comment les utiliser pour faire un petit jeu de combat du type Fortnite. Alors évidemment, je vais tout de suite calmer tes ardeurs : on va devoir se contenter de visuels bien moins ambitieux que le vrai jeu… Mais le principe sera là : des joueurs vont s'affronter dans une grande arène, s'échanger des coups, et tu ne pourras vaincre que si tu es le dernier debout ! 😎

2. Le projet
On va faire ce projet de façon progressive : on va déjà produire une version 1.0 en te guidant, puis on passera à une version 2.0 un peu plus recherchée et moins guidée pour conclure sur une version 3.0 où on te donnera juste les directives !

C'est un projet relativement long et complet : l'objectif est a minima que tu puisses finir la version 1.0 pour valider le projet (il faut bien sûr qu'elle marche !). Mais on est persuadé qu'en vous aidant les uns les autres, vous arriverez à aller plus loin !

2.1. Mise en place du repo
On commence toujours par préparer son espace de travail. Comme pour le projet d'hier, ouvre un dossier du genre mini_jeu_POO et donne-lui l'architecture suivante :

mini_jeu_POO
├── lib
│   ├── player.rb
│   └── game.rb
├── app.rb
├── README.md
├── Gemfile
├── Gemfile.lock
└── Autres fichiers (.env, .gitignore)
Dans le fichier app.rb, insère le code suivant :

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

binding.pry
Pour rappel, ces lignes vont te permettre d'exécuter ton programme proprement depuis app.rb en rendant toutes les gems disponibles dans tous les fichiers (2 premières lignes) et en faisant appel aux 2 autres fichiers présents dans \lib (les 2 lignes suivantes).

La ligne binding.pry est là pour te permettre de faire des tests. Tout ce que tu vas coder dans player.rb, tu pourras le tester dans le terminal (avec PRY) en exécutant directement un petit ruby app.rb.

2.2. Version 1.0 : coder un combat entre 2 joueurs
Quand on s'attaque à un gros morceau comme Fortnite, il y a un max de fonctionnalités qu'on peut avoir envie de coder. Alors pour ne pas se perdre, commençons par quelque chose qui soit à la fois relativement simple à coder et central au jeu. Ici, j'ai choisi de te faire commencer par un combat. Tout simplement. Si on est pas capable de coder un combat entre 2 personnages, on ne saura pas coder ce jeu : commençons donc par ça !

Que faut-il pour faire un combat ? Moi j'ai en tête qu'il faut a minima :

2 joueurs ;
Que chaque joueur ait un niveau de vie donné ;
Que ce niveau de vie baisse à chaque attaque subie ;
Si la vie atteint zéro, le personnage est mort.
Difficile de faire plus simple... Alors allons-y ! On va commencer par coder tout ça dans le fichier player.rb qui va donc accueillir la classe Player dont le but est de modéliser un joueur. Je vais te décrire chaque caractéristique d'un objet Player, charge à toi d'écrire le code !

a) Player : attributs et initialize
Un joueur possède 2 attributs que tu vas mettre en attr_accessor : un nom @name (string) et un niveau de vie @life_points (integer).

Quand on veut créer un objet Player, on ne met que son nom en entrée car le niveau de vie est le même pour tout le monde au début (10 pts de vie). Écris la méthode initialize afin qu'on ait la réaction suivante si on lance app.rb et qu'on utilise PRY :

[1] pry(main)> player1 = Player.new("José")
=> #<Player:0x000055e2ae15e910 @life_points=10, @name="José">
[2] pry(main)> player1.name
=> "José"
[3] pry(main)> player1.life_points
=> 10
b) Player : afficher l'état d'un joueur avec show_state
On sait que les joueurs vont se mettre sur la tronche et que donc leur niveau de vie va baisser. Donc on peut anticiper qu'il va falloir afficher à l'utilisateur l'état de chaque joueur pour qu'il sache ce qu'il se passe et comment le combat avance. Code une méthode show_state qui va afficher l'état de l'objet Player sur laquelle elle est exécutée : "XXXX a YYY points de vie".

Tout comme dans l'exemple ci-dessus, cette méthode doit permettre d'obtenir le résultat suivant si on lance app.rb et qu'on utilise PRY:

[1] pry(main)> player1 = Player.new("José")
=> #<Player:0x000055c8d3bcb960 @life_points=10, @name="José">
[2] pry(main)> player1.show_state
José a 10 points de vie
=> nil
c) Player : subir une attaque avec gets_damage
A ce stade, on a notre base pour définir un objet Player. Passons maintenant à une méthode indispensable pour un combat : celle qui fait baisser le niveau de vie du joueur. En gros je veux pouvoir modéliser "le joueur stocké dans l'objet player1 subit 5 points de dommage" en faisant un player1.gets_damage(5).

Tu dois coder une méthode gets_damage qui prend en entrée un integer (= le nombre de dommages subit) et qui le soustraie au niveau de vie (@life_points) du joueur.

Une fois la soustraction faite, la méthode vérifie si @life_points est inférieur ou égale à zéro. Si c'est le cas, c'est que le joueur est mort : elle affiche un message "le joueur XXXX a été tué !".

Voici le fonctionnement qu'on doit obtenir en exécutant app.rb et en utilisant PRY :

[1] pry(main)> player1 = Player.new("José")
=> #<Player:0x00005648d5f9ea88 @life_points=10, @name="José">
[2] pry(main)> player1.gets_damage(5)
=> nil
[3] pry(main)> player1.show_state
José a 5 points de vie
=> nil
[4] pry(main)> player1.gets_damage(5)
le joueur José a été tué !
=> nil
[5] pry(main)> player1.show_state
José a 0 points de vie
=> nil
Petite aide : pour ceux qui sont complètement perdus dans l'écriture de cette première méthode, son contenu est affiché ci-dessous en blanc sur blanc (surligne le texte avec ta souris pour l'afficher). 
⚠️ATTENTION⚠️ : si tu as besoin de cette aide pour avancer, c'est que le concept d'objet et l'écriture des classes n'est pas du tout clair pour toi (pour le moment). Il est INTERDIT de copier-coller cette méthode dans ton code : je veux que tu y jettes un œil puis que tu essayes, sans la recopier, de l'écrire à nouveau dans ton code. Tu dois comprendre chaque ligne. Ensuite, lance app.rb avec son binding.pry et fais plein de tests en créant 2 ou 3 objets Player différents, fais des show_state et des gets_damage dessus pour bien visualiser comment tout ça marche.
Il n'y aura pas d'autre aide donc c'est important que tu saisisses MAINTENANT la logique. Quitte à te la faire expliquer par un co-moussaillon !

-début de l'aide- 
def gets_damage(damage_received) #damage_received est un entier qu'on met en entrée de la méthode

#On soustrait l'entier en entrée au niveau de vie de l'objet sur lequel la méthode est appliquée :
@life_points = @life_points - damage_received 


#Si le niveau de vie de l'objet est inférieur ou égal à zéro, le joueur est tué et on affiche un message.
if @life_points <= 0
puts "le joueur #{@name} a été tué !" # l'écriture #{} permet d'insérer une variable dans un string
end
end

end 
-fin de l'aide-

d) Player : attaquer avec attacks
On est à présent capable de faire baisser les points de vie d'un joueur avec gets_damage. Il est temps de coder une méthode attacks qui permette de faire qu'un joueur attaque un autre. Ainsi, si le joueur player1 attaque le joueur player2, on aurait juste à taper player1.attacks(player2).

Code cette méthode en respectant ces contraintes :

La méthode prend donc en entrée un objet Player qui est le joueur subissant l'attaque ;
La méthode commence par annoncer "le joueur [nom de player1] attaque le joueur [nom de player2]" avec un puts ;
Ensuite on doit calculer les dommages que player1 va faire subir à player2. Pour des raisons que tu comprendras plus tard, on va créer une méthode à part s'appelant compute_damage qui va faire ce calcul. Et dans la pure tradition des jeux de rôle, les dommages seront aléatoires car égaux au résultat d'un lancé de dé (= un chiffre au hasard entre 1 et 6). Voici le code de notre méthode compute_damage que tu vas mettre juste à la suite de attacks :
  def compute_damage
    return rand(1..6)
  end
Maintenant, dans attacks, fais appel à compute_damage et stocke le résultat dans une variable.
Fais subir les dégâts à l'autre Player en utilisant ces dommages et la méthode gets_damage.
À présent puts une phrase qui explique ce qui vient de se passer : "il lui inflige XXXX points de dommages"
Voici le fonctionnement qu'on doit obtenir en exécutant app.rb et en utilisant PRY :

[1] pry(main)> player1 = Player.new("Josiane")
=> #<Player:0x000055ebac183358 @life_points=10, @name="Josiane">
[2] pry(main)> player2 = Player.new("José")
=> #<Player:0x000055ebac11cb80 @life_points=10, @name="José">
[3] pry(main)> player1.attacks(player2)
Josiane attaque José
il lui inflige 5 points de dommages
=> nil
[4] pry(main)> player2.show_state
José a 5 points de vie
=> nil
[5] pry(main)> player1.show_state
Josiane a 10 points de vie
=> nil
e) Orchestrons un combat !
C'est bon, on a tous les ingrédients pour que nos joueurs se trucident bien comme il faut ! Les joueurs peuvent attaquer, subir des dégâts et on peut donner des infos sur le terminal via plein de puts. Il ne nous reste qu'à mettre en place notre premier combat.

On va tout coder dans app.rb qui va orchestrer le combat et faire appel à la classe Player. Petite exception à la règle : pas besoin de créer une classe App dans ce fichier.

Je vais à nouveau te guider pas à pas. N'oublie pas de vérifier que chaque étape fonctionne bien en exécutant app.rb avec un petit binding.pry à la fin pour confirmer que tout marche avant de passer à l'étape d'après.

Allez c'est parti :

À ma droite "Josiane" : crée un Player répondant à ce doux prénom et stocké dans la variable player1.
À ma gauche "José" : crée un autre Player répondant à ce joli prénom et stocké dans la variable player2.
Présentons les deux combattants : affiche dans le terminal l'état de chaque combattant grâce à des puts et des show_state. Juste avant, affiche un petit puts "Voici l'état de chaque joueur :".
Fight ! Indique que le combat commence avec un puts "Passons à la phase d'attaque :".
Josiane aura l'honneur d'attaquer la première : fais attaquer player2 par player1 avec la méthode attacks.
José ne va pas se laisser faire : fais l'attaque inverse.
Si tu exécutes le code en l'état, tu devrais avoir un premier round d'attaque entre nos deux gladiateurs. C'est déjà un bon début ! Mais José et Josiane doivent à présent combattre jusqu'à la mort 👎. Ils doivent donc s'attaquer jusqu'à ce que l'un des deux n'ait plus de point de vie. Es-tu déjà en mesure de voir comment faire ?

Allez, sur cette première étape je t'aide : il faut faire une boucle while. En effet, on ne sait pas combien de tours le combat va durer vu que les dommages sont aléatoires (il faut entre 2 et 10 coups pour venir à bout des 10 points de vie).

Tu vas donc créer une boucle qui commence au point 3 de la liste ci-dessus (la présentation de l'état de chaque combattant doit avoir lieu au début de la boucle) et finie au point 6. Cette boucle doit tourner jusqu'à ce qu'un des Player voit son niveau de vie être inférieur ou égal à zéro. Es-tu en mesure d'écrire cette condition d'arrêt ?

Aide si tu n'y arrives pas (surligne le texte ci-après, en blanc sur blanc) : while player1.life_points > 0 && player2.life_points >0 - fin de l'aide -

Et voilà tu dois maintenant pouvoir faire tourner plusieurs combats sans souci et faire des paris sur qui, de José ou Josiane, en sortira les pieds devants. Hum… En fait si tu fais tourner plusieurs combats, tu devrais identifier un petit souci.

f) Corrigeons ce petit bug
Et oui, si jamais José (player2) venait à être tué en premier, tu vas vite te rendre compte qu'il peut malgré tout porter une dernière attaque sur Josiane (et potentiellement la tuer aussi). Pas terrible : ça serait considéré comme un bug par un utilisateur extérieur ! On doit gérer ce cas.

Juste après l'attaque de Josiane (player1) sur José (player2), rajoute un petit if qui teste si player2 est mort (ses points de vie sont négatifs ou nuls). Si c'est le cas, il nous faut sortir immédiatement de la boucle while : c'est faisable grâce à la ligne break.

Résultat attendu sur le terminal
Voici un exemple de ce que le terminal doit afficher si tu lances un combat en exécutant app.rb :

Voici l'état de nos joueurs :
Josiane a 10 points de vie
José a 10 points de vie

Passons à la phase d'attaque :
Josiane attaque José
il lui inflige 4 points de dommages
José attaque Josiane
il lui inflige 3 points de dommages

Voici l'état de nos joueurs :
Josiane a 7 points de vie
José a 6 points de vie

Passons à la phase d'attaque :
Josiane attaque José
il lui inflige 1 points de dommages
José attaque Josiane
il lui inflige 4 points de dommages

Voici l'état de nos joueurs :
Josiane a 3 points de vie
José a 5 points de vie

Passons à la phase d'attaque :
Josiane attaque José
il lui inflige 1 points de dommages
José attaque Josiane
il lui inflige 6 points de dommages
le joueur Josiane a été tué !
Comme tu peux le voir, j'ai inséré quelques sauts de ligne en plus pour rendre le tout plus lisible. N'hésite pas à mettre en page un peu mieux si tu te sens de rajouter des puts en plus, des lignes de "------------" ou autres.
# Ecov Test

### Installation

* Vérifier que tout est ok `docker-compose run test`
* Lancer le projet `docker-compose up`
* Ouvrir son navigateur Chrome préféré est visiter l'url `http://localhost:3000/`
* Vous devriez voir ceci : <img width="1914" alt="Capture d’écran 2019-09-14 à 17 54 11" src="https://user-images.githubusercontent.com/581100/64910689-747cc900-d719-11e9-9554-98cb7f187d7f.png">

### Usage

* Pour commencer, créons un nouveau trajet en cliquant sur le bouton 'Créez un nouveau trajet' : <img width="1914" alt="Capture d’écran 2019-09-14 à 17 54 14" src="https://user-images.githubusercontent.com/581100/64910696-9d04c300-d719-11e9-81b8-1df7c035de2a.png">
* Bravo ! Vous avez crée un trajet : <img width="1914" alt="Capture d’écran 2019-09-14 à 17 54 18" src="https://user-images.githubusercontent.com/581100/64910701-ba399180-d719-11e9-8f21-f1733cc19d49.png">
* Remarquez que vous pouvez démarrer ou annuler ce trajet. Essayons de le démarrer en cliquant sur le bouton 'Démarrer le trajet' : <img width="1914" alt="Capture d’écran 2019-09-14 à 17 54 21" src="https://user-images.githubusercontent.com/581100/64910717-e523e580-d719-11e9-9300-b046bbbc4020.png">
* Chouette ! Le trajet est maintenant démarré. Notez comme le token du trajet s'affiche en vert désormais (les plus attentifs auront aussi noté que le changement d'état du trajet à été loggé en console et publié sur le serveur rabbitmq !) : <img width="1914" alt="Capture d’écran 2019-09-14 à 17 54 25" src="https://user-images.githubusercontent.com/581100/64910739-3207bc00-d71a-11e9-88ad-4d7df7247421.png">
* Bien entendu, il est possible d'annuler un trajet si jamais vous avez changé d'avis ou que vous n'avez plus assez d'argent pour partager la facture d'essence ... Il suffira de cliquer sur le bouton "Annuler le trajet" : <img width="1914" alt="Capture d’écran 2019-09-14 à 17 54 52" src="https://user-images.githubusercontent.com/581100/64910748-46e44f80-d71a-11e9-9198-dceef54906c1.png">
* Et hop ! Le trajet est annulé, vous êtes remboursé et le token du trajet s'affiche maintenant dans une couleur rouge qui fait peur : <img width="2250" alt="Capture d’écran 2019-09-14 à 18 10 30" src="https://user-images.githubusercontent.com/581100/64910819-01745200-d71b-11e9-8dfc-f63db1a868af.png">
* Voilà, vous avez les bases désormais, et vous allez pouvoir créer tout un tas de trajets pour vous rendre partout où vous en avez besoin : <img width="1914" alt="Capture d’écran 2019-09-14 à 17 55 54" src="https://user-images.githubusercontent.com/581100/64910784-b8bc9900-d71a-11e9-9e16-67452041d78c.png">

Merci !

### Contribuer

Ce projet est considéré comme terminé et définitif, et aucun support dans la durée n'est prévu. Merci au principal (et unique d'ailleurs) contributeur de ce projet : @petrachi ! :clap: :clap: :clap:

# Mini-exercices POO - Écosystème de la mare

## EXERCICE 1: Créatures de la mare

**Objectif:** Classes, constructeur, propriétés publiques/privées

**Consigne:**
Créez des créatures qui vivent dans une mare. Chaque créature a un nom, une énergie (privée), et peut se déplacer.
```ts
class Creature {
  private energy: number = 100;

  constructor(public name: string, public species: string) {}

  // TODO: Implémenter move() qui réduit l'énergie de 10

  // TODO: Implémenter rest() qui augmente l'énergie de 20 (max 100)

  // TODO: Implémenter getEnergy() qui retourne l'énergie
}

// Testez votre code:
const grenouille = new Creature("René", "grenouille");
grenouille.move();
console.log(grenouille.getEnergy()); // Devrait afficher 90
```

---

## EXERCICE 2: Héritage - Types de créatures

**Objectif:** Héritage, méthodes spécifiques, polymorphisme

**Consigne:**
Créez différents types de créatures: amphibiens, poissons, insectes etc.. Chacun a des capacités spécifiques.

**Tâches:**
1. Créez une classe abstraite `Animal` avec une méthode abstraite `makeSound()`
2. Créez les classes `Frog`, `Fish`, `Dragonfly` qui héritent de `Animal`
3. Chaque animal fait un bruit différent
4. Ajoutez un `Mosquito` qui peut piquer
5. Ajoutez un `Snail` (escargot) qui se déplace très lentement

**Test:**
Créez un tableau d'animaux différents et faites-les tous crier (polymorphisme).

---

## EXERCICE 3: Interfaces - Comportements

**Objectif:** Interfaces, implémentation multiple

**Consigne:**
Certaines créatures peuvent nager, voler, ou chasser. Utilisez des interfaces pour définir ces capacités.

**Tâches:**
1. Créez une interface `Swimmer` avec méthode `swim()`
2. Créez une interface `Flyer` avec méthode `fly()`
3. Créez une interface `Predator` avec méthode `hunt(prey: Animal)`
4. Créez une classe `Duck` qui implémente `Swimmer` et `Flyer`
5. Créez une classe `Pike` (brochet) qui implémente `Swimmer` et `Predator`
6. Créez une fonction `makeSwim(creature: Swimmer)` qui accepte n'importe quelle créature qui nage

**Test:**
Un canard qui nage et vole. Un brochet qui chasse le canard.

---

## EXERCICE 4: Observer + Strategy - Météo et comportements (30min)

**Objectif:** Pattern Observer, Pattern Strategy combinés

**Consigne:**
La météo change, les créatures adaptent leur comportement.

**Tâches:**
1. Créez une classe `Weather` qui peut notifier des observateurs
2. Créez une interface `WeatherObserver` avec `onWeatherChange(weather)`
3. Créez des stratégies de comportement: `ActiveBehavior`, `SleepingBehavior`, `HidingBehavior`
4. Créez une classe `AdaptiveCreature` qui change de comportement selon la météo

**Météo:**
- `"sunny"` → actif
- `"rainy"` → dort
- `"stormy"` → se cache

**Extensions:**
- Ajoutez une météo `"night"` où certaines créatures deviennent actives
- Ajoutez une température qui influence le comportement
- Certaines créatures réagissent différemment à la même météo

---

## EXERCICE BONUS: Écosystème complet

**Objectif:** Tout combiner dans un système interactif

**Consigne:**
Créez un écosystème complet qui tourne pendant plusieurs cycles jour/nuit avec météo changeante.

**Structure minimale:**
- Classe `Pond` qui gère l'écosystème
- Méthode `simulate(cycles)` qui fait tourner le temps
- Intégration de la météo et des créatures
- Affichage de l'état à chaque cycle

**Extensions possibles:**
- Cycle jour/nuit (comportements nocturnes/diurnes)
- Reproduction (créatures se multiplient si énergie > 80)
- Chaîne alimentaire (prédateurs mangent proies)
- Niveau d'eau (affecte certaines créatures)
- Pollution (tue les créatures sensibles)
- Saisons (4 saisons avec comportements différents)
- Events aléatoires (sécheresse, inondation, canicule)

**Critère de réussite:**
Le système tourne en autonomie pendant 10 cycles avec météo changeante et créatures qui réagissent.
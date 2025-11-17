# Diagrammes UML - Exercices de la mare

## EXERCICE 1 : Créatures de la mare

```mermaid
classDiagram
    class Creature {
        -energy: number
        +name: string
        +species: string
        +constructor(name: string, species: string)
        +move(): void
        +rest(): void
        +getEnergy(): number
    }
```

## EXERCICE 2 : Héritage - Types de créatures

```mermaid
classDiagram
    class Animal {
        <<abstract>>
        +makeSound()*
    }
    
    class Frog {
        +makeSound()
    }
    
    class Fish {
        +makeSound()
    }
    
    class Dragonfly {
        +makeSound()
    }
    
    class Mosquito {
        +makeSound()
        +sting()
    }
    
    class Snail {
        +makeSound()
        +moveSlowly()
    }
    
    Animal <|-- Frog : extends
    Animal <|-- Fish : extends
    Animal <|-- Dragonfly : extends
    Animal <|-- Mosquito : extends
    Animal <|-- Snail : extends
```

## EXERCICE 3 : Interfaces - Comportements

```mermaid
classDiagram
    class Animal {
        <<abstract>>
        +makeSound()*
    }
    
    class Swimmer {
        <<interface>>
        +swim() string
    }
    
    class Flyer {
        <<interface>>
        +fly() string
    }
    
    class Predator {
        <<interface>>
        +hunt(prey: Animal) string
    }
    
    class Duck {
        +makeSound() string
        +swim() string
        +fly() string
    }
    
    class Pike {
        +makeSound() string
        +swim() string
        +hunt(prey: Animal) string
    }
    
    Animal <|-- Duck : extends
    Animal <|-- Pike : extends
    Swimmer <|.. Duck : implements
    Flyer <|.. Duck : implements
    Swimmer <|.. Pike : implements
    Predator <|.. Pike : implements
```

## EXERCICE 4 : Observer + Strategy - Météo et comportements

```mermaid
classDiagram
    class WeatherObserver {
        <<interface>>
        +onWeatherChange(weather: string, temperature: number) void
    }
    
    class Weather {
        -observers: WeatherObserver[]
        -current_weather: string
        -temperature: number
        +addObserver(observer: WeatherObserver) void
        +removeObserver(observer: WeatherObserver) void
        +setWeather(weather: string, temperature: number) void
        -notifyObservers() void
    }
    
    class Behavior {
        <<interface>>
        +act() string
    }
    
    class ActiveBehavior {
        +act() string
    }
    
    class SleepingBehavior {
        +act() string
    }
    
    class HidingBehavior {
        +act() string
    }
    
    class NightActiveBehavior {
        +act() string
    }
    
    class AdaptiveCreature {
        -behavior: Behavior
        -weather: Weather
        +name: string
        +onWeatherChange(weather: string, temperature: number) void
        +act() string
        -updateBehavior(weather: string, temperature: number) void
    }
    
    class NocturnalCreature {
        -updateBehavior(weather: string, temperature: number) void
    }
    
    WeatherObserver <|.. AdaptiveCreature : implements
    Weather ..> WeatherObserver : notifies
    AdaptiveCreature --> Weather : observes
    Behavior <|.. ActiveBehavior : implements
    Behavior <|.. SleepingBehavior : implements
    Behavior <|.. HidingBehavior : implements
    Behavior <|.. NightActiveBehavior : implements
    AdaptiveCreature --> Behavior : uses
    AdaptiveCreature <|-- NocturnalCreature : extends
```


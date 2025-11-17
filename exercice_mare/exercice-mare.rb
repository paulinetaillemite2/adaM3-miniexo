# EXERCICE 1: Créatures de la mare
class Creature
    def initialize(name, species)
      @energy = 100
      @name = name
      @species = species
    end
  
    # Réduit l'énergie de 10
    def move
      @energy -= 10
    end
  
    # Augmente l'énergie de 20 (max 100)
    def rest
      @energy += 20
      @energy = 100 if @energy > 100
    end
  
    # Retourne la valeur actuelle de l'énergie
    def getEnergy
      @energy
    end
  end
  
  # EXERCICE 2: Héritage - Types de créatures
  class Animal
    # Méthode abstraite à implémenter dans les sous-classes
    def makeSound
      raise NotImplementedError, "Cette méthode doit être implémentée dans les sous-classes"
    end
  end
  
  class Frog < Animal
    def makeSound
      "Coa coa ! 🐸"
    end
  end
  
  class Fish < Animal
    def makeSound
      "Bloup bloup ! 🐟"
    end
  end
  
  class Dragonfly < Animal
    def makeSound
      "Bzzz bzzz ! 🦟"
    end
  end
  
  class Mosquito < Animal
    def makeSound
      "Bzzz bzzz ! 🦟"
    end
  
    # Méthode spécifique : pique
    def sting
      "Pique ! 💉"
    end
  end
  
  class Snail < Animal
    def makeSound
      "..." # Silencieux 🐌
    end
  
    # Méthode spécifique : se déplace lentement
    def moveSlowly
      "Avance très lentement... 🐌"
    end
  end
  
  # EXERCICE 3: Interfaces - Comportements
  module Swimmer
    def swim
      raise NotImplementedError, "Cette méthode doit être implémentée"
    end
  end
  
  module Flyer
    def fly
      raise NotImplementedError, "Cette méthode doit être implémentée"
    end
  end
  
  module Predator
    def hunt(prey)
      raise NotImplementedError, "Cette méthode doit être implémentée"
    end
  end
  
  class Duck < Animal
    include Swimmer
    include Flyer
  
    def makeSound
      "Coin coin ! 🦆"
    end
  
    def swim
      "Nage dans la mare 🏊"
    end
  
    def fly
      "Vole dans les airs ✈️"
    end
  end
  
  class Pike < Animal
    include Swimmer
    include Predator
  
    def makeSound
      "Bloup bloup ! 🐟"
    end
  
    def swim
      "Nage rapidement dans l'eau 🏊"
    end
  
    # Chasse une proie (Animal)
    def hunt(prey)
      "Chasse #{prey.class.name} ! 🎣"
    end
  end
  
  # Accepte n'importe quelle créature qui implémente Swimmer
  def makeSwim(creature)
    creature.swim
  end
  
  # EXERCICE 4: Observer + Strategy - Météo et comportements
  class ActiveBehavior
    def act
      "Est actif et explore 🌞"
    end
  end
  
  class SleepingBehavior
    def act
      "Dort paisiblement 😴"
    end
  end
  
  class HidingBehavior
    def act
      "Se cache pour se protéger 🏠"
    end
  end
  
  class NightActiveBehavior
    def act
      "Devient actif la nuit 🌙"
    end
  end
  
  module WeatherObserver
    # Notifie un changement de météo
    def onWeatherChange(weather, temperature = 20)
      raise NotImplementedError, "Cette méthode doit être implémentée"
    end
  end
  
  class Weather
    attr_reader :current_weather, :temperature
  
    def initialize
      @observers = []
      @current_weather = "sunny"
      @temperature = 20
    end
  
    # Ajoute un observateur
    def add_observer(observer)
      @observers << observer
    end
  
    # Retire un observateur
    def remove_observer(observer)
      @observers.delete(observer)
    end
  
    # Change la météo et notifie tous les observateurs
    def set_weather(weather, temperature = 20)
      @current_weather = weather
      @temperature = temperature
      notify_observers
    end
  
    private
  
    # Notifie tous les observateurs du changement
    def notify_observers
      @observers.each do |observer|
        observer.onWeatherChange(@current_weather, @temperature)
      end
    end
  end
  
  class AdaptiveCreature
    include WeatherObserver
  
    attr_reader :name
  
    def initialize(name, weather)
      @name = name
      @weather = weather
      @behavior = ActiveBehavior.new
      @weather.add_observer(self)
      update_behavior(@weather.current_weather, @weather.temperature)
    end
  
    # Réagit aux changements de météo (Observer)
    def onWeatherChange(weather, temperature)
      update_behavior(weather, temperature)
    end
  
    # Exécute le comportement actuel (Strategy)
    def act
      "#{@name}: #{@behavior.act}"
    end
  
    private
  
    # Change de stratégie selon la météo et la température
    def update_behavior(weather, temperature)
      case weather
      when "sunny"
        @behavior = ActiveBehavior.new
      when "rainy"
        @behavior = SleepingBehavior.new
      when "stormy"
        @behavior = HidingBehavior.new
      when "night"
        if @name == "Chauve-souris" || @name == "Hibou"
          @behavior = NightActiveBehavior.new
        else
          @behavior = SleepingBehavior.new
        end
      end
  
      # Influence de la température
      if temperature < 5
        @behavior = HidingBehavior.new if weather != "stormy"
      elsif temperature > 35
        @behavior = SleepingBehavior.new if weather == "sunny"
      end
    end
  end
  
  class NocturnalCreature < AdaptiveCreature
    private
  
    # Comportement différent : actif la nuit, dort le jour
    def update_behavior(weather, temperature)
      case weather
      when "night"
        @behavior = NightActiveBehavior.new
      when "sunny"
        @behavior = SleepingBehavior.new
      when "rainy"
        @behavior = SleepingBehavior.new
      when "stormy"
        @behavior = HidingBehavior.new
      end
    end
  end
  
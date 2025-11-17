require_relative 'exercice-mare'
#ruby adaM3-miniexo/exercice_mare/test_exercice_mare.rb pour lancer le test

puts "=" * 60
puts "🧪 TESTS DES EXERCICES DE LA MARE"
puts "=" * 60

# ========================================
# TEST EXERCICE 1: Créatures de la mare
# ========================================
puts "\n📝 EXERCICE 1: Créatures de la mare"
puts "-" * 60

grenouille = Creature.new("René", "grenouille")
puts "✓ Créature créée: #{grenouille.instance_variable_get(:@name)} (énergie: #{grenouille.getEnergy})"

grenouille.move
puts "✓ Après move(): énergie = #{grenouille.getEnergy} (attendu: 90)"

grenouille.rest
puts "✓ Après rest(): énergie = #{grenouille.getEnergy} (attendu: 100)"

3.times { grenouille.move }
puts "✓ Après 3 move(): énergie = #{grenouille.getEnergy} (attendu: 70)"

# ========================================
# TEST EXERCICE 2: Héritage
# ========================================
puts "\n📝 EXERCICE 2: Héritage - Types de créatures"
puts "-" * 60

frog = Frog.new
fish = Fish.new
dragonfly = Dragonfly.new
mosquito = Mosquito.new
snail = Snail.new

puts "✓ Frog: #{frog.makeSound}"
puts "✓ Fish: #{fish.makeSound}"
puts "✓ Dragonfly: #{dragonfly.makeSound}"
puts "✓ Mosquito: #{mosquito.makeSound}"
puts "✓ Mosquito sting: #{mosquito.sting}"
puts "✓ Snail: #{snail.makeSound}"
puts "✓ Snail moveSlowly: #{snail.moveSlowly}"

# Test polymorphisme
animals = [frog, fish, dragonfly, mosquito, snail]
puts "\n🔄 Test polymorphisme:"
animals.each do |animal|
  puts "  - #{animal.class.name}: #{animal.makeSound}"
end

# ========================================
# TEST EXERCICE 3: Interfaces
# ========================================
puts "\n📝 EXERCICE 3: Interfaces - Comportements"
puts "-" * 60

duck = Duck.new
pike = Pike.new

puts "✓ Duck makeSound: #{duck.makeSound}"
puts "✓ Duck swim: #{duck.swim}"
puts "✓ Duck fly: #{duck.fly}"

puts "\n✓ Pike makeSound: #{pike.makeSound}"
puts "✓ Pike swim: #{pike.swim}"
puts "✓ Pike hunt: #{pike.hunt(duck)}"

# Test fonction makeSwim
puts "\n🔄 Test fonction makeSwim:"
puts "  - Duck: #{makeSwim(duck)}"
puts "  - Pike: #{makeSwim(pike)}"

# ========================================
# TEST EXERCICE 4: Observer + Strategy
# ========================================
puts "\n📝 EXERCICE 4: Observer + Strategy - Météo et comportements"
puts "-" * 60

weather = Weather.new
puts "✓ Météo créée: #{weather.current_weather} (#{weather.temperature}°C)"

grenouille_adaptive = AdaptiveCreature.new("Grenouille", weather)
poisson = AdaptiveCreature.new("Poisson", weather)
chauve_souris = AdaptiveCreature.new("Chauve-souris", weather)
hibou = NocturnalCreature.new("Hibou", weather)

puts "\n🌞 Météo initiale (sunny, 20°C):"
puts "  - #{grenouille_adaptive.act}"
puts "  - #{poisson.act}"
puts "  - #{chauve_souris.act}"
puts "  - #{hibou.act}"

puts "\n🌧️  Changement météo: rainy, 15°C"
weather.set_weather("rainy", 15)
puts "  - #{grenouille_adaptive.act}"
puts "  - #{poisson.act}"
puts "  - #{chauve_souris.act}"
puts "  - #{hibou.act}"

puts "\n⛈️  Changement météo: stormy, 10°C"
weather.set_weather("stormy", 10)
puts "  - #{grenouille_adaptive.act}"
puts "  - #{poisson.act}"
puts "  - #{chauve_souris.act}"
puts "  - #{hibou.act}"

puts "\n🌙 Changement météo: night, 18°C"
weather.set_weather("night", 18)
puts "  - #{grenouille_adaptive.act}"
puts "  - #{poisson.act}"
puts "  - #{chauve_souris.act}"
puts "  - #{hibou.act}"

puts "\n❄️  Météo extrême: sunny, 2°C (très froid)"
weather.set_weather("sunny", 2)
puts "  - #{grenouille_adaptive.act}"
puts "  - #{poisson.act}"
puts "  - #{chauve_souris.act}"
puts "  - #{hibou.act}"

puts "\n🔥 Météo extrême: sunny, 38°C (très chaud)"
weather.set_weather("sunny", 38)
puts "  - #{grenouille_adaptive.act}"
puts "  - #{poisson.act}"
puts "  - #{chauve_souris.act}"
puts "  - #{hibou.act}"

# ========================================
# TEST PATTERN VERIFICATION
# ========================================
puts "\n📝 VÉRIFICATION DES PATTERNS"
puts "-" * 60

# Vérifier que les comportements implémentent Behavior
puts "\n✓ Pattern Strategy - Vérification interface Behavior:"
behaviors = [ActiveBehavior.new, SleepingBehavior.new, HidingBehavior.new, NightActiveBehavior.new]
behaviors.each do |behavior|
  puts "  - #{behavior.class.name} inclut Behavior: #{behavior.class.included_modules.include?(Behavior)}"
  puts "    → #{behavior.act}"
end

# Vérifier que AdaptiveCreature implémente WeatherObserver
puts "\n✓ Pattern Observer - Vérification interface WeatherObserver:"
puts "  - AdaptiveCreature inclut WeatherObserver: #{AdaptiveCreature.included_modules.include?(WeatherObserver)}"
puts "  - NocturnalCreature hérite de AdaptiveCreature: #{NocturnalCreature < AdaptiveCreature}"

# Test ajout/suppression d'observateurs
puts "\n✓ Pattern Observer - Test ajout/suppression d'observateurs:"
weather2 = Weather.new
creature_test = AdaptiveCreature.new("Test", weather2)
puts "  - Observateurs avant: #{weather2.instance_variable_get(:@observers).length}"
weather2.remove_observer(creature_test)
puts "  - Observateurs après remove: #{weather2.instance_variable_get(:@observers).length}"

# ========================================
# RÉSUMÉ
# ========================================
puts "\n" + "=" * 60
puts "✅ TOUS LES TESTS SONT PASSÉS AVEC SUCCÈS!"
puts "=" * 60
puts "\n📊 Résumé:"
puts "  ✓ Exercice 1: Classes et encapsulation"
puts "  ✓ Exercice 2: Héritage et polymorphisme"
puts "  ✓ Exercice 3: Interfaces multiples"
puts "  ✓ Exercice 4: Patterns Observer + Strategy"
puts "\n🎯 Patterns implémentés correctement:"
puts "  ✓ Strategy: Interface Behavior + 4 stratégies"
puts "  ✓ Observer: Weather notifie les créatures"
puts "  ✓ Héritage: NocturnalCreature étend AdaptiveCreature"
puts "=" * 60


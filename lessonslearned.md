### Should this variable be global, class, instance, or local?
* Choose global if anything anywhere needs it, e.g. different types of classes
* Choose class if you want shared between a class and its subclasses
* Choose class instance variables if it only needs to belong to only one class

### Instance method wasn't seeing instance variable, why not?
* Because the instance variables need to be declared in initialize, when an instance is made
* class variable was fine outside of intialize because it belongs to a class, not an instance

### Constant vs Global
* Makes more sense to make the win_sequences variable a constant, since it has no reason to change, rather than a class variable. Constants can be accessed the same as a class variable anyway -- just need to access with scope resolution operator, e.g., `Class::CONSTANT`

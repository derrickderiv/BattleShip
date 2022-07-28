import 'dart:math';

abstract class SpaceShip {
  double health = 0;
  double firePower = 0;

  SpaceShip(this.health, this.firePower);

  void strike(double enemyDA);
  void hasDestroyed();
}

/// document
class ArmoredSpaceShip extends SpaceShip {
  ArmoredSpaceShip({health, firePower}) : super(health, firePower);

  @override
  void strike(double enemyDA) {
    final random = Random();
    int rng = 1 + random.nextInt(40);
    double strike = rng / 100;
    double damage = enemyDA - (enemyDA * strike);
    health = health - damage;
    print('The High Speed Spaceship Attacking Armor Space Ship');
    print('Damage Has Been Caused: $damage');

    hasDestroyed();
  }

  @override
  void hasDestroyed() {
    if (health <= 0) {
      print('');
      print('Armor Space Ship Has Been Destroyed Now');
      print('High Speed Spaceship Has Win This Game !');
    } else {
      print('The Armor Space Ship Present Health: $health');
      print('');
    }
  }
}

/// document
class HighSpeedSpaceShip extends SpaceShip {
  HighSpeedSpaceShip({health, firePower}) : super(health, firePower);

  @override
  void strike(double enemyDA) {
    final random = Random();
    bool rng = random.nextBool();
    print('Armor Spaceship Is Attacking High Speed Spaceship');
    if (rng == true) {
      health = health - enemyDA;
      print('Damage Has Caused: $enemyDA');
    } else {
      print('Dodged, No Damage Has Been Caused !');
    }

    hasDestroyed();
  }

  @override
  void hasDestroyed() {
    if (health <= 0) {
      print('');
      print('High Speed Spaceship Has Been Destroyed');
      print('Armor Spaceship Has Win This Game !');
    } else {
      print('Remaining Health: $health');
      print('');
    }
  }
}

/// document
class BattleField {
  void startBattle(SpaceShip sp1, SpaceShip sp2) async {
    while (sp1.health > 0 && sp2.health > 0) {
      await Future.delayed(Duration(seconds: 1), () {
        final random = Random();
        int rng = random.nextInt(2);
        if (rng <= 0) {
          sp1.strike(sp2.firePower);
        } else {
          sp2.strike(sp1.firePower);
        }
      });
    }
  }
}

/// entry point
void main() {
  ArmoredSpaceShip ship1 = ArmoredSpaceShip(health: 1000.0, firePower: 50.0);

  HighSpeedSpaceShip ship2 = HighSpeedSpaceShip(health: 200.0, firePower: 250.0);

  BattleField().startBattle(ship1, ship2);
}
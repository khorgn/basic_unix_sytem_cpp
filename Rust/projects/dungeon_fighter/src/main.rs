fn main() {
    println!("Hello, world!");
}

struct Creature {
    current_life: u32,
    max_life: u32,
    strength: u32,
}

impl Creature {
    fn new(life: u32, strength: u32) -> Creature {
        Creature {
            max_life: life,
            current_life: life,
            strength,
        }
    }

    fn hit(&self, creature: &mut Creature) -> bool {
        if creature.current_life > self.strength {
            creature.current_life -= self.strength;
            false
        } else {
            creature.current_life = 0;
            true
        }
    }
}

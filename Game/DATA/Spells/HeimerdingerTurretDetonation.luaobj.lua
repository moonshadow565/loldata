PersistsThroughDeath = true
NonDispellable = true
BuffOnDeathBuildingBlocks = {
  {
    Function = BBForEachUnitInTargetArea,
    Params = {
      AttackerVar = "Owner",
      CenterVar = "Owner",
      Range = 20000,
      Flags = "AffectFriends AffectMinions ",
      IteratorVar = "Unit"
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Unit",
          AttackerVar = "Owner",
          BuffName = "H28GEvolutionTurret"
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              TargetVar = "Unit",
              Damage = 1000,
              DamageType = PHYSICAL_DAMAGE,
              SourceDamageType = DAMAGESOURCE_RAW,
              PercentOfAttack = 1,
              SpellDamageRatio = 1,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturret"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "h28gevolutionturret"
    }
  }
}

PersistsThroughDeath = true
NonDispellable = true
BuffOnDeathBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Nothing",
      BuffName = "YorickReviveAllySelf"
    },
    SubBlocks = {
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Nothing",
          BuffName = "YorickRADelay"
        },
        SubBlocks = {
          {
            Function = BBForEachUnitInTargetArea,
            Params = {
              AttackerVar = "Owner",
              CenterVar = "Owner",
              Range = 20000,
              Flags = "AffectFriends AffectMinions ",
              IteratorVar = "Unit",
              InclusiveBuffFilter = true
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
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Unit",
                      Damage = 1000,
                      DamageType = PHYSICAL_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_RAW,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 1,
                      PhysicalDamageRatio = 0,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  }
                }
              }
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
      Name = "yorickreviveallyself"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickradelay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturret"
    }
  }
}

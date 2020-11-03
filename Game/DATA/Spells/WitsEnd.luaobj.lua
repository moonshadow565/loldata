BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "HitResult",
      Value2 = HIT_Dodge,
      CompareOp = CO_NOT_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "HitResult",
          Value2 = HIT_Miss,
          CompareOp = CO_NOT_EQUAL
        },
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
            SubBlocks = {
              {
                Function = BBIf,
                Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
              },
              {
                Function = BBElse,
                Params = {},
                SubBlocks = {
                  {
                    Function = BBIf,
                    Params = {Src1Var = "Attacker", CompareOp = CO_IS_NOT_HERO},
                    SubBlocks = {
                      {
                        Function = BBGetPetOwner,
                        Params = {PetVar = "Attacker", DestVar = "Attacker"}
                      }
                    }
                  },
                  {
                    Function = BBApplyDamage,
                    Params = {
                      AttackerVar = "Attacker",
                      CallForHelpAttackerVar = "Attacker",
                      TargetVar = "Target",
                      Damage = 42,
                      DamageType = MAGIC_DAMAGE,
                      SourceDamageType = DAMAGESOURCE_PROC,
                      PercentOfAttack = 1,
                      SpellDamageRatio = 0,
                      PhysicalDamageRatio = 1,
                      IgnoreDamageIncreaseMods = false,
                      IgnoreDamageCrit = false
                    }
                  },
                  {
                    Function = BBIncPAR,
                    Params = {
                      TargetVar = "Target",
                      Delta = -42,
                      PARType = PAR_MANA
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

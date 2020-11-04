TargetExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Pantheon_CertainDeath"
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {Src1Var = "Target", CompareOp = CO_IS_NOT_TURRET},
            SubBlocks = {
              {
                Function = BBGetManaOrHealth,
                Params = {
                  DestVar = "TarHP",
                  OwnerVar = "Target",
                  Function = GetHealthPercent
                }
              },
              {
                Function = BBIf,
                Params = {
                  Src1Var = "TarHP",
                  Value2 = 0.2,
                  CompareOp = CO_LESS_THAN_OR_EQUAL
                },
                SubBlocks = {
                  {
                    Function = BBSetVarInTable,
                    Params = {DestVar = "HitResult", SrcValue = HIT_Critical}
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetBaseAttackDamage,
      TargetVar = "Owner",
      DestVar = "BaseDamage"
    }
  },
  {
    Function = BBApplyDamage,
    Params = {
      AttackerVar = "Attacker",
      TargetVar = "Target",
      Damage = 0,
      DamageVar = "BaseDamage",
      DamageType = PHYSICAL_DAMAGE,
      SourceDamageType = DAMAGESOURCE_DEFAULT,
      PercentOfAttack = 1,
      SpellDamageRatio = 1,
      IgnoreDamageIncreaseMods = false,
      IgnoreDamageCrit = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "pantheon_certaindeath"
    }
  }
}

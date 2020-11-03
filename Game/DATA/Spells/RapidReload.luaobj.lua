BuffTextureName = "Corki_RapidReload.dds"
BuffName = "RapidReload"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
PersistsThroughDeath = true
NonDispellable = true
BuffOnHitUnitBuildingBlocks = {
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
            Function = BBMath,
            Params = {
              Src2Var = "DamageAmount",
              Src1Value = 0.1,
              Src2Value = 0,
              DestVar = "TrueDamageAmount",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBGetPAROrHealth,
            Params = {
              DestVar = "Temp1",
              OwnerVar = "Target",
              Function = GetHealth,
              PARType = PAR_MANA
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "TrueDamageAmount",
              Src2Var = "Temp1",
              CompareOp = CO_GREATER_THAN
            },
            SubBlocks = {
              {
                Function = BBMath,
                Params = {
                  Src1Var = "Temp1",
                  Src1Value = 0,
                  Src2Value = 1,
                  DestVar = "TrueDamageAmount",
                  MathOp = MO_SUBTRACT
                }
              },
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "TrueDamageAmount",
                  DamageType = TRUE_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_DEFAULT,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 1,
                  IgnoreDamageIncreaseMods = false,
                  IgnoreDamageCrit = false
                }
              }
            }
          },
          {
            Function = BBElse,
            Params = {},
            SubBlocks = {
              {
                Function = BBApplyDamage,
                Params = {
                  AttackerVar = "Attacker",
                  TargetVar = "Target",
                  Damage = 0,
                  DamageVar = "TrueDamageAmount",
                  DamageType = TRUE_DAMAGE,
                  SourceDamageType = DAMAGESOURCE_DEFAULT,
                  PercentOfAttack = 1,
                  SpellDamageRatio = 0,
                  PhysicalDamageRatio = 1,
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

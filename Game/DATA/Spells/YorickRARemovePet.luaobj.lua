PersistsThroughDeath = true
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetBuffRemainingDuration,
    Params = {
      DestVar = "Duration",
      TargetVar = "Owner",
      BuffName = "YorickRARemovePet"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Duration",
      Value2 = 0.5,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Attacker",
          AttackerVar = "Owner",
          BuffName = "YorickRAPetBuff2"
        },
        SubBlocks = {
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Attacker",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Attacker",
              Damage = 9999,
              DamageType = TRUE_DAMAGE,
              SourceDamageType = DAMAGESOURCE_INTERNALRAW,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
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
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickraremovepet"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "yorickrapetbuff2"
    }
  }
}

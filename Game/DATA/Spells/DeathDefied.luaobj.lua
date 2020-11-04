BuffTextureName = "Lich_Untransmutable.dds"
BuffName = "Death Defied"
PersistsThroughDeath = true
NonDispellable = true
BuffOnDeathBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_TYPE_HERO},
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "BecomeZombie",
          SrcValue = true
        }
      }
    }
  }
}
BuffOnZombieBuildingBlocks = {
  {
    Function = BBIfNotHasBuff,
    Params = {
      OwnerVar = "Owner",
      CasterVar = "Owner",
      BuffName = "DeathDefiedBuff"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "DeathDefiedBuff",
          BuffAddType = BUFF_RENEW_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_CombatEnchancer,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 7,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      }
    }
  }
}
BuffOnPreDamageBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "DeathDefiedBuff"
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DamageAmount",
          SrcValue = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "deathdefiedbuff"
    }
  }
}

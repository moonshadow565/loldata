NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
ChannelDuration = 1
BuffTextureName = "GragasDrunkenRage.dds"
BuffName = "GragasDrunkenRage"
AutoBuffActivateEffect = "gragas_drunkenRage_attack_buf.troy"
AutoBuffActivateAttachBoneName = "L_BUFFBONE_GLB_HAND_LOC"
AutoBuffActivateEffect2 = "gragas_drunkenRage_attack_buf.troy"
AutoBuffActivateAttachBoneName2 = "R_BUFFBONE_GLB_HAND_LOC"
AutoCooldownByLevel = {
  50,
  50,
  50,
  50,
  50
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ManaTick",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      PARType = PAR_MANA,
      DeltaVar = "ManaTick",
      DeltaVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      PARType = PAR_MANA,
      DeltaVar = "ManaTick",
      DeltaVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GragasDrunkenRage"
    }
  }
}
ChannelingStartBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GragasBodySlamSelfSlow"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "GragasBodySlamSelfSlow"
        }
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ManaTick",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        20,
        27.5,
        35,
        42.5,
        50
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Heal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
ChannelingSuccessStopBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageIncrease",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        30,
        40,
        50,
        60,
        70
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "DamageReduction",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        0.1,
        0.12,
        0.14,
        0.16,
        0.18
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GragasDrunkenRageSelf",
      BuffAddType = BUFF_STACKS_AND_RENEWS,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 20,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GragasDrunkenRage"
    }
  }
}
ChannelingCancelStopBuildingBlocks = {
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "GragasDrunkenRage"
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasdrunkenrage"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasbodyslamselfslow"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "gragasdrunkenrageself"
    }
  }
}

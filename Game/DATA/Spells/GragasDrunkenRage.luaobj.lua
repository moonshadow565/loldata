NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
ChannelDuration = 1.5
BuffTextureName = "GragasDrunkenRage.dds"
BuffName = "GragasDrunkenRage"
AutoBuffActivateEffect = "gragas_drunkenRage_attack_buf.troy"
AutoBuffActivateAttachBoneName = "L_hand"
AutoBuffActivateEffect2 = "gragas_drunkenRage_attack_buf.troy"
AutoBuffActivateAttachBoneName2 = "R_hand"
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
    Function = BBIncMana,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
      DeltaVar = "ManaTick",
      DeltaVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIncMana,
    Params = {
      TargetVar = "Owner",
      Delta = 0,
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
        25,
        30,
        35,
        40,
        45
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffAddType = BUFF_RENEW_EXISTING,
      BuffType = BUFF_Heal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 1.5,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
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
        20,
        30,
        40,
        50,
        60
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
        0.14,
        0.18,
        0.22,
        0.26
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
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 25,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0
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

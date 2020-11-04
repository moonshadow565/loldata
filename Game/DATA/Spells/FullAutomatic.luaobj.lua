NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Twitch_Clone.dds"
BuffName = "Full Automatic"
AutoBuffActivateEffect = "twitch_ambush_buf.troy"
AutoBuffActivateAttachBoneName = "R_hand"
AutoBuffActivateEffect2 = "twitch_ambush_buf.troy"
AutoBuffActivateAttachBoneName2 = "L_hand"
AutoBuffActivateEffect3 = "twitch_ambush_buf_02.troy"
AutoCooldownByLevel = {
  90,
  75,
  60
}
SpellFXOverrideSkins = {
  "GangsterTwitch"
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "numAttacks",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "bonusDamage",
      RequiredVarTable = "InstanceVars"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = false}
  },
  {
    Function = BBSpellBuffRemoveStacks,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "TwitchSprayAndPray",
      NumStacks = 0
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatAttackRangeMod,
      TargetVar = "Owner",
      Delta = 375
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "bonusDamage",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "numAttacks",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        5,
        6,
        7
      }
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "bonusDamage",
      DestVarTable = "NextBuffVars",
      SrcValueByLevel = {
        15,
        25,
        35
      }
    }
  },
  {
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 0,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 0,
      AutoAttackSpellLevelVar = "Level",
      CancelAttack = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 12,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Attacker",
      AttackerVar = "Attacker",
      BuffName = "TwitchSprayAndPray",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = false,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 10,
      NumberOfStacks = 0,
      NumberOfStacksVar = "numAttacks",
      NumberOfStacksVarTable = "NextBuffVars",
      Duration = 12,
      BuffVarsTable = "NextBuffVars",
      TickRate = 0,
      CanMitigateDuration = false
    }
  }
}
BuffOnLaunchMissileBuildingBlocks = {
  {
    Function = BBMath,
    Params = {
      Src1Var = "numAttacks",
      Src1VarTable = "InstanceVars",
      Src1Value = 0,
      Src2Value = 1,
      DestVar = "numAttacks",
      DestVarTable = "InstanceVars",
      MathOp = MO_SUBTRACT
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "TwitchSprayAndPray"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "numAttacks",
      Src1VarTable = "InstanceVars",
      Value2 = 0,
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  }
}

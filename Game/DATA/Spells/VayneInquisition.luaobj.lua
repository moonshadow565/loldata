NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Vayne_Inquisition.dds"
BuffName = "VayneInquisition"
AutoBuffActivateEffect = "vayne_ult_primary_buf.troy"
AutoBuffActivateAttachBoneName = "C_BUFFBONE_GLB_CHEST_LOC"
AutoBuffActivateEffect2 = "vayne_ult_primary_buf_02.troy"
AutoBuffActivateAttachBoneName2 = "C_BUFFBONE_GLB_CENTER_LOC"
AutoBuffActivateEffect3 = "vayne_ult_primary_buf_03.troy"
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = ""
AutoBuffActivateAttachBoneName4 = ""
AutoCooldownByLevel = {
  75,
  75,
  75,
  18,
  14
}
OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "ADMod",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "VayneTumbleBonus"
    },
    SubBlocks = {
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Idle1",
          OverrideAnim = "Idle_TumbleUlt",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Idle2",
          OverrideAnim = "Idle_TumbleUlt",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Idle3",
          OverrideAnim = "Idle_TumbleUlt",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Idle4",
          OverrideAnim = "Idle_TumbleUlt",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Attack1",
          OverrideAnim = "Attack_TumbleUlt",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Attack2",
          OverrideAnim = "Attack_TumbleUlt",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Crit",
          OverrideAnim = "Attack_TumbleUlt",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Spell3",
          OverrideAnim = "Attack_TumbleUlt",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Run",
          OverrideAnim = "Run_TumbleUlt",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAutoAttack,
        Params = {
          SpellSlot = 5,
          SlotType = ExtraSlots,
          OwnerVar = "Owner",
          AutoAttackSpellLevel = 1,
          CancelAttack = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Idle1",
          OverrideAnim = "Idle_Ult",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Idle2",
          OverrideAnim = "Idle_Ult",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Idle3",
          OverrideAnim = "Idle_Ult",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Idle4",
          OverrideAnim = "Idle_Ult",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Attack1",
          OverrideAnim = "Attack_Ult",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Attack2",
          OverrideAnim = "Attack_Ult",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Crit",
          OverrideAnim = "Attack_Ult",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Spell3",
          OverrideAnim = "Attack_Ult",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Run",
          OverrideAnim = "Run_Ult",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAutoAttack,
        Params = {
          SpellSlot = 4,
          SlotType = ExtraSlots,
          OwnerVar = "Owner",
          AutoAttackSpellLevel = 1,
          CancelAttack = false
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "VayneTumbleBonus"
    },
    SubBlocks = {
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Idle1",
          OverrideAnim = "Idle_Tumble",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Idle2",
          OverrideAnim = "Idle_Tumble",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Idle3",
          OverrideAnim = "Idle_Tumble",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Idle4",
          OverrideAnim = "Idle_Tumble",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Attack1",
          OverrideAnim = "Attack_Tumble",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Attack2",
          OverrideAnim = "Attack_Tumble",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Crit",
          OverrideAnim = "Attack_Tumble",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Spell3", OwnerVar = "Owner"}
      },
      {
        Function = BBOverrideAnimation,
        Params = {
          ToOverrideAnim = "Run",
          OverrideAnim = "Run_Tumble",
          OwnerVar = "Owner"
        }
      },
      {
        Function = BBOverrideAutoAttack,
        Params = {
          SpellSlot = 2,
          SlotType = ExtraSlots,
          OwnerVar = "Owner",
          AutoAttackSpellLevel = 1,
          CancelAttack = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Idle1", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Idle2", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Idle3", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Idle4", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Attack1", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Attack2", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Crit", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Spell3", OwnerVar = "Owner"}
      },
      {
        Function = BBClearOverrideAnimation,
        Params = {ToOverrideAnim = "Run", OwnerVar = "Owner"}
      },
      {
        Function = BBRemoveOverrideAutoAttack,
        Params = {OwnerVar = "Owner", CancelAttack = false}
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBIncStat,
    Params = {
      Stat = IncFlatPhysicalDamageMod,
      TargetVar = "Owner",
      DeltaVar = "ADMod",
      DeltaVarTable = "InstanceVars",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "ADMod",
      DestVarTable = "NextBuffVars",
      SrcValue = 0,
      SrcValueByLevel = {
        25,
        40,
        55
      }
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Target",
      AttackerVar = "Attacker",
      BuffName = "VayneInquisition",
      BuffAddType = BUFF_RENEW_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_CombatEnchancer,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationByLevel = {
        8,
        10,
        12
      },
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vaynetumblebonus"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vayneinquisition"
    }
  }
}

BuffTextureName = "Vayne_Tumble.dds"
BuffName = "VayneTumble"
AutoBuffActivateEffect = "vayne_Q_buf.troy"
AutoBuffActivateAttachBoneName = "l_hand"
AutoBuffActivateEffect2 = "vayne_Q_buf.troy"
AutoBuffActivateAttachBoneName2 = "r_hand"
AutoBuffActivateEffect3 = "vayne_q_cas.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "VayneInquisition"
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
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SpellCooldown",
      SrcValueByLevel = {
        6,
        5,
        4,
        3,
        2
      }
    }
  },
  {
    Function = BBGetStat,
    Params = {
      Stat = GetPercentCooldownMod,
      TargetVar = "Owner",
      DestVar = "CooldownStat"
    }
  },
  {
    Function = BBMath,
    Params = {
      Src2Var = "CooldownStat",
      Src1Value = 1,
      Src2Value = 0,
      DestVar = "Multiplier",
      MathOp = MO_ADD
    }
  },
  {
    Function = BBMath,
    Params = {
      Src1Var = "Multiplier",
      Src2Var = "SpellCooldown",
      Src1Value = 0,
      Src2Value = 0,
      DestVar = "NewCooldown",
      MathOp = MO_MULTIPLY
    }
  },
  {
    Function = BBSetSlotSpellCooldownTime,
    Params = {
      SrcVar = "NewCooldown",
      SrcValue = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      SpellSlotValue = 0,
      OwnerVar = "Owner"
    }
  },
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = false}
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "VayneInquisition"
    },
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
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "vayneinquisition"
    }
  }
}

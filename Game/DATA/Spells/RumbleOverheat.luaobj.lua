BuffTextureName = "Rumble_Junkyard Titan3.dds"
BuffName = "RumbleOverheat"
AutoBuffActivateEffect = "Silence_glb.troy"
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = "rumble_overheat.troy"
AutoBuffActivateAttachBoneName2 = "spine"
AutoBuffActivateEffect3 = "rumble_overheat_lite.troy"
AutoBuffActivateAttachBoneName3 = ""
AutoBuffActivateEffect4 = "rumble_overheat_lite_02.troy"
AutoBuffActivateAttachBoneName4 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetPARColorOverride,
    Params = {
      SpellSlotOwnerVar = "Owner",
      ColorR = 255,
      ColorG = 0,
      ColorB = 0,
      ColorA = 255,
      FadeR = 175,
      FadeG = 0,
      FadeB = 0,
      FadeA = 255
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 0,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = true
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "RumbleGrenadeCounter"
    },
    SubBlocks = {
      {
        Function = BBSealSpellSlot,
        Params = {
          SpellSlot = 2,
          SpellbookType = SPELLBOOK_CHAMPION,
          SlotType = SpellSlots,
          TargetVar = "Owner",
          State = false
        }
      }
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = 100,
      PARType = PAR_OTHER
    }
  },
  {
    Function = BBGetBuffRemainingDuration,
    Params = {
      DestVar = "Duration",
      TargetVar = "Owner",
      BuffName = "RumbleOverheat"
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "RumbleOverheatSound",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Aura,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "Duration",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = true
    }
  },
  {
    Function = BBSpellBuffAdd,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Attacker",
      BuffName = "RumbleHeatDelay",
      BuffAddType = BUFF_REPLACE_EXISTING,
      StacksExclusive = true,
      BuffType = BUFF_Internal,
      MaxStack = 1,
      NumberOfStacks = 1,
      Duration = 0,
      BuffVarsTable = "NextBuffVars",
      DurationVar = "Duration",
      TickRate = 0,
      CanMitigateDuration = false,
      IsHiddenOnClient = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "punchdmg",
      DestVarTable = "InstanceVars",
      SrcValue = 0
    }
  },
  {
    Function = BBOverrideAutoAttack,
    Params = {
      SpellSlot = 5,
      SlotType = ExtraSlots,
      OwnerVar = "Owner",
      AutoAttackSpellLevel = 1,
      CancelAttack = true
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
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 1,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSealSpellSlot,
    Params = {
      SpellSlot = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      TargetVar = "Owner",
      State = false
    }
  },
  {
    Function = BBSpellBuffRemove,
    Params = {
      TargetVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "Infuse"
    }
  },
  {
    Function = BBIncPAR,
    Params = {
      TargetVar = "Owner",
      Delta = -20,
      PARType = PAR_OTHER
    }
  },
  {
    Function = BBRemoveOverrideAutoAttack,
    Params = {OwnerVar = "Owner", CancelAttack = true}
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = false}
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBExecutePeriodically,
    Params = {
      TimeBetweenExecutions = 0.5,
      TrackTimeVar = "LastTimeExecuted",
      TrackTimeVarTable = "InstanceVars",
      ExecuteImmediately = false
    },
    SubBlocks = {
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = -10,
          PARType = PAR_OTHER
        }
      },
      {
        Function = BBIfNotHasBuff,
        Params = {
          OwnerVar = "Owner",
          CasterVar = "Owner",
          BuffName = "RumbleGrenadeCounter"
        },
        SubBlocks = {
          {
            Function = BBSealSpellSlot,
            Params = {
              SpellSlot = 2,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              TargetVar = "Owner",
              State = true
            }
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBSealSpellSlot,
            Params = {
              SpellSlot = 2,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              TargetVar = "Owner",
              State = false
            }
          }
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Target",
          AttackerVar = "Attacker",
          BuffName = "RumbleHeatingUp",
          BuffAddType = BUFF_REPLACE_EXISTING,
          StacksExclusive = true,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 0,
          CanMitigateDuration = false,
          IsHiddenOnClient = false
        }
      },
      {
        Function = BBGetLevel,
        Params = {TargetVar = "Owner", DestVar = "Level"}
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "punchdmg",
          DestVarTable = "InstanceVars",
          SrcValueByLevel = {
            25,
            30,
            35,
            40,
            45,
            50,
            55,
            60,
            65,
            70,
            75,
            80,
            85,
            90,
            95,
            100,
            105,
            110
          }
        }
      },
      {
        Function = BBSetBuffToolTipVar,
        Params = {
          Value = 0,
          ValueVar = "punchdmg",
          ValueVarTable = "InstanceVars",
          Index = 1
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumblegrenadecounter"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleoverheat"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleoverheatsound"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleheatdelay"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "infuse"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "rumbleheatingup"
    }
  }
}

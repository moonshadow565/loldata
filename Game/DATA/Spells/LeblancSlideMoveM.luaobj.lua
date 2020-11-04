OnBuffActivateBuildingBlocks = {
  {
    Function = BBRequireVar,
    Params = {
      RequiredVar = "OwnerPos",
      RequiredVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "doNotTeleport",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "OwnerPos",
      SrcVar = "OwnerPos",
      SrcVarTable = "InstanceVars"
    }
  },
  {
    Function = BBSetSpell,
    Params = {
      SlotNumber = 3,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "LeblancSlideReturnM",
      TargetVar = "Owner"
    }
  },
  {
    Function = BBGetTeamID,
    Params = {TargetVar = "Owner", DestVar = "CasterID"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "CasterID",
      Value2 = TEAM_ORDER,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "OwnerPos",
          EffectName = "Leblanc_displacement_blink_indicator_ult.troy",
          Flags = 0,
          EffectIDVar = "YellowIndicator",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_ORDER,
          FOWVisibilityRadius = 250,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Nothing",
          PosVar = "OwnerPos",
          EffectName = "Leblanc_displacement_blink_indicator_ult.troy",
          Flags = 0,
          EffectIDVar = "YellowIndicator",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Owner",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = false,
          FOWTeam = TEAM_CHAOS,
          FOWVisibilityRadius = 250,
          SendIfOnScreenOrDiscard = false
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSpellEffectRemove,
    Params = {
      EffectIDVar = "YellowIndicator",
      EffectIDVarTable = "InstanceVars"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "doNotTeleport",
      Src1VarTable = "InstanceVars",
      Value2 = false,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Expired",
          Value2 = false,
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "OwnerPos",
              SrcVar = "OwnerPos",
              SrcVarTable = "InstanceVars"
            }
          },
          {
            Function = BBGetUnitPosition,
            Params = {
              UnitVar = "Owner",
              PositionVar = "CurrentPosition"
            }
          },
          {
            Function = BBGetTeamID,
            Params = {TargetVar = "Owner", DestVar = "CasterID"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "CurrentPosition",
              EffectName = "leBlanc_displacement_cas_ult.troy",
              Flags = 0,
              EffectIDVar = "SmokeBomb1",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "CasterID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
            }
          },
          {
            Function = BBTeleportToPosition,
            Params = {OwnerVar = "Owner", CastPositionName = "OwnerPos"}
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "OwnerPos",
              EffectName = "leBlanc_displacement_cas_ult.troy",
              Flags = 0,
              EffectIDVar = "SmokeBomb2",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "CasterID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Nothing",
              PosVar = "OwnerPos",
              EffectName = "Leblanc_displacement_blink_return_trigger_ult.troy",
              Flags = 0,
              EffectIDVar = "a",
              TargetObjectVar = "Owner",
              TargetPosVar = "OwnerPos",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWTeamOverrideVar = "CasterID",
              FOWVisibilityRadius = 10,
              SendIfOnScreenOrDiscard = true
            }
          }
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "LeblancSlideWallFixM"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "LeblancSlideWallFixM"
        }
      }
    }
  }
}
BuffOnSpellCastBuildingBlocks = {
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "SpellName", Info = GetSpellName}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "SpellName",
      Value2 = "leblancslidereturnm",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Owner",
          AttackerVar = "Nothing",
          BuffName = "LeblancSlideM"
        },
        SubBlocks = {
          {
            Function = BBGetSlotSpellInfo,
            Params = {
              DestVar = "CooldownTime",
              SpellSlotValue = 1,
              SpellbookType = SPELLBOOK_CHAMPION,
              SlotType = SpellSlots,
              OwnerVar = "Owner",
              Function = GetSlotSpellCooldownTime
            }
          },
          {
            Function = BBIf,
            Params = {
              Src1Var = "CooldownTime",
              Value2 = 0,
              CompareOp = CO_LESS_THAN_OR_EQUAL
            },
            SubBlocks = {
              {
                Function = BBSetSlotSpellCooldownTime,
                Params = {
                  SrcValue = 0.25,
                  SpellbookType = SPELLBOOK_CHAMPION,
                  SlotType = SpellSlots,
                  SpellSlotValue = 1,
                  OwnerVar = "Owner"
                }
              }
            }
          }
        }
      },
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      }
    }
  },
  {
    Function = BBGetCastInfo,
    Params = {DestVar = "spellSlot", Info = GetSpellSlot}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "spellSlot",
      Value2 = 1,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "doNotTeleport",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      },
      {
        Function = BBSpellBuffRemoveCurrent,
        Params = {TargetVar = "Owner"}
      },
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "LeblancSlideM"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancslidereturnm"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_displacement_blink_indicator_ult.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_displacement_cas_ult.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_displacement_blink_return_trigger_ult.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancslidewallfixm"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancslidem"
    }
  }
}

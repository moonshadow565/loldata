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
      SlotNumber = 1,
      SlotType = SpellSlots,
      SlotBook = SPELLBOOK_CHAMPION,
      SpellName = "leblancslidereturn",
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
          EffectName = "Leblanc_displacement_blink_indicator.troy",
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
          EffectName = "Leblanc_displacement_blink_indicator.troy",
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
              EffectName = "leBlanc_displacement_cas.troy",
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
              EffectName = "leBlanc_displacement_cas.troy",
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
              EffectName = "Leblanc_displacement_blink_return_trigger.troy",
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
      BuffName = "LeblancSlideWallFix"
    },
    SubBlocks = {
      {
        Function = BBSpellBuffRemove,
        Params = {
          TargetVar = "Owner",
          AttackerVar = "Owner",
          BuffName = "LeblancSlideWallFix"
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
      Value2 = "leblancslidereturn",
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
              SpellSlotValue = 3,
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
                  SpellSlotValue = 3,
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
      Value2 = 3,
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
          BuffName = "LeblancSlide"
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancslidereturn"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_displacement_blink_indicator.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_displacement_cas.troy"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "leblanc_displacement_blink_return_trigger.troy"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancslidewallfix"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancslidem"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "leblancslide"
    }
  }
}

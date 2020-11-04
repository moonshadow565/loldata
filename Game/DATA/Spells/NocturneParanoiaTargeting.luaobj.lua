NotSingleTargetSpell = true
DoesntTriggerSpellCasts = false
BuffTextureName = "Nocturne_Paranoia.dds"
BuffName = "NocturneParanoiaTarget"
AutoBuffActivateEffect = ""
AutoBuffActivateEvent = "DeathsCaress_buf.prt"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "PartCreated",
      DestVarTable = "InstanceVars",
      SrcValue = false
    }
  },
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 3,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Attacker",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "Range",
      DestVarTable = "InstanceVars",
      SrcValueByLevel = {
        2500,
        3250,
        4000
      }
    }
  },
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Owner",
      ObjectVar2 = "Attacker"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Distance",
      Src2Var = "Range",
      Src2VarTable = "InstanceVars",
      CompareOp = CO_LESS_THAN_OR_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectCreate,
        Params = {
          BindObjectVar = "Owner",
          EffectName = "NocturneParanoiaTargeting.troy",
          Flags = 0,
          EffectIDVar = "tpar",
          EffectIDVarTable = "InstanceVars",
          TargetObjectVar = "Owner",
          SpecificUnitOnlyVar = "Attacker",
          SpecificTeamOnly = TEAM_UNKNOWN,
          UseSpecificUnit = true,
          FOWTeam = TEAM_UNKNOWN,
          FOWVisibilityRadius = 0,
          SendIfOnScreenOrDiscard = false
        }
      },
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "PartCreated",
          DestVarTable = "InstanceVars",
          SrcValue = true
        }
      }
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "PartCreated",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSpellEffectRemove,
        Params = {
          EffectIDVar = "tpar",
          EffectIDVarTable = "InstanceVars"
        }
      }
    }
  }
}
BuffOnUpdateActionsBuildingBlocks = {
  {
    Function = BBDistanceBetweenObjects,
    Params = {
      DestVar = "Distance",
      ObjectVar1 = "Owner",
      ObjectVar2 = "Attacker"
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "PartCreated",
      Src1VarTable = "InstanceVars",
      Value2 = true,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Src2Var = "Range",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_GREATER_THAN
        },
        SubBlocks = {
          {
            Function = BBSpellEffectRemove,
            Params = {
              EffectIDVar = "tpar",
              EffectIDVarTable = "InstanceVars"
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "PartCreated",
              DestVarTable = "InstanceVars",
              SrcValue = false
            }
          }
        }
      }
    }
  },
  {
    Function = BBElse,
    Params = {},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "Distance",
          Src2Var = "Range",
          Src2VarTable = "InstanceVars",
          CompareOp = CO_LESS_THAN_OR_EQUAL
        },
        SubBlocks = {
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Owner",
              EffectName = "NocturneParanoiaTargeting.troy",
              Flags = 0,
              EffectIDVar = "tpar",
              EffectIDVarTable = "InstanceVars",
              TargetObjectVar = "Owner",
              SpecificUnitOnlyVar = "Attacker",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = true,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBSetVarInTable,
            Params = {
              DestVar = "PartCreated",
              DestVarTable = "InstanceVars",
              SrcValue = true
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "nocturneparanoiatargeting.troy"
    }
  }
}

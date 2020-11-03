BuffTextureName = "OriannaPassive.dds"
BuffName = "OrianaGhostSelf"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
AutoBuffActivateEffect2 = ""
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "SelfParticle",
      DestVarTable = "InstanceVars",
      SrcVar = "SelfParticle"
    }
  },
  {
    Function = BBSetSpellOffsetTarget,
    Params = {
      SlotNumber = 1,
      SlotType = SpellSlots,
      SpellName = "JunkName",
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      OffsetTargetVar = "Owner"
    }
  },
  {
    Function = BBSetSpellOffsetTarget,
    Params = {
      SlotNumber = 1,
      SlotType = SpellSlots,
      SpellName = "JunkName",
      SpellbookType = SPELLBOOK_CHAMPION,
      OwnerVar = "Owner",
      OffsetTargetVar = "Owner"
    }
  },
  {
    Function = BBGetUnitSkinName,
    Params = {TargetVar = "Owner", DestVar = "MyName"}
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "MyName",
      Value2 = "Oriana",
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
        SubBlocks = {
          {
            Function = BBIf,
            Params = {
              Src1Var = "GhostInitialized",
              Src1VarTable = "CharVars",
              Value2 = true,
              CompareOp = CO_EQUAL
            },
            SubBlocks = {
              {
                Function = BBPopCharacterData,
                Params = {
                  TargetVar = "Owner",
                  IDVar = "TempSkin",
                  IDVarTable = "CharVars"
                }
              }
            }
          }
        }
      }
    }
  },
  {
    Function = BBSpellBuffClear,
    Params = {
      TargetVar = "Owner",
      BuffName = "OriannaBallTracker"
    }
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBGetUnitSkinName,
    Params = {TargetVar = "Owner", DestVar = "MyName"}
  },
  {
    Function = BBSetVarInTable,
    Params = {
      DestVar = "GhostInitialized",
      DestVarTable = "CharVars",
      SrcValue = true
    }
  },
  {
    Function = BBIf,
    Params = {Src1Var = "Owner", CompareOp = CO_IS_NOT_DEAD},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {
          Src1Var = "MyName",
          Value2 = "Oriana",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBPushCharacterData,
            Params = {
              SkinName = "Oriana_noBall",
              TargetVar = "Owner",
              IDVar = "TempSkin",
              IDVarTable = "CharVars",
              OverrideSpells = false
            }
          }
        }
      },
      {
        Function = BBIf,
        Params = {
          Src1Var = "MyName",
          Value2 = "oriana",
          CompareOp = CO_EQUAL
        },
        SubBlocks = {
          {
            Function = BBPushCharacterData,
            Params = {
              SkinName = "Oriana_noBall",
              TargetVar = "Owner",
              IDVar = "TempSkin",
              IDVarTable = "CharVars",
              OverrideSpells = false
            }
          }
        }
      }
    }
  }
}
BuffOnUpdateStatsBuildingBlocks = {
  {
    Function = BBGetSlotSpellInfo,
    Params = {
      DestVar = "Level",
      SpellSlotValue = 2,
      SpellbookType = SPELLBOOK_CHAMPION,
      SlotType = SpellSlots,
      OwnerVar = "Owner",
      Function = GetSlotSpellLevel
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Level",
      Value2 = 0,
      CompareOp = CO_GREATER_THAN
    },
    SubBlocks = {
      {
        Function = BBSetVarInTable,
        Params = {
          DestVar = "DefenseBonus",
          SrcValueByLevel = {
            10,
            15,
            20,
            25,
            30
          }
        }
      },
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatArmorMod,
          TargetVar = "Owner",
          DeltaVar = "DefenseBonus",
          Delta = 0
        }
      },
      {
        Function = BBIncStat,
        Params = {
          Stat = IncFlatSpellBlockMod,
          TargetVar = "Owner",
          DeltaVar = "DefenseBonus",
          Delta = 0
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "oriannaballtracker"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "oriana_noball"
    }
  }
}

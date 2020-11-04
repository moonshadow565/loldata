NotSingleTargetSpell = false
DoesntTriggerSpellCasts = false
BuffTextureName = "Heimerdinger_UPGRADE.dds"
BuffName = "UPGRADE!!!"
AutoBuffActivateEffect = ""
AutoBuffActivateAttachBoneName = ""
BuffOnUpdateStatsBuildingBlocks = {
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
      DestVar = "CooldownBonus",
      SrcValue = 0,
      SrcValueByLevel = {
        -0.1,
        -0.15,
        -0.2
      }
    }
  },
  {
    Function = BBIncStat,
    Params = {
      Stat = IncPercentCooldownMod,
      TargetVar = "Owner",
      DeltaVar = "CooldownBonus",
      Delta = 0
    }
  }
}
TargetExecuteBuildingBlocks = {
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Target",
      AttackerVar = "Owner",
      BuffName = "H28GEvolutionTurret"
    },
    SubBlocks = {
      {
        Function = BBIfHasBuff,
        Params = {
          OwnerVar = "Target",
          AttackerVar = "Owner",
          BuffName = "UrAniumRounds"
        },
        SubBlocks = {
          {
            Function = BBIncHealth,
            Params = {
              TargetVar = "Target",
              Delta = 1000,
              HealerVar = "Owner"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "ExplosiveCartridges",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 20000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "UPGRADE!!!Proof",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 10,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "heimerdinger_turret_upgrade_heal_explosive.troy",
              Flags = 0,
              EffectIDVar = "poofin",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBPushCharacterData,
            Params = {
              SkinName = "H28GEvolutionTurretLvl3",
              TargetVar = "Target",
              IDVar = "CasterID",
              IDVarTable = "InstanceVars",
              OverrideSpells = false
            }
          },
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_Upgrade_Lvl3"
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Target",
              AttackerVar = "Owner",
              BuffName = "MarkerOne"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Level1",
                  DestVarTable = "CharVars",
                  SrcValue = 3
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Target",
              AttackerVar = "Owner",
              BuffName = "MarkerTwo"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Level2",
                  DestVarTable = "CharVars",
                  SrcValue = 3
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Target",
              AttackerVar = "Owner",
              BuffName = "MarkerThree"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Level3",
                  DestVarTable = "CharVars",
                  SrcValue = 3
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Target",
              AttackerVar = "Owner",
              BuffName = "MarkerFour"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Level4",
                  DestVarTable = "CharVars",
                  SrcValue = 3
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Target",
              AttackerVar = "Owner",
              BuffName = "MarkerFive"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Level5",
                  DestVarTable = "CharVars",
                  SrcValue = 3
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Target",
              AttackerVar = "Owner",
              BuffName = "MarkerSix"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Level6",
                  DestVarTable = "CharVars",
                  SrcValue = 3
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
            Function = BBIncHealth,
            Params = {
              TargetVar = "Target",
              Delta = 1000,
              HealerVar = "Owner"
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "UrAniumRounds",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_Aura,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 20000,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "UPGRADE!!!Proof",
              BuffAddType = BUFF_RENEW_EXISTING,
              BuffType = BUFF_CombatEnchancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 10,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0
            }
          },
          {
            Function = BBSpellEffectCreate,
            Params = {
              BindObjectVar = "Target",
              EffectName = "heimerdinger_turret_upgrade_heal_uranium.troy",
              Flags = 0,
              EffectIDVar = "poofin",
              TargetObjectVar = "Target",
              SpecificUnitOnlyVar = "Owner",
              SpecificTeamOnly = TEAM_UNKNOWN,
              UseSpecificUnit = false,
              FOWTeam = TEAM_UNKNOWN,
              FOWVisibilityRadius = 0,
              SendIfOnScreenOrDiscard = false
            }
          },
          {
            Function = BBPushCharacterData,
            Params = {
              SkinName = "H28GEvolutionTurretLvl2",
              TargetVar = "Target",
              IDVar = "CasterID",
              IDVarTable = "InstanceVars",
              OverrideSpells = false
            }
          },
          {
            Function = BBSay,
            Params = {
              OwnerVar = "Owner",
              ToSay = "game_lua_Upgrade_Lvl2"
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Target",
              AttackerVar = "Owner",
              BuffName = "MarkerOne"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Level1",
                  DestVarTable = "CharVars",
                  SrcValue = 2
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Target",
              AttackerVar = "Owner",
              BuffName = "MarkerTwo"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Level2",
                  DestVarTable = "CharVars",
                  SrcValue = 2
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Target",
              AttackerVar = "Owner",
              BuffName = "MarkerThree"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Level3",
                  DestVarTable = "CharVars",
                  SrcValue = 2
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Target",
              AttackerVar = "Owner",
              BuffName = "MarkerFour"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Level4",
                  DestVarTable = "CharVars",
                  SrcValue = 2
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Target",
              AttackerVar = "Owner",
              BuffName = "MarkerFive"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Level5",
                  DestVarTable = "CharVars",
                  SrcValue = 2
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Target",
              AttackerVar = "Owner",
              BuffName = "MarkerSix"
            },
            SubBlocks = {
              {
                Function = BBSetVarInTable,
                Params = {
                  DestVar = "Level6",
                  DestVarTable = "CharVars",
                  SrcValue = 2
                }
              }
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
        Function = BBSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "game_lua_Upgrade_tar"
        }
      },
      {
        Function = BBIncPAR,
        Params = {
          TargetVar = "Owner",
          Delta = 120,
          PARType = PAR_MANA
        }
      },
      {
        Function = BBSpellBuffAdd,
        Params = {
          TargetVar = "Attacker",
          AttackerVar = "Attacker",
          BuffName = "RefreshUltimate",
          BuffAddType = BUFF_RENEW_EXISTING,
          BuffType = BUFF_Internal,
          MaxStack = 1,
          NumberOfStacks = 1,
          Duration = 1,
          BuffVarsTable = "NextBuffVars",
          TickRate = 1
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "h28gevolutionturret"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "h28gevolutionturret"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "uraniumrounds"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "explosivecartridges"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "upgrade!!!proof"
    }
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_turret_upgrade_heal_explosive.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "h28gevolutionturretlvl3"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "markerone"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "markertwo"}
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "markerthree"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "markerfour"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "markerfive"}
  },
  {
    Function = BBPreloadSpell,
    Params = {Name = "markersix"}
  },
  {
    Function = BBPreloadParticle,
    Params = {
      Name = "heimerdinger_turret_upgrade_heal_uranium.troy"
    }
  },
  {
    Function = BBPreloadCharacter,
    Params = {
      Name = "h28gevolutionturretlvl2"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "refreshultimate"
    }
  }
}

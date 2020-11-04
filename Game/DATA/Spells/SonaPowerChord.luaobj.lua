BuffTextureName = "Sona_PowerChordCharged.dds"
BuffName = "SonaPowerChordReady"
AutoBuffActivateEffect = "SonaPowerChordReady.troy"
OnBuffActivateBuildingBlocks = {
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = true}
  }
}
OnBuffDeactivateBuildingBlocks = {
  {
    Function = BBSetDodgePiercing,
    Params = {TargetVar = "Owner", Value = false}
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SonaAriaofPerseverance"
    },
    SubBlocks = {
      {
        Function = BBOverrideAutoAttack,
        Params = {
          SpellSlot = 3,
          SlotType = ExtraSlots,
          OwnerVar = "Owner",
          AutoAttackSpellLevel = 1,
          CancelAttack = true
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SonaHymnofValor"
    },
    SubBlocks = {
      {
        Function = BBOverrideAutoAttack,
        Params = {
          SpellSlot = 4,
          SlotType = ExtraSlots,
          OwnerVar = "Owner",
          AutoAttackSpellLevel = 1,
          CancelAttack = true
        }
      }
    }
  },
  {
    Function = BBIfHasBuff,
    Params = {
      OwnerVar = "Owner",
      AttackerVar = "Owner",
      BuffName = "SonaSongofDiscord"
    },
    SubBlocks = {
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
  },
  {
    Function = BBCancelAutoAttack,
    Params = {TargetVar = "Owner", Reset = false}
  }
}
BuffOnHitUnitBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET}
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBGetLevel,
            Params = {
              TargetVar = "Owner",
              DestVar = "LevelDamage"
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "LevelDamage",
              Src1Value = 0,
              Src2Value = 15,
              DestVar = "BonusDamage",
              MathOp = MO_MULTIPLY
            }
          },
          {
            Function = BBMath,
            Params = {
              Src1Var = "BonusDamage",
              Src1Value = 0,
              Src2Value = 50,
              DestVar = "TotalDamage",
              MathOp = MO_ADD
            }
          },
          {
            Function = BBBreakSpellShields,
            Params = {TargetVar = "Target"}
          },
          {
            Function = BBApplyDamage,
            Params = {
              AttackerVar = "Owner",
              CallForHelpAttackerVar = "Attacker",
              TargetVar = "Target",
              Damage = 0,
              DamageVar = "TotalDamage",
              DamageType = MAGIC_DAMAGE,
              SourceDamageType = DAMAGESOURCE_SPELL,
              PercentOfAttack = 1,
              SpellDamageRatio = 0,
              PhysicalDamageRatio = 0,
              IgnoreDamageIncreaseMods = false,
              IgnoreDamageCrit = false
            }
          },
          {
            Function = BBSpellBuffAdd,
            Params = {
              TargetVar = "Target",
              AttackerVar = "Owner",
              BuffName = "SonaPowerChordDebuff",
              BuffAddType = BUFF_STACKS_AND_OVERLAPS,
              StacksExclusive = true,
              BuffType = BUFF_CombatDehancer,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 3,
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
              BuffName = "IfHasBuffCheck",
              BuffAddType = BUFF_REPLACE_EXISTING,
              StacksExclusive = true,
              BuffType = BUFF_Internal,
              MaxStack = 1,
              NumberOfStacks = 1,
              Duration = 0.25,
              BuffVarsTable = "NextBuffVars",
              TickRate = 0,
              CanMitigateDuration = false
            }
          },
          {
            Function = BBSpellBuffRemove,
            Params = {
              TargetVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "SonaPowerChord"
            }
          }
        }
      }
    }
  }
}
BuffOnPreAttackBuildingBlocks = {
  {
    Function = BBIf,
    Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_AI},
    SubBlocks = {
      {
        Function = BBIf,
        Params = {Src1Var = "Target", CompareOp = CO_IS_TYPE_TURRET},
        SubBlocks = {
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "SonaAriaofPerseverance"
            },
            SubBlocks = {
              {
                Function = BBOverrideAutoAttack,
                Params = {
                  SpellSlot = 3,
                  SlotType = ExtraSlots,
                  OwnerVar = "Owner",
                  AutoAttackSpellLevel = 1,
                  CancelAttack = true
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "SonaHymnofValor"
            },
            SubBlocks = {
              {
                Function = BBOverrideAutoAttack,
                Params = {
                  SpellSlot = 4,
                  SlotType = ExtraSlots,
                  OwnerVar = "Owner",
                  AutoAttackSpellLevel = 1,
                  CancelAttack = true
                }
              }
            }
          },
          {
            Function = BBIfHasBuff,
            Params = {
              OwnerVar = "Owner",
              AttackerVar = "Owner",
              BuffName = "SonaSongofDiscord"
            },
            SubBlocks = {
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
          }
        }
      },
      {
        Function = BBElse,
        Params = {},
        SubBlocks = {
          {
            Function = BBOverrideAutoAttack,
            Params = {
              SpellSlot = 2,
              SlotType = ExtraSlots,
              OwnerVar = "Owner",
              AutoAttackSpellLevel = 1,
              CancelAttack = true
            }
          }
        }
      }
    }
  }
}
PreLoadBuildingBlocks = {
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonaariaofperseverance"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonahymnofvalor"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonasongofdiscord"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonapowerchorddebuff"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "ifhasbuffcheck"
    }
  },
  {
    Function = BBPreloadSpell,
    Params = {
      Name = "sonapowerchord"
    }
  }
}

BuffOnAllowAddBuildingBlocks = {
  {
    Function = BBIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Snare,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Net,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Slow,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Fear,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Sleep,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Stun,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Taunt,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  },
  {
    Function = BBIf,
    Params = {
      Src1Var = "Type",
      Value2 = BUFF_Suppression,
      CompareOp = CO_EQUAL
    },
    SubBlocks = {
      {
        Function = BBSay,
        Params = {
          OwnerVar = "Owner",
          ToSay = "game_lua_Ragnarok"
        }
      },
      {
        Function = BBSetReturnValue,
        Params = {SrcValue = false}
      }
    }
  }
}

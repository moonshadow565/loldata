function BotAffixesOnInit()
  PreloadSpell("NightmareBotAffixManager")
  ApplyPersistentBuffToAllChampions("NightmareBotAffixManager", false)
end

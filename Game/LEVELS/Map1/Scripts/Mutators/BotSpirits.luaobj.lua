function BotSpiritsOnInit()
  PreloadSpell("NightmareBotSpiritManager")
  ApplyPersistentBuffToAllChampions("NightmareBotSpiritManager", false)
  ApplyPersistentBuffToAllChampions("NightmareBotSpiritPreloader", false)
end

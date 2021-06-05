txd = engineLoadTXD("alpha.txd") 
dff = engineLoadDFF("alpha.dff") 

engineImportTXD(txd, 415) 
engineReplaceModel(dff, 415, true) 








#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Feb 25 13:49:09 2025

@author: bouchet
"""

from plotnine import ggplot, aes, geom_line,labs
import pandas as pd 




df=pd.read_excel("/Users/bouchet/Documents/Cours/Cours /AgroParisTech /3A/AMI2B/ML avancé/test_budget_.xlsx")
df["B"]=pd.Categorical(df["B"])
plot=(ggplot(df,aes(x="epoch", y="Val",color="B" ))
      
      + geom_line() 

        + labs(title=r"Performances d'entrainement en fonction du budget $\beta$",
               x="Epochs", 
               y="accuracy (%)", 
               color=r"Budget $\beta$ (%) ")  # Titre de la légende
      )


df2=df[df["epoch"]==5]
df2["B"]=df2["B"].astype("float")

plot2=(ggplot(df2,aes(x="B", y="Val" ))
      
      + geom_line() 

        + labs(title=r"Performances d'entrainement en fonction du budget $\beta$",
               x="budget", 
               y="accuracy (%) (à epoch=5)", 
               )  # Titre de la légende
      )


print(plot)
print(plot2)



#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Feb 25 13:49:09 2025

@author: bouchet
"""

from plotnine import ggplot, aes, geom_line,labs,ylim,geom_point,scale_x_continuous
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


# print(plot)
# print(plot2)




def plot3(df : pd.DataFrame) :
            
        plot2=(ggplot(df,aes(x="alpha", y="acc" ))
              
              + geom_line(color="blue") 
              + geom_point(shape='x', color="blue")
              + ylim(75,82)
              + scale_x_continuous(breaks=[0.1, 0.3, 0.5, 0.7, 0.9]) 
                + labs(title=r"Performances d'entrainement en fonction de alpha",
                       x="alpha", 
                       y="accuracy (%) (à epoch=5)", 
                       )  # Titre de la légende
              )
        print(plot2)
        
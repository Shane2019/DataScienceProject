# -*- coding: utf-8 -*-
"""
Created on Thu Feb 28 12:20:45 2019

@author: Shane
"""

import pandas as pd


speciesgroup1 ="https://raw.githubusercontent.com/Shane2019/DataScienceProject/master/Speciesgroup1.csv"
speciesgroup1 =pd.read_csv(speciesgroup1)
print(speciesgroup1)

speciesgroup2 ="https://raw.githubusercontent.com/Shane2019/DataScienceProject/master/Speciesgroup2.csv"
speciesgroup2 =pd.read_csv(speciesgroup2)
print(speciesgroup2)

# Time Series Analysis: SpeciesGroup1
speciesgroup1.plot(kind = 'bar', legend = True, color=['r','g','b'], title = 'Abundance of Species Recorded')

# Time Series Analysis: SpeciesGroup2
speciesgroup2.plot(kind = 'bar', legend = True, color=['r','g','b'], title = 'Abundance of Species Recorded')

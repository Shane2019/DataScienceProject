# -*- coding: utf-8 -*-
"""
Created on Tue Feb 26 15:43:23 2019

@author: Shane
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.sankey import Sankey

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

speciesdf ="https://raw.githubusercontent.com/Shane2019/DataScienceProject/master/Species.csv"
speciesdf =pd.read_csv(speciesdf)
print(speciesdf)

str(speciesdf)
speciesdf.plot.bar(stacked=True);
speciesdf.columns = ["Species","Abundance","Date"]

#Subset Analysis By Date
# 1. 01/02/2019
species_0102 = speciesdf.loc[speciesdf['Date'] == '01/02/2019']
species_0102 = species_0102[['Species','Abundance']]
print(species_0102)
species_0102.set_index('Species',drop=True,inplace=True)
species_0102.plot(kind = 'bar', legend = True, color=['r'], title = 'Abundance of Species Recorded on 01/02/2019')

# 2. 08/02/2019
species_0108 = speciesdf.loc[speciesdf['Date'] == '08/02/2019']
species_0108 = species_0108[['Species','Abundance']]
print(species_0108)
species_0108.set_index('Species',drop=True,inplace=True)
species_0108.plot(kind = 'bar', legend = True, color=['g'], title = 'Abundance of Species Recorded on 08/02/2019')

# 3.15/02/2019
species_1502 = speciesdf.loc[speciesdf['Date'] == '15/02/2019']
species_1502 = species_1502[['Species','Abundance']]
print(species_1502)
species_1502.set_index('Species',drop=True,inplace=True)
species_1502.plot(kind = 'bar', legend = True, color=['b'], title = 'Abundance of Species Recorded on 15/02/2019')

# 4. 22/02/2019
species_2202 = speciesdf.loc[speciesdf['Date'] == '22/02/2019']
species_2202 = species_2202[['Species','Abundance']]
print(species_2202)
species_2202.set_index('Species',drop=True,inplace=True)
species_2202.plot(kind = 'bar', legend = True, color=['r'], title = 'Abundance of Species Recorded on 22/02/2019')

# 5. 01/03/2019
species_0103 = speciesdf.loc[speciesdf['Date'] == '01/03/2019']
species_0103 = species_0103[['Species','Abundance']]
print(species_0103)
species_0103.set_index('Species',drop=True,inplace=True)
species_0103.plot(kind = 'bar', legend = True, color=['g'], title = 'Abundance of Species Recorded on 01/03/2019')

# 6. 08/03/2019
species_0803 = speciesdf.loc[speciesdf['Date'] == '08/03/2019']
species_0803 = species_0803[['Species','Abundance']]
print(species_0803)
species_0803.set_index('Species',drop=True,inplace=True)
species_0803.plot(kind = 'bar', legend = True, color=['g'], title = 'Abundance of Species Recorded on 08/03/2019')


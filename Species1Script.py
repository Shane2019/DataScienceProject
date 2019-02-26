# -*- coding: utf-8 -*-
"""
Created on Tue Feb 26 15:43:23 2019

@author: Shane
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.sankey import Sankey




colors = {"Ruminococcus": 'r', "Coprococcus": 'b', "Lachnospiraceae": 'g', "S24-7":'y',"Ruminococcaceae":'o'}

# Data Cleaning: Split into two tables
species_t1 = pd.read_csv(r'C:\Users\Shane\Desktop\Data Science Project\SpeciesT1.csv', sep = ',')
species_t2 = pd.read_csv(r'C:\Users\Shane\Desktop\Data Science Project\SpeciesT2.csv', sep = ',')
print(species_t1)
species_t1.columns = ["Species","Abundance","Date"]

# Alternate Data Cleaning: Split into two tables
species_t1 = pd.read_csv(r'C:\Users\Shane\Desktop\Data Science Project\SpeciesT1_2.csv', sep = ',')
species_t2 = pd.read_csv(r'C:\Users\Shane\Desktop\Data Science Project\SpeciesT2_2.csv', sep = ',')
print(species_t1)
species_t1.columns = ["Species","01/02/2019","15/02/2019","01/03/2019"]
species_t2.columns = ["Species","08/02/2019","22/02/2019","08/03/2019"]

# Time Series Analysis: Species_T1
species_t1.set_index('Species',drop=True,inplace=True)
species_t1.plot(kind = 'bar', legend = True, color=['r','g','b'], title = 'Abundance of Species Recorded')

# Time Series Analysis: Species_T2
species_t2.set_index('Species',drop=True,inplace=True)
species_t2.plot(kind = 'bar', legend = True, color=['r','g','b'], title = 'Abundance of Species Recorded')



speciesdf = pd.read_csv(r'C:\Users\Shane\Desktop\Data Science Project\Species3.csv', sep = ',')
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




np.savetxt(r'C:\Users\Shane\Desktop\Data Science Project\Species4.csv', speciesdf, fmt='%s', delimiter = ',')

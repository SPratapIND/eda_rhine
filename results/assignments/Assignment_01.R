temperatures = c(3, 6, 10, 14)
weights = c(1, 0.8, 1.2, 1)
library(data.table)
aa = function(x, y) {
  x * y
}
results <- aa(temperatures, weights)

Explorer’s Questions
1.	How big is the Rhine catchment (km2)?
  Ans - 185,000 km2

2.	If it rained for one full day over the whole catchment area at 5mm/hour and all the precipitated water ended up in the river, how much would be the increase in the average river runoff?
  (Runoff, discharge, streamflow are terms that in most cases are used with the same meaning. Write a script that performs the calculation)
Ans - area = 185000 # Km sqaure
prep = 5*24 #per day
runoff = area * prep
print(runoff)

3.	(Optional) How much time does a rain drop falling at Alpine Rhine need to reach the ocean? Write a script that performs the calculation.
Ans - 
  
  4.	In the study of study of Middelkoop et al. (2001):
  a.	Which other hydroclimatic changes reported in the article and not discussed above?
  Ans - Flood, Runoff, Rainfall

b.	Can you detect three assumptions made by Middelkoop et al. (2001)?
  Ans - 
  1.	Study assumes that all water available for runoff leaves the catchment within one-time step.
2.	Global climate temperature of 2.5 Celsius (IPCC emission scenario IS92a) and ignorance of sulphate aerosols effect.
3.	To estimates precipitation extremes under changed climate conditions the number of days with precipitation assumed to remains unchanged

c.	Why Middelkoop and his colleagues made this study? Why is it important? For example, the reason for searching for a way to the Orient was that Ottoman Empire monopolized the trade routes across Asia.

Ans – Using modelling approaches, this study was performed to understand the hydrological regimes over the Rhine basin under the influence of climate change. Study was also focused to assess socioeconomic impact for the better formulation of policy recommendations for river basin management.


d.	Are there other studies that have a similar analysis over Rhine, or a similar hypothesis in other regions? (hint: use google scholar or web of science/Scopus).

Ans – Yes, M. C. Demirel et al. 2013; Middelkoop et al., 2001; Saskia C. van Pelt & Rob J. Swart 2011; Pfeiffer et al., 2017; Bergsma et al., 2010.

e.	Is there any evidence in the news about low or high flow events of Rhine since 2000?
  Ans – Yes, Demirel et al. 2013.




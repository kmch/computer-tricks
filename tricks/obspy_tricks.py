#st = read("DATA/2006364/PQ_PA65_2006364.mseed")
#print st
#st = st.select(component="E")
#tr = st[0]
#print(tr.stats)
#tr.plot(type="relative")

#travelTimePlot(min_degree=0, max_degree=50, phases=['P', 'S', 'PP'], depth=120, model='iasp91') 
#travelTimePlot()

#model = TauPyModel(model="iasp91")
#arrivals = model.get_travel_times(source_depth_in_km=55, distance_in_degree=67,phase_list=["P", "PSPSPS"])
#print(arrivals)

#metres, AB, BA = gps2DistAzimuth(0, 0, 0, 90)
#print AB

#print UTCDateTime(0)
#print UTCDateTime('2007-01-02T23:48:33.760Z')
#print UTCDateTime('2007-01-02T23:48:33.760Z')-UTCDateTime('2007-01-02T23:47:33.760Z')

#print listdir('DATA')
#raw_input('Write sth: ')
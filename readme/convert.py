import sys
reload(sys)
sys.setdefaultencoding("latin-1")

fname = 'n18811799744.sql'
with open(fname) as f:
	content = f.readlines()
	content = filter(lambda x: len(x) > 100, content)
	content = map(lambda x: x.strip().split(","), content)
	content = map(lambda x: "Hourlys.insert({deviceId: '" + x[0][14:25] + "',uploadTime: new Date('" + x[1].strip()[1:-1] + "'), airtemp:" + x[2].strip()[1:-1] + ", airhumidity:" + x[3].strip()[1:-1]+ ", atmosphericpressure:" + x[4].strip()[1:-1]+ ", soiltemp:" + x[6].strip()[1:-1]+ ", soilhumidity:" + x[7].strip()[1:-1]+ ", windspeed:" + x[8].strip()[1:-1]+ ", rainfall:" + x[11].strip()[1:-1] + "});", content)
#	Ids = map(lambda x: "Hourlys.insert({deviceId: '" + x[14:26] + "',uploadTime: ", content)
	print "\r\n".join(content)

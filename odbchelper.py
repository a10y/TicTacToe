def buildConnectionString(params) :
	return ";".join(["%s=$s" % (k,v) for k, v in params.items()])

if __name__ == "__main__" :
	myparams = {"server" : "mpilgrim", \
		    "database" : "master", \
		    "uid" : "sa", \
		    "pwd" : "secret" }
	print buildConnectionString(myParams)

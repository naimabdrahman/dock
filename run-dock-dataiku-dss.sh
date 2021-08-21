## dataiku dss no volume
docker run -dit  -p 10000:10000 --name dss --rm dataiku/dss


## dataiku dss with volume
docker run -dit  -p 10000:10000 --name dss --rm -v dataiku:/home/dataiku/dss dataiku/dss

new-item -itemtype directory images -force
$PART1="http://codh.rois.ac.jp/north-china-railway/iiif/original/"
$PART2=".tif/full/full/0/default.jpg"
#invoke-webrequest $PART1$id$PART2 -outfile $filename

foreach($id in get-content id.txt){
	$filename="images/"+$id+".jpg"
	if(test-path $filename){
		write-host("skip $filename")
	}else{
		write-host("download $filename ...")
		invoke-webrequest $PART1$id$PART2 -outfile $filename
	}
}

jekyll serve --host $IP --port $PORT --baseurl '' &
sleep 2
cd _site
polymer serve --open --hostname $IP &

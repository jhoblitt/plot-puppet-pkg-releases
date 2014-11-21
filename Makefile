el6_pkg_releases.png: pkg_releases.plot el6-all.txt  el6-by_day.txt  el6-by_min.txt
	gnuplot pkg_releases.plot

clean:
	-rm *.png *.txt

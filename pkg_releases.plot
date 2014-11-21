set title "EL6 Package Releases"
set grid
set key top right box

set xdata time
set timefmt "%Y-%m-%dT%H:%M" 
set format x "%Y-%m"
#set xrange ["2014-01-01":*]
set xrange [*:*]
# gnuplot is clever here and magically lines up on calendar months
set xtics 86400 * 30
set xtics nomirror out rotate by -45 
unset mxtics

set yrange [0:*]

# display the bin width as 10 days centered on the start of the month
# XXX trying to set it to the 'fixed' size of a month is difficult as gnuplot
# correctly places time tics relative to each other and 30 days will either
# over or underflow depending on the month
set boxwidth 86400 * 10
set style fill solid 0.5
set style data histograms
set style histogram rowstacked

set terminal png size 1920,1080
set output 'el6_pkg_releases.png'

plot 'el6-all.txt' using (strftime("%Y-%m",(timecolumn(1)))):(1.0) smooth freq title "all" with boxes, \
    'el6-by_min.txt' using (strftime("%Y-%m",(timecolumn(1)))):(1.0) smooth freq title "unique min" with boxes, \
    'el6-by_day.txt' using (strftime("%Y-%m",(timecolumn(1)))):(1.0) smooth freq title "unique day" with boxes

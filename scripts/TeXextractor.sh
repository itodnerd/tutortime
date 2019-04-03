#!/usr/bin/env python
import sys
import csv
import datetime
with open(sys.argv[1], newline='') as csvfile, open(sys.argv[2], 'w') as datafile, open(sys.argv[3], 'w') as timefile, open(sys.argv[4], 'w') as monthfile:
    totalTime = datetime.timedelta()
    linereader = csv.reader(csvfile, delimiter=',', quotechar='"')
    next(linereader)
    # 0: Day, 1: Start, 2: End, 3: Duration, 4: hierarchy path, 5: activity name, 6: notes, 7: tags
    for idx, row in enumerate(linereader):
        row[6] = row[6].replace('&', "\\&")
        print("%s & %s -- %s & %s & %s : %s \\\\ \\hline" % (row[0], row[1], row[2], row[3], row[5], row[6].replace("&", "\&")), file=datafile)
        (h, m, s) = row[3].split(':')
        totalTime += datetime.timedelta(hours=int(h), minutes=int(m), seconds=int(s) )
        if(idx==0):
            (dd,mm,yy) = row[0].split('.')
            print("%02d.%02d" %(int(mm), int(yy)), file=monthfile)
    seconds = totalTime.seconds
    days = totalTime.days
    (minutes, seconds) = divmod(seconds, 60)
    (hours, minutes) = divmod(minutes, 60)
    hours += days*24
    print("%02d:%02d:%02d" % (hours, minutes, seconds), file=timefile)



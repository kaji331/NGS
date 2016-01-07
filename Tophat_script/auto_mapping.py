#!/usr/bin/env python3

import os
import sys
import glob as gl
import itertools as it
import subprocess as sub
import multiprocessing as mul

def f(x, y):
	sub.call(["/share/home/xierf/HZY/KYSE-180_cell/Normal/tophat.sh", x, y])

def h(args):
	return(f(args[0], args[1]))

def main():
	a = os.popen("find . -name '*I_1_trimmed.fq' -print").readlines()
	b = os.popen("find . -name '*I_2_trimmed.fq' -print").readlines()
	a.sort()
	b.sort()

	pool = mul.Pool(8)
	rel = pool.map(h, it.zip_longest(a, b))

if __name__ == "__main__":
	main()

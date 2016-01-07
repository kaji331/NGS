#!/usr/bin/env python3

import os
import sys
import glob as gl
import itertools as it
import subprocess as sub
import multiprocessing as mul

def f(x):
	sub.call(["/share/home/xierf/HZY/KY049/BAM/gatk.sh", x])

def h(args):
	return(f(args[0]))

def main():
	a = os.popen("cat left.txt").readlines()
	a.sort()

	pool = mul.Pool(15)
	rel = pool.map(h, it.zip_longest(a))

if __name__ == "__main__":
	main()
